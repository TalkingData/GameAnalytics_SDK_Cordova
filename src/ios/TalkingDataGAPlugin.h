//
//  TalkingDataGAPlugin.h
//  TDGAPhoneGapDemo
//
//  Created by liweiqiang on 13-12-2.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>


@interface TalkingDataGAPlugin : CDVPlugin
- (void)onStart:(CDVInvokedUrlCommand*)command;
- (void)onEvent:(CDVInvokedUrlCommand*)command;
- (void)setLocation:(CDVInvokedUrlCommand*)command;
- (void)getDeviceId:(CDVInvokedUrlCommand*)command;
- (void)setVerboseLogDisabled:(CDVInvokedUrlCommand*)command;
@end


@interface TDGAAccountPlugin : CDVPlugin
- (void)setAccount:(CDVInvokedUrlCommand*)command;
- (void)setAccountName:(CDVInvokedUrlCommand*)command;
- (void)setAccountType:(CDVInvokedUrlCommand*)command;
- (void)setLevel:(CDVInvokedUrlCommand*)command;
- (void)setGender:(CDVInvokedUrlCommand*)command;
- (void)setAge:(CDVInvokedUrlCommand*)command;
- (void)setGameServer:(CDVInvokedUrlCommand*)command;
@end


@interface TDGAMissionPlugin : CDVPlugin
- (void)onBegin:(CDVInvokedUrlCommand*)command;
- (void)onCompleted:(CDVInvokedUrlCommand*)command;
- (void)onFailed:(CDVInvokedUrlCommand*)command;
@end


@interface TDGAVirtualCurrencyPlugin : CDVPlugin
- (void)onChargeRequst:(CDVInvokedUrlCommand*)command;
- (void)onChargeSuccess:(CDVInvokedUrlCommand*)command;
- (void)onReward:(CDVInvokedUrlCommand*)command;
@end


@interface TDGAItemPlugin : CDVPlugin
- (void)onPurchase:(CDVInvokedUrlCommand*)command;
- (void)onUse:(CDVInvokedUrlCommand*)command;
@end
