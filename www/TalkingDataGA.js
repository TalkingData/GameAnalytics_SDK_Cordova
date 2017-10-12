var exec = require('cordova/exec');

var TalkingDataGA = {
    onStart:function(appId, channelId) {
        exec(null, null, "TalkingDataGA", "onStart", [appId, channelId]);
    },
    onEvent:function(eventId, eventData) {
        var eventDataJson = JSON.stringify(eventData);
        exec(null, null, "TalkingDataGA", "onEvent", [eventId, eventDataJson]);
    },
    setLocation:function(latitude, longitude) {
        exec(null, null, "TalkingDataGA", "setLocation", [latitude, longitude]);
    },
    getDeviceId:function(callBack) {
        exec(callBack, null, "TalkingDataGA", "getDeviceId", []);
    },
    setVerboseLogDisabled:function() {
        exec(null, null, "TalkingDataGA", "setVerboseLogDisabled", []);
    }
};

module.exports = TalkingDataGA;
