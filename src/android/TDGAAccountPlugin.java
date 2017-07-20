package com.talkingdata.game;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;

import com.tendcloud.tenddata.TDGAAccount;

public class TDGAAccountPlugin extends CordovaPlugin {
	public static TDGAAccount account;

	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		if (action.equals("setAccount")) {
			String accountId = args.getString(0);
			account = TDGAAccount.setAccount(accountId);
			return true;
		} else if (action.equals("setAccountName")) {
			String accountName = args.getString(0);
			account.setAccountName(accountName);
			return true;
		} else if (action.equals("setAccountType")) {
			TDGAAccount.AccountType type = this.getType(args.getInt(0));
			account.setAccountType(type);
			return true;
		} else if (action.equals("setLevel")) {
			int level = args.getInt(0);
			account.setLevel(level);
			return true;
		} else if (action.equals("setGender")) {
			TDGAAccount.Gender gender = this.getGender(args.getInt(0));
			account.setGender(gender);
			return true;
		} else if (action.equals("setAge")) {
			int age = args.getInt(0);
			account.setAge(age);
			return true;
		} else if (action.equals("setGameServer")) {
			String gameServer = args.getString(0);
			account.setGameServer(gameServer);
			return true;
		}
		return false;
	}
	
	private TDGAAccount.AccountType getType(final int type) {
		switch (type) {
		case 0:
			return TDGAAccount.AccountType.ANONYMOUS;
		case 1:
			return TDGAAccount.AccountType.REGISTERED;
		case 2:
			return TDGAAccount.AccountType.SINA_WEIBO;
		case 3:
			return TDGAAccount.AccountType.QQ;
		case 4:
			return TDGAAccount.AccountType.QQ_WEIBO;
		case 5:
			return TDGAAccount.AccountType.ND91;
		case 11:
			return TDGAAccount.AccountType.TYPE1;
		case 12:
			return TDGAAccount.AccountType.TYPE2;
		case 13:
			return TDGAAccount.AccountType.TYPE3;
		case 14:
			return TDGAAccount.AccountType.TYPE4;
		case 15:
			return TDGAAccount.AccountType.TYPE5;
		case 16:
			return TDGAAccount.AccountType.TYPE6;
		case 17:
			return TDGAAccount.AccountType.TYPE7;
		case 18:
			return TDGAAccount.AccountType.TYPE8;
		case 19:
			return TDGAAccount.AccountType.TYPE9;
		case 20:
			return TDGAAccount.AccountType.TYPE10;
		default:
			return TDGAAccount.AccountType.ANONYMOUS;
		}
	}
	
	private TDGAAccount.Gender getGender(final int gender) {
		switch (gender) {
		case 1:
			return TDGAAccount.Gender.MALE;
		case 2:
			return TDGAAccount.Gender.FEMALE;
		default:
			return TDGAAccount.Gender.UNKNOW;
		}
	}
}
