var exec = require('cordova/exec');
var TDGAMission = {
    onBegin:function(missionId) {
        exec(null, null, "TDGAMission", "onBegin", [missionId]);
    },
    onCompleted:function(missionId) {
        exec(null, null, "TDGAMission", "onCompleted", [missionId]);
    },
    onFailed:function(missionId, failedCause) {
        exec(null, null, "TDGAMission", "onFailed", [missionId, failedCause]);
    }
};
module.exports = TDGAMission;