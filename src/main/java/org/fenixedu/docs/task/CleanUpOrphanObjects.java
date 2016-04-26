package org.fenixedu.docs.task;

import java.io.File;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import pt.ist.fenixframework.DomainModelParser;
import pt.ist.fenixframework.core.DmlFile;
import pt.ist.fenixframework.core.Project;
import pt.ist.fenixframework.dml.DomainClass;
import pt.ist.fenixframework.dml.DomainModel;

import com.google.common.base.Charsets;
import com.google.common.collect.HashBiMap;
import com.google.common.io.Files;

public class CleanUpOrphanObjects {

    private static DomainModel domainModel;

    private static Set<String> classNames;

    private static String dbAlias;
    private static String username;
    private static String password;

    private static Connection connection;

    public static void setUpDomainModel() throws Exception {
        Project project = Project.fromName("fenixedu-drive-webapp");
        List<URL> dmls = new ArrayList<URL>();
        for (DmlFile dmlFile : project.getFullDmlSortedList()) {
            System.out.println(dmlFile.getUrl());
            dmls.add(dmlFile.getUrl());
        }
        domainModel = DomainModelParser.getDomainModel(dmls);

        assert domainModel != null;

        Properties properties = new Properties();
        properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("fenix-framework.properties"));

        dbAlias = properties.getProperty("dbAlias");
        username = properties.getProperty("dbUsername");
        password = properties.getProperty("dbPassword");

        assert dbAlias != null;
        assert username != null;
        assert password != null;

        connection = DriverManager.getConnection("jdbc:mysql:" + dbAlias, username, password);
        connection.setAutoCommit(false);

        assert connection != null;

        classNames = new HashSet<String>();

        for (DomainClass domainClass : domainModel.getDomainClasses()) {
            classNames.add(domainClass.getFullName());
        }
    }

    public static void shutdown() throws SQLException {
        connection.close();
    }

    public static void main(String... args) throws Exception {
        setUpDomainModel();

        File output = new File("clean.sql");

        if (output.exists()) {
            System.out.println("File clean.sql exists. Delete it and restart the test");
            return;
        }

        output.createNewFile();

        StringBuilder builder = new StringBuilder();

        Set<String> allTables = new HashSet<String>();

        for (DomainClass domClass : domainModel.getDomainClasses()) {
            allTables.add(getExpectedTableName(domClass));
        }

        Set<String> tables = new HashSet<String>();

        Statement statement = connection.createStatement();

        for (String tableName : allTables) {
            ResultSet rs = statement.executeQuery("select count(distinct (OID >> 32)) from " + tableName);
            rs.next();

            if (rs.getInt(1) > 1) {
                tables.add(tableName);
            }
            rs.close();
        }

        System.out.println("Cleaning : " + tables);

        ResultSet rs = statement.executeQuery("SELECT * FROM FF$DOMAIN_CLASS_INFO");

        HashBiMap<String, Integer> classes = HashBiMap.create();

        while (rs.next()) {
            String className = rs.getString("DOMAIN_CLASS_NAME");
            if (className.startsWith("net.sourceforge")) {
                continue;
            }
            if (!classNames.contains(className)) {
                classes.put(className, rs.getInt("DOMAIN_CLASS_ID"));
            }
        }

//        StringBuilder inStatement = new StringBuilder("(");
//        for (Entry<String, Integer> entry : classes.entrySet()) {
//            if (inStatement.length() > 1) {
//                inStatement.append(",");
//            }
//            inStatement.append(entry.getValue());
//        }
//        inStatement.append(")");

        System.out.println("Processing tables");

        for (String table : tables) {
            if (table.equals("GENERIC_LOG") || table.equals("SIGNATURE_INTENTION") || table.equals("IMPORT_REGISTER")
                    || table.startsWith("FF$")) {
                continue;
            }

            String stmt = "DELETE FROM `%s` WHERE OID >> 32 IN (%s);\n";
            builder.append(String.format(stmt, table, StringUtils.join(classes.values(), ",")));
        }

        rs.close();
        statement.close();
        for (String clazz : classes.keySet()) {
            builder.append("# " + clazz + "\n");
        }

        System.out.println("Writing delete queries to clean.sql ...");
        Files.write(builder.toString(), output, Charsets.UTF_8);
        System.out.println("Done.");

        shutdown();
    }

    public static String getExpectedTableName(final DomainClass domainClass) {
        if (domainClass.getSuperclass() == null) {
            return getTableName(domainClass.getName());
        }
        return domainClass.getSuperclass() instanceof DomainClass ? getExpectedTableName((DomainClass) domainClass
                .getSuperclass()) : null;
    }

    private static String getTableName(final String name) {
        final StringBuilder stringBuilder = new StringBuilder();
        boolean isFirst = true;
        for (final char c : name.toCharArray()) {
            if (isFirst) {
                isFirst = false;
                stringBuilder.append(Character.toUpperCase(c));
            } else {
                if (Character.isUpperCase(c)) {
                    stringBuilder.append('_');
                    stringBuilder.append(c);
                } else {
                    stringBuilder.append(Character.toUpperCase(c));
                }
            }
        }
        return stringBuilder.toString();
    }
}
