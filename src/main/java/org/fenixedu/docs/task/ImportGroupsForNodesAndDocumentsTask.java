package org.fenixedu.docs.task;

import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.groups.Group;
import org.fenixedu.bennu.scheduler.custom.CustomTask;
import org.fenixedu.drive.domain.AbstractFileNode;
import org.fenixedu.drive.domain.Document;

import pt.ist.fenixframework.DomainObject;
import pt.ist.fenixframework.FenixFramework;

import com.google.common.base.Strings;
import com.google.common.collect.HashBiMap;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.stream.JsonReader;

public class ImportGroupsForNodesAndDocumentsTask extends CustomTask {

    final static String IMPORT_DIR = "/Users/sfbs/Documents/drive/export/";

    @SuppressWarnings("unused")
    private static class GroupBean {
        private String name;
        private final Set<String> members;
        private String className;

        public GroupBean() {
            members = new HashSet<>();
        }

        public String getName() {
            return name;
        }

        public Set<String> getMembers() {
            return members;
        }
    }

    @SuppressWarnings("unused")
    private static class NodeBean {
        private String oid;
        private String name;
        private Integer readGroup;
        private Integer writeGroup;

        public String getDirNodeOid() {
            return oid;
        }

        public Integer getReadGroup() {
            return readGroup;
        }

        public Integer getWriteGroup() {
            return writeGroup;
        }

        public String getName() {
            return name;
        }
    }

    @Override
    public void runTask() throws Exception {
        Map<GroupBean, Integer> groupBeans;
        Map<Integer, Set<Group>> groups = new HashMap<>();

        Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create();
        FileReader groupsReader = new FileReader(new File(IMPORT_DIR + "groups.json"));

        final Map<GroupBean, Integer> map = gson.fromJson(new JsonReader(groupsReader), new TypeToken<Map<GroupBean, Integer>>() {
        }.getType());

        groupBeans = HashBiMap.create(map);

        for (Entry<GroupBean, Integer> entry : groupBeans.entrySet()) {
            final Set<String> members = entry.getKey().getMembers();
            final Set<Group> users = members.stream().map(User::findByUsername).map(Group::users).collect(Collectors.toSet());
            if (users.contains(null) || members.size() != users.size()) {
                throw new Error("Can't do it");
            }
            groups.put(entry.getValue(), users);
        }

        Set<NodeBean> nodes = new HashSet<>();
        FileReader nodesReader = new FileReader(new File(IMPORT_DIR + "nodes.json"));

        nodes = gson.fromJson(new JsonReader(nodesReader), new TypeToken<Set<NodeBean>>() {
        }.getType());

        processNodes(groups, nodes);

        FileReader documentsReader = new FileReader(new File(IMPORT_DIR + "documents.json"));

        nodes = gson.fromJson(new JsonReader(documentsReader), new TypeToken<Set<NodeBean>>() {
        }.getType());

        processNodes(groups, nodes);

    }

    private void setReadGroup(DomainObject node, Set<Group> groups) {
        if (node instanceof Document) {
            ((Document) node).setReadGroups(groups);
        }
        if (node instanceof AbstractFileNode) {
            ((AbstractFileNode) node).setReadGroups(groups);
        }
    }

    private void setWriteGroup(DomainObject node, Set<Group> groups) {
        if (node instanceof Document) {
            ((Document) node).setWriteGroups(groups);
        }
        if (node instanceof AbstractFileNode) {
            ((AbstractFileNode) node).setWriteGroups(groups);
        }
    }

//    private static Set<Integer> excludedCids = new HashSet<Integer>(Arrays.asList(new Integer[] { 1927 }));

    private void processNodes(Map<Integer, Set<Group>> groups, Set<NodeBean> nodes) {
        for (NodeBean bean : nodes) {

            if (!Strings.isNullOrEmpty(bean.oid)) {
                int cid = (int) (Long.parseLong(bean.oid) >> 32);
                if (cid != 1927) {
                    if (bean.readGroup != null || bean.writeGroup != null) {
                        DomainObject node = FenixFramework.getDomainObject(bean.oid);
                        if (FenixFramework.isDomainObjectValid(node)) {
                            if (bean.readGroup != null) {
                                setReadGroup(node, groups.get(bean.readGroup));
                            }
                            if (bean.writeGroup != null) {
                                setWriteGroup(node, groups.get(bean.writeGroup));
                            }
                        }
                    }
                }
            }
        }
    }
}