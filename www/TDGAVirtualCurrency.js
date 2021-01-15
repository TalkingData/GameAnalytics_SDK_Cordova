var exec = require('cordova/exec');

var TDGAVirtualCurrency = {

    /**
     * 充值请求
     * @param {String}  orderId                 : 订单ID
     * @param {String}  iapId                   : 充值包ID
     * @param {Number}  currencyAmount          : 现金金额
     * @param {String}  cruuencyType            : 货币类型
     * @param {Number}  virtualCurrencyAmount   : 虚拟币数量
     * @param {String}  paymentType             : 支付类型
     */
    onChargeRequest: function(orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType) {
        exec(null, null, "TDGAVirtualCurrency", "onChargeRequest", [orderId, iapId, currencyAmount, currencyType, virtualCurrencyAmount, paymentType]);
    },

    /**
     * 充值成功
     * @param {String} orderId                  : 订单ID
     */
    onChargeSuccess: function(orderId) {
        exec(null, null, "TDGAVirtualCurrency", "onChargeSuccess", [orderId]);
    },

    /**
     * 赠予虚拟币
     * @param {Number}  virtualCurrencyAmount   : 虚拟币数量
     * @param {String}  reason                  : 赠送虚拟币原因
     */
    onReward: function(virtualCurrencyAmount, reason) {
        exec(null, null, "TDGAVirtualCurrency", "onReward", [virtualCurrencyAmount, reason]);
    },
};

module.exports = TDGAVirtualCurrency;
