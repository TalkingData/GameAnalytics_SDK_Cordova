var exec = require('cordova/exec');
var TDGAVirtualCurrency = {
    onChargeRequst:function(orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType) {
        exec(null, null, "TDGAVirtualCurrency", "onChargeRequst", [orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType]);
    },
    onChargeSuccess:function(orderId) {
        exec(null, null, "TDGAVirtualCurrency", "onChargeSuccess", [orderId]);
    },
    onReward:function(virtualCurrencyAmount, reason) {
        exec(null, null, "TDGAVirtualCurrency", "onReward", [virtualCurrencyAmount, reason]);
    }
};
module.exports = TDGAVirtualCurrency;