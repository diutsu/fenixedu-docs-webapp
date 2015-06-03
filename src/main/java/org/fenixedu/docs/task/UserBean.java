package org.fenixedu.docs.task;

import org.fenixedu.bennu.core.domain.User;

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