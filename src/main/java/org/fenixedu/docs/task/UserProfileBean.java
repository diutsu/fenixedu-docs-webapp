package org.fenixedu.docs.task;

import java.util.Locale;

import org.fenixedu.bennu.core.domain.UserProfile;

import com.google.common.base.Strings;

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