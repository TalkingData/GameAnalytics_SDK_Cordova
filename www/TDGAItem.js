var exec = require('cordova/exec');

var TDGAItem = {
    onPurchase:function(item, number, price) {
        exec(null, null, "TDGAItem", "onPurchase", [item, number, price]);
    },
    onUse:function(item, number) {
        exec(null, null, "TDGAItem", "onUse", [item, number]);
    }
};
module.exports = TDGAItem;