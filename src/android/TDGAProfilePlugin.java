package com.talkingdata.game;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;

import com.tendcloud.tenddata.TDGAProfile;

public class TDGAProfilePlugin extends CordovaPlugin {
    public static TDGAProfile profile;
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("setProfile")) {
            String profileId = args.getString(0);
            profile = TDGAProfile.setProfile(profileId);
            return true;
        } else if (action.equals("setProfileName")) {
            String profileName = args.getString(0);
            profile.setProfileName(profileName);
            return true;
        } else if (action.equals("setProfileType")) {
            TDGAProfile.ProfileType type = this.getType(args.getInt(0));
            profile.setProfileType(type);
            return true;
        } else if (action.equals("setLevel")) {
            int level = args.getInt(0);
            profile.setLevel(level);
            return true;
        } else if (action.equals("setGender")) {
            TDGAProfile.Gender gender = this.getGender(args.getInt(0));
            profile.setGender(gender);
            return true;
        } else if (action.equals("setAge")) {
            int age = args.getInt(0);
            profile.setAge(age);
            return true;
        } else if (action.equals("setGameServer")) {
            String gameServer = args.getString(0);
            profile.setGameServer(gameServer);
            return true;
        }
        return false;
    }
    
    private TDGAProfile.ProfileType getType(final int type) {
        switch (type) {
        case 0:
            return TDGAProfile.ProfileType.ANONYMOUS;
        case 1:
            return TDGAProfile.ProfileType.REGISTERED;
        case 2:
            return TDGAProfile.ProfileType.SINA_WEIBO;
        case 3:
            return TDGAProfile.ProfileType.QQ;
        case 4:
            return TDGAProfile.ProfileType.QQ_WEIBO;
        case 5:
            return TDGAProfile.ProfileType.ND91;
        case 6:
            return TDGAProfile.ProfileType.WEIXIN;
        case 11:
            return TDGAProfile.ProfileType.TYPE1;
        case 12:
            return TDGAProfile.ProfileType.TYPE2;
        case 13:
            return TDGAProfile.ProfileType.TYPE3;
        case 14:
            return TDGAProfile.ProfileType.TYPE4;
        case 15:
            return TDGAProfile.ProfileType.TYPE5;
        case 16:
            return TDGAProfile.ProfileType.TYPE6;
        case 17:
            return TDGAProfile.ProfileType.TYPE7;
        case 18:
            return TDGAProfile.ProfileType.TYPE8;
        case 19:
            return TDGAProfile.ProfileType.TYPE9;
        case 20:
            return TDGAProfile.ProfileType.TYPE10;
        default:
            return TDGAProfile.ProfileType.ANONYMOUS;
        }
    }
    
    private TDGAProfile.Gender getGender(final int gender) {
        switch (gender) {
        case 1:
            return TDGAProfile.Gender.MALE;
        case 2:
            return TDGAProfile.Gender.FEMALE;
        default:
            return TDGAProfile.Gender.UNKNOW;
        }
    }
}
