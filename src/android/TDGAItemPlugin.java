package com.talkingdata.game;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;

import com.tendcloud.tenddata.TDGAItem;;

public class TDGAItemPlugin extends CordovaPlugin {
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		if (action.equals("onPurchase")) {
		    String item = args.getString(0);
		    int number = args.getInt(1);
		    double price = args.getDouble(2);
		    TDGAItem.onPurchase(item, number, price);
			return true;
		} else if (action.equals("onUse")) {
		    String item = args.getString(0);
		    int number = args.getInt(1);
		    TDGAItem.onUse(item, number);
			return true;
		}
		return false;
	}
}
