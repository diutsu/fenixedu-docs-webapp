package org.fenixedu.docs.task;

import java.io.File;
import java.io.FileReader;
import java.util.List;
import java.util.Locale;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.domain.UserProfile;
import org.fenixedu.bennu.scheduler.custom.CustomTask;

import pt.ist.fenixframework.Atomic.TxMode;
import pt.ist.fenixframework.CallableWithoutException;
import pt.ist.fenixframework.FenixFramework;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

public class ImportUsersTask extends CustomTask {

    private static final int PARTITION_SIZE = 1000;

    class UserBean {
        public String username;
        public UserProfileBean profile;

        public UserBean(String username, UserProfileBean profile) {
            this.username = username;
            this.profile = profile;
        }

        public User createUser() {
            if (profile == null) {
                return new User(username);
            } else {
                return new User(username, profile.createUserProfile());
            }
        }
    }

    class UserProfileBean {
        public String givenNames;
        public String familyNames;
        public String displayName;
        public String email;
        public String preferredLocale;
        public String avatarUrl;

        public UserProfileBean(String givenNames, String familyNames, String displayName, String email, String preferredLocale,
                String avatarUrl) {
            super();
            this.givenNames = givenNames;
            this.familyNames = familyNames;
            this.displayName = displayName;
            this.email = email;
            this.preferredLocale = preferredLocale;
            this.avatarUrl = avatarUrl;
        }

        public UserProfile createUserProfile() {
            final UserProfile userProfile = new UserProfile(givenNames, familyNames, displayName, email, getLocale());
            userProfile.setAvatarUrl(this.avatarUrl);
            return userProfile;
        }

        private Locale getLocale() {
            if (Strings.isNullOrEmpty(preferredLocale)) {
                return null;
            }
            return Locale.forLanguageTag(preferredLocale);
        }

        public void updateProfile(UserProfile profile) {
            profile.changeName(this.givenNames, this.familyNames, this.displayName);
            profile.setEmail(this.email);
            profile.setPreferredLocale(getLocale());
            profile.setAvatarUrl(this.avatarUrl);
        }
    }

    @Override
    public TxMode getTxMode() {
        return TxMode.READ;
    }

    private static final String USERS_JSON_TASK = "/Users/sfbs/Documents/drive/export/users.json";

    @Override
    public void runTask() throws Exception {

        final FileReader fileReader = new FileReader(new File(USERS_JSON_TASK));

        List<UserBean> usersList = new Gson().fromJson(fileReader, new TypeToken<List<UserBean>>() {
        }.getType());

        taskLog("Users to import: %d\n", usersList.size());

        int i = 1;
        for (List<UserBean> usersPart : Lists.partition(usersList, PARTITION_SIZE)) {
            taskLog("Importing %d\n", i++ * PARTITION_SIZE);
            createUser(usersPart);
        }

    }

    private void createUser(final List<UserBean> usersPart) {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                for (UserBean user : usersPart) {
                    user.createUser();
                }
                return null;
            }
        });
    }

}
