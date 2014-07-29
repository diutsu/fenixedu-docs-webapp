package org.fenixedu.docs.task;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.domain.UserProfile;
import org.fenixedu.bennu.core.domain.exceptions.BennuCoreDomainException;
import org.fenixedu.bennu.scheduler.custom.CustomTask;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.CallableWithoutException;
import pt.ist.fenixframework.FenixFramework;

import com.google.common.collect.Lists;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;

public class ImportUsersTask extends CustomTask {

    private static final int PARTITION_SIZE = 1000;

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    private static final String USERS_JSON_TASK = "/Users/sfbs/Documents/docs/users.json";

    @Override
    public void runTask() throws Exception {
        JsonParser parser = new JsonParser();

        JsonObject container = parser.parse(new JsonReader(new FileReader(new File(USERS_JSON_TASK)))).getAsJsonObject();
        final JsonArray users = container.get("users").getAsJsonArray();
        taskLog("Users to import: %d\n", users.size());

        List<JsonObject> usersList = new ArrayList<>();
        users.forEach(u -> usersList.add(u.getAsJsonObject()));

        int i = 1;
        for (List<JsonObject> usersPart : Lists.partition(usersList, PARTITION_SIZE)) {
            taskLog("Importing %d\n", i++ * PARTITION_SIZE);
            createUser(usersPart);
        }

    }

    private void createUser(final List<JsonObject> users) {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                for (JsonObject user : users) {
                    final String username = user.get("username").getAsString();
                    final String name = user.get("name").getAsString();
                    try {
                        new User(username, new UserProfile(name, name, name, null, Locale.getDefault()));
                    } catch (BennuCoreDomainException e) {
                        taskLog(e.getMessage());
                    }
                }
                return null;
            }
        });
    }

}
