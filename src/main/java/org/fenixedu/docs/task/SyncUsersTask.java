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

public class SyncUsersTask extends CustomTask {

    private static final int PARTITION_SIZE = 1000;

    private static class UserBean {
        public String username;
        public UserProfileBean profile;

        public User createUser() {
            if (profile == null) {
                return null;
            } else {
                return new User(username, profile.createUserProfile());
            }
        }
    }

    private static class UserProfileBean {
        public String givenNames;
        public String familyNames;
        public String displayName;
        public String email;
        public String preferredLocale;
        public String avatarUrl;

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

        taskLog("Users to sync: %d\n", usersList.size());

        int i = 1;
        for (List<UserBean> usersPart : Lists.partition(usersList, PARTITION_SIZE)) {
            taskLog("Importing %d\n", i++ * PARTITION_SIZE);
            updateUser(usersPart);
        }

    }

    private void updateUser(final List<UserBean> usersPart) {
        FenixFramework.getTransactionManager().withTransaction(new CallableWithoutException<Void>() {

            @Override
            public Void call() {
                for (UserBean userBean : usersPart) {
                    User user = User.findByUsername(userBean.username);
                    if (user != null) {
                        UserProfile currentProfile = user.getProfile();
                        if (userBean.profile != null) {
                            if (currentProfile == null) {
                                user.setProfile(userBean.profile.createUserProfile());
//                                taskLog("create profile for user " + user.getUsername());
                            } else {
                                userBean.profile.updateProfile(currentProfile);
//                                taskLog("update profile for user " + user.getUsername());
                            }
                        }
                    } else {
                        user = userBean.createUser();
//                        taskLog("creating user " + user.getUsername());
                    }
                }
                return null;
            }
        });
    }

}
