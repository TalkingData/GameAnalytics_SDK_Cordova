var TDGAAccountType = {
    kAccountAnonymous:0,
    kAccountRegistered:1,
    kAccountSinaWeibo:2,
    kAccountQQ:3,
    kAccountTencentWeibo:4,
    kAccountND91:5,
    kAccountType1:11,
    kAccountType:12,
    kAccountType:13,
    kAccountType:14,
    kAccountType:15,
    kAccountType:16,
    kAccountType:17,
    kAccountType:18,
    kAccountType:19,
    kAccountType10:20
};

var TDGAGender = {
    kGenderUnknown:0,
    kGenderMale:1,
    kGenderFemale:2
};

var TDGAAccount = {
    setAccountName:function(accountName) {
        Cordova.exec(null, null, "TDGAAccount", "setAccountName", [accountName]);
    },
    setAccountType:function(accountType) {
        Cordova.exec(null, null, "TDGAAccount", "setAccountType", [accountType]);
    },
    setLevel:function(level) {
        Cordova.exec(null, null, "TDGAAccount", "setLevel", [level]);
    },
    setGender:function(gender) {
        Cordova.exec(null, null, "TDGAAccount", "setGender", [gender]);
    },
    setAge:function(age) {
        Cordova.exec(null, null, "TDGAAccount", "setAge", [age]);
    },
    setGameServer:function(gameServer) {
        Cordova.exec(null, null, "TDGAAccount", "setGameServer", [gameServer]);
    }
};

var TalkingDataGA = {
    onStart:function(appId, channelId) {
        Cordova.exec(null, null, "TalkingDataGA", "onStart", [appId, channelId]);
    },
    onEvent:function(eventId, eventData) {
        var eventDataJson = JSON.stringify(eventData);
        Cordova.exec(null, null, "TalkingDataGA", "onEvent", [eventId, eventDataJson]);
    },
    setLocation:function(latitude, longitude) {
        Cordova.exec(null, null, "TalkingDataGA", "setLocation", [latitude, longitude]);
    },
    getDeviceId:function(callBack) {
        Cordova.exec(callBack, null, "TalkingDataGA", "getDeviceId", []);
    },
    getAccount:function(accountId) {
        Cordova.exec(null, null, "TDGAAccount", "setAccount", [accountId]);
        return TDGAAccount;
    },
    setVerboseLogDisabled:function() {
        Cordova.exec(null, null, "TalkingDataGA", "setVerboseLogDisabled", []);
    }
};

var TDGAMission = {
    onBegin:function(missionId) {
        Cordova.exec(null, null, "TDGAMission", "onBegin", [missionId]);
    },
    onCompleted:function(missionId) {
        Cordova.exec(null, null, "TDGAMission", "onCompleted", [missionId]);
    },
    onFailed:function(missionId, failedCause) {
        Cordova.exec(null, null, "TDGAMission", "onFailed", [missionId, failedCause]);
    }
};

var TDGAVirtualCurrency = {
    onChargeRequst:function(orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType) {
        Cordova.exec(null, null, "TDGAVirtualCurrency", "onChargeRequst", [orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType]);
    },
    onChargeSuccess:function(orderId) {
        Cordova.exec(null, null, "TDGAVirtualCurrency", "onChargeSuccess", [orderId]);
    },
    onReward:function(virtualCurrencyAmount, reason) {
        Cordova.exec(null, null, "TDGAVirtualCurrency", "onReward", [virtualCurrencyAmount, reason]);
    }
};

var TDGAItem = {
    onPurchase:function(item, number, price) {
        Cordova.exec(null, null, "TDGAItem", "onPurchase", [item, number, price]);
    },
    onUse:function(item, number) {
        Cordova.exec(null, null, "TDGAItem", "onUse", [item, number]);
    }
};
