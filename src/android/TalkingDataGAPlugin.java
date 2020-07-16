package com.talkingdata.game;

import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaWebView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.HashMap;
import java.util.Map;

import android.app.Activity;
import android.content.Context;

import com.tendcloud.tenddata.TalkingDataGA;

public class TalkingDataGAPlugin extends CordovaPlugin {
	Activity act;
	Context ctx;
	
    @Override
	public void initialize(CordovaInterface cordova, CordovaWebView webView) {
		super.initialize(cordova, webView);
		this.act = cordova.getActivity();
		this.ctx = cordova.getActivity().getApplicationContext();
	}

    @Override
    public void onResume(boolean multitasking) {
    	super.onResume(multitasking);
    	TalkingDataGA.onResume(act);
    }
    
    @Override
    public void onPause(boolean multitasking) {
    	super.onPause(multitasking);
    	TalkingDataGA.onPause(act);
    }
    
	@Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		if (action.equals("onStart")) {
			TalkingDataGA.sPlatformType = 4;
            String appKey = args.getString(0);
            String channelId = args.getString(1);
            TalkingDataGA.init(ctx, appKey, channelId);
            return true;
        } else if (action.equals("onEvent")) {
        	String eventId = args.getString(0);
        	Map<String, Object> eventData = this.toMap(args.getString(1));
        	TalkingDataGA.onEvent(eventId, eventData);
        	return true;
        } else if (action.equals("setLocation")) {
        	return true;
        } else if (action.equals("getDeviceId")) {
        	String deviceId = TalkingDataGA.getDeviceId(ctx);
        	callbackContext.success(deviceId);
        	return true;
        } else if (action.equals("getOAID")) {
            String oaid = TalkingDataGA.getOAID(ctx);
            callbackContext.success(oaid);
            return true;
        } else if (action.equals("setVerboseLogDisabled")) {
        	TalkingDataGA.setVerboseLogDisabled();
        	return true;
        }
        return false;
    }
    
    @SuppressWarnings("unchecked")
	private Map<String, Object> toMap(String jsonStr)
    {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            JSONObject jsonObj = new JSONObject(jsonStr);
			Iterator<String> keys = jsonObj.keys();
            String key = null;
            Object value = null;
            while (keys.hasNext())
            {
                key = keys.next();
                value = jsonObj.get(key);
                result.put(key, value);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }
}
