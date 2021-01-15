var exec = require('cordova/exec');

var TDGAMission = {

    /**
     * 任务开始
     * @param {String}  missionId       : 任务ID
     */
    onBegin: function(missionId) {
        exec(null, null, "TDGAMission", "onBegin", [missionId]);
    },

    /**
     * 任务完成
     * @param {String}  missionId       : 任务ID
     */
    onCompleted: function(missionId) {
        exec(null, null, "TDGAMission", "onCompleted", [missionId]);
    },

    /**
     * 任务失败
     * @param {String}  missionId       : 任务ID
     * @param {String}  failedCause     : 失败原因
     */
    onFailed: function(missionId, failedCause) {
        exec(null, null, "TDGAMission", "onFailed", [missionId, failedCause]);
    },
};

module.exports = TDGAMission;
