var exec = require('cordova/exec');

var TDGAAccount = {};

TDGAAccount.setAccount = function(accountId) {
    exec(null, null, "TDGAAccount", "setAccount", [accountId]);
    return function () {
        this.setAccountName = function (accountName) {
            exec(null, null, "TDGAAccount", "setAccountName", [accountName]);
        };

        this.setAccountType = function (accountType) {
            exec(null, null, "TDGAAccount", "setAccountType", [accountType]);
        };

        this.setLevel = function (level) {
            exec(null, null, "TDGAAccount", "setLevel", [level]);
        };

        this.setGender = function (gender) {
            exec(null, null, "TDGAAccount", "setGender", [gender]);
        };

        this.setAge = function (age) {
            exec(null, null, "TDGAAccount", "setAge", [age]);
        };

        this.setGameServer = function (gameServer) {
            exec(null, null, "TDGAAccount", "setGameServer", [gameServer]);
        };
    };
};

module.exports = TDGAAccount;