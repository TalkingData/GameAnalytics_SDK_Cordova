var exec = require('cordova/exec');

var TDGAProfile = {};

/**
 * 设置账户ID
 * @param {String}  profileId           : 账户ID
 */
TDGAProfile.setProfile = function(profileId) {
    exec(null, null, "TDGAProfile", "setProfile", [profileId]);
    return {

        /**
         * 设置账户名称
         * @param {String}  profileName : 账户名称
         */
        setProfileName: function(profileName) {
            exec(null, null, "TDGAProfile", "setProfileName", [profileName]);
        },

        /**
         * 设置账户类型
         * @param {Number}  profileType : 账户类型
         */
        setProfileType: function(profileType) {
            exec(null, null, "TDGAProfile", "setProfileType", [profileType]);
        },

        /**
         * 设置等级
         * @param {Number}  level       : 等级
         */
        setLevel: function(level) {
            exec(null, null, "TDGAProfile", "setLevel", [level]);
        },

        /**
         * 设置性别
         * @param {Number}  gender      : 性别
         */
        setGender: function(gender) {
            exec(null, null, "TDGAProfile", "setGender", [gender]);
        },

        /** 设置年龄
         * @param {Number}  age         : 年龄
         */
        setAge: function(age) {
            exec(null, null, "TDGAProfile", "setAge", [age]);
        },

        /**
         * 设置区服
         * @param {String}  gameServer  : 区服
         */
        setGameServer: function(gameServer) {
            exec(null, null, "TDGAProfile", "setGameServer", [gameServer]);
        },
    };
};

module.exports = TDGAProfile;
