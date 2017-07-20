package com.talkingdata.game;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;

import com.tendcloud.tenddata.TDGAMission;

public class TDGAMissionPlugin extends CordovaPlugin {
	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		if (action.equals("onBegin")) {
			String missionId = args.getString(0);
			TDGAMission.onBegin(missionId);
			return true;
		} else if (action.equals("onCompleted")) {
			String missionId = args.getString(0);
			TDGAMission.onCompleted(missionId);
			return true;
		} else if (action.equals("onFailed")) {
			String missionId = args.getString(0);
			String failedCause = args.getString(1);
			TDGAMission.onFailed(missionId, failedCause);
			return true;
		}
		return false;
	}
}
