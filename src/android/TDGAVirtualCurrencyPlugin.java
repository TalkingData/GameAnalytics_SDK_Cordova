package com.talkingdata.game;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;

import com.tendcloud.tenddata.TDGAVirtualCurrency;

public class TDGAVirtualCurrencyPlugin extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("onChargeRequest")) {
            String orderId = args.getString(0);
            String iapId = args.getString(1);
            double currencyAmount = args.getDouble(2);
            String currencyType = args.getString(3);
            double virtualCurrencyAmount = args.getDouble(4);
            String paymentType = args.getString(5);
            TDGAVirtualCurrency.onChargeRequest(orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType);
            return true;
        } else if (action.equals("onChargeSuccess")) {
            String orderId = args.getString(0);
            TDGAVirtualCurrency.onChargeSuccess(orderId);
            return true;
        } else if (action.equals("onReward")) {
            double virtualCurrencyAmount = args.getDouble(0);
            String reason = args.getString(1);
            TDGAVirtualCurrency.onReward(virtualCurrencyAmount, reason);
            return true;
        }
        return false;
    }
}
