var exec = require('cordova/exec');

var TDGAItem = {

    /**
     * 记录消费点
     * @param {String}  item            : 消费点ID
     * @param {Number}  number          : 消费数量
     * @param {Number}  price           : 道具单价
     */
    onPurchase: function(item, number, price) {
        exec(null, null, "TDGAItem", "onPurchase", [item, number, price]);
    },

    /**
     * 消耗物品或服务
     * @param {String}  item            : 消费点ID
     * @param {Number}  number          : 消费数量
     */
    onUse: function(item, number) {
        exec(null, null, "TDGAItem", "onUse", [item, number]);
    },
};

module.exports = TDGAItem;
