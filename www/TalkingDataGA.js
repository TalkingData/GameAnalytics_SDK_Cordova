var exec = require('cordova/exec');

var TalkingDataGA = {

    /**
     * 初始化 TalkingData App Analytics SDK
     * @param {String}  appId           : TalkingData AppID
     * @param {String}  channelId       : 渠道号
     */
    onStart: function(appId, channelId) {
        exec(null, null, "TalkingDataGA", "onStart", [appId, channelId]);
    },

    /**
     * 关闭日志
     */
    setVerboseLogDisabled: function() {
        exec(null, null, "TalkingDataGA", "setVerboseLogDisabled", []);
    },

    /**
     * 获取 TDID，并将其作为参数传入 JS 的回调函数
     * @param {Object}  callBack        : 处理 TDID 的回调函数
     */
    getDeviceId: function(callBack) {
        exec(callBack, null, "TalkingDataGA", "getDeviceId", []);
    },

    /**
     * 获取 OAID，并将其作为参数传入 JS 的回调函数
     * @param {Object}  callBack        : 处理 OAID 的回调函数
     */
    getOAID:function(callBack){
        exec(callBack, null, "TalkingDataGA", "getOAID", []);
    },

    /**
     * 设置位置经纬度
     * @param {Number}  latitude        : 纬度
     * @param {Number}  longitude       : 经度
     */
    setLocation: function(latitude, longitude) {
        exec(null, null, "TalkingDataGA", "setLocation", [latitude, longitude]);
    },

    /**
     * 触发自定义事件
     * @param {String}  eventId         : 自定义事件的ID
     * @param {Object}  eventData       : 自定义事件的数据，Json格式
     */
    onEvent: function(eventId, eventData) {
        var eventDataJson = JSON.stringify(eventData);
        exec(null, null, "TalkingDataGA", "onEvent", [eventId, eventDataJson]);
    },
};

module.exports = TalkingDataGA;
