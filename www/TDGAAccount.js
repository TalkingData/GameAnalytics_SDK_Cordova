var exec = require('cordova/exec');

var TDGAAccount = {};

TDGAAccount.setAccount = function(accountId) {
    exec(null, null, "TDGAAccount", "setAccount", [accountId]);
    return {
        setAccountName: function (accountName) {
            exec(null, null, "TDGAAccount", "setAccountName", [accountName]);
        },

        setAccountType: function (accountType) {
            exec(null, null, "TDGAAccount", "setAccountType", [accountType]);
        },

        setLevel: function (level) {
            exec(null, null, "TDGAAccount", "setLevel", [level]);
        },

        setGender: function (gender) {
            exec(null, null, "TDGAAccount", "setGender", [gender]);
        },

        setAge: function (age) {
            exec(null, null, "TDGAAccount", "setAge", [age]);
        },

        setGameServer: function (gameServer) {
            exec(null, null, "TDGAAccount", "setGameServer", [gameServer]);
        }
    };
};

module.exports = TDGAAccount;