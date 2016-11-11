package com.safecard.web.vo;

/**
 * Created by ramma on 0008,10/8/2016.
 */
public class ProfileType {

    private String profileId;

    private String profileType;

    private String dateOfExpiry;

    public ProfileType(String profileId, String profileType, String dateOfExpiry){
        this.profileId = profileId;
        this.profileType = profileType;
        this.dateOfExpiry = dateOfExpiry;
    }

    public ProfileType() {
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    public String getProfileType() {
        return profileType;
    }

    public void setProfileType(String profileType) {
        this.profileType = profileType;
    }

    public String getDateOfExpiry() {
        return dateOfExpiry;
    }

    public void setDateOfExpiry(String dateOfExpiry) {
        this.dateOfExpiry = dateOfExpiry;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProfileType)) return false;

        ProfileType that = (ProfileType) o;

        if (!getProfileId().equals(that.getProfileId())) return false;
        if (!getProfileType().equals(that.getProfileType())) return false;
        return getDateOfExpiry().equals(that.getDateOfExpiry());

    }

    @Override
    public int hashCode() {
        int result = getProfileId().hashCode();
        result = 31 * result + getProfileType().hashCode();
        result = 31 * result + getDateOfExpiry().hashCode();
        return result;
    }
}
