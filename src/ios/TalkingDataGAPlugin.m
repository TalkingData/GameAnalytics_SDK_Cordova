//
//  TalkingDataGAPlugin.m
//  TDGAPhoneGapDemo
//
//  Created by liweiqiang on 13-12-2.
//
//

#import "TalkingDataGAPlugin.h"
#import "TalkingDataGA.h"

TDGAAccount *tdgaAccount = nil;

@implementation TalkingDataGAPlugin

- (void)onStart:(CDVInvokedUrlCommand*)command {
    [TalkingDataGA setSdkType:4];
    NSString *appId = [command.arguments objectAtIndex:0];
    if (appId == nil || [appId isKindOfClass:[NSNull class]]) {
        return;
    }
    NSString *channelId = [command.arguments objectAtIndex:1];
    if ([channelId isKindOfClass:[NSNull class]]) {
        channelId = nil;
    }
    [TalkingDataGA onStart:appId withChannelId:channelId];
}

- (void)onEvent:(CDVInvokedUrlCommand*)command {
    NSString *eventId = [command.arguments objectAtIndex:0];
    if (eventId == nil || [eventId isKindOfClass:[NSNull class]]) {
        return;
    }
    NSDictionary *eventData = nil;
    NSString *arg1 = [command.arguments objectAtIndex:1];
    if (arg1 != nil && ![arg1 isKindOfClass:[NSNull class]]) {
        eventData = [self jsonToDictionary:arg1];
    }
    [TalkingDataGA onEvent:eventId eventData:eventData];
}

- (void)setLocation:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    NSString *arg1 = [command.arguments objectAtIndex:1];
    if (arg0 == nil || [arg0 isKindOfClass:[NSNull class]] || arg1 == nil || [arg1 isKindOfClass:[NSNull class]]) {
        return;
    }
    double latitude = [arg0 doubleValue];
    double longitude = [arg1 doubleValue];
    [TalkingDataGA setLatitude:latitude longitude:longitude];
}

- (void)getDeviceId:(CDVInvokedUrlCommand*)command {
    NSString *deviceId = [TalkingDataGA getDeviceId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceId];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setVerboseLogDisabled:(CDVInvokedUrlCommand*)command {
    [TalkingDataGA setVerboseLogDisabled];
}

- (NSDictionary *)jsonToDictionary:(NSString *)jsonStr {
    if (jsonStr) {
        NSError* error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
        if (error == nil && [object isKindOfClass:[NSDictionary class]]) {
            return object;
        }
    }
    
    return nil;
}

@end


@implementation TDGAAccountPlugin

- (void)setAccount:(CDVInvokedUrlCommand*)command {
    NSString *accountId = [command.arguments objectAtIndex:0];
    if (accountId == nil || [accountId isKindOfClass:[NSNull class]]) {
        return;
    }
    tdgaAccount = [TDGAAccount setAccount:accountId];
}

- (void)setAccountName:(CDVInvokedUrlCommand*)command {
    NSString *accountName = [command.arguments objectAtIndex:0];
    if (accountName == nil || [accountName isKindOfClass:[NSNull class]]) {
        return;
    }
    if (tdgaAccount) {
        [tdgaAccount setAccountName:accountName];
    }
}

- (void)setAccountType:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    if (arg0 == nil || [arg0 isKindOfClass:[NSNull class]]) {
        return;
    }
    int accountType = [arg0 intValue];
    if (tdgaAccount) {
        [tdgaAccount setAccountType:accountType];
    }
}

- (void)setLevel:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    if (arg0 == nil || [arg0 isKindOfClass:[NSNull class]]) {
        return;
    }
    int level = [arg0 intValue];
    if (tdgaAccount) {
        [tdgaAccount setLevel:level];
    }
}

- (void)setGender:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    if (arg0 == nil || [arg0 isKindOfClass:[NSNull class]]) {
        return;
    }
    int gender = [arg0 intValue];
    if (tdgaAccount) {
        [tdgaAccount setGender:gender];
    }
}

- (void)setAge:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    if (arg0 == nil || [arg0 isKindOfClass:[NSNull class]]) {
        return;
    }
    int age = [arg0 intValue];
    if (tdgaAccount) {
        [tdgaAccount setAge:age];
    }
}

- (void)setGameServer:(CDVInvokedUrlCommand*)command {
    NSString *gameServer = [command.arguments objectAtIndex:0];
    if (gameServer == nil || [gameServer isKindOfClass:[NSNull class]]) {
        return;
    }
    if (tdgaAccount) {
        [tdgaAccount setGameServer:gameServer];
    }
}

@end


@implementation TDGAMissionPlugin

- (void)onBegin:(CDVInvokedUrlCommand*)command {
    NSString *missionId = [command.arguments objectAtIndex:0];
    if (missionId == nil || [missionId isKindOfClass:[NSNull class]]) {
        return;
    }
    [TDGAMission onBegin:missionId];
}

- (void)onCompleted:(CDVInvokedUrlCommand*)command {
    NSString *missionId = [command.arguments objectAtIndex:0];
    if (missionId == nil || [missionId isKindOfClass:[NSNull class]]) {
        return;
    }
    [TDGAMission onCompleted:missionId];
}

- (void)onFailed:(CDVInvokedUrlCommand*)command {
    NSString *missionId = [command.arguments objectAtIndex:0];
    if (missionId == nil || [missionId isKindOfClass:[NSNull class]]) {
        return;
    }
    NSString *failedCause = [command.arguments objectAtIndex:1];
    if ([failedCause isKindOfClass:[NSNull class]]) {
        failedCause = nil;
    }
    [TDGAMission onFailed:missionId failedCause:failedCause];
}

@end


@implementation TDGAVirtualCurrencyPlugin

- (void)onChargeRequst:(CDVInvokedUrlCommand*)command {
    NSString *orderId = [command.arguments objectAtIndex:0];
    if (orderId == nil || [orderId isKindOfClass:[NSNull class]]) {
        return;
    }
    NSString *iapId = [command.arguments objectAtIndex:1];
    if ([iapId isKindOfClass:[NSNull class]]) {
        iapId = nil;
    }
    double currencyAmount = 0;
    NSString *arg2 = [command.arguments objectAtIndex:2];
    if (arg2 != nil && ![arg2 isKindOfClass:[NSNull class]]) {
        currencyAmount = [arg2 doubleValue];
    }
    NSString *currencyType = [command.arguments objectAtIndex:3];
    if ([currencyType isKindOfClass:[NSNull class]]) {
        currencyType = nil;
    }
    double virtualCurrencyAmount = 0;
    NSString *arg4 = [command.arguments objectAtIndex:4];
    if (arg4 != nil && ![arg4 isKindOfClass:[NSNull class]]) {
        virtualCurrencyAmount = [arg4 doubleValue];
    }
    NSString *paymentType = [command.arguments objectAtIndex:5];
    if ([paymentType isKindOfClass:[NSNull class]]) {
        paymentType = nil;
    }
    [TDGAVirtualCurrency onChargeRequst:orderId iapId:iapId currencyAmount:currencyAmount currencyType:currencyType virtualCurrencyAmount:virtualCurrencyAmount paymentType:paymentType];
}

- (void)onChargeSuccess:(CDVInvokedUrlCommand*)command {
    NSString *orderId = [command.arguments objectAtIndex:0];
    if (orderId == nil || [orderId isKindOfClass:[NSNull class]]) {
        return;
    }
    [TDGAVirtualCurrency onChargeSuccess:orderId];
}

- (void)onReward:(CDVInvokedUrlCommand*)command {
    NSString *arg0 = [command.arguments objectAtIndex:0];
    if (arg0 == nil || [arg0 isKindOfClass:[NSNull class]]) {
        return;
    }
    double virtualCurrencyAmount = [arg0 doubleValue];
    NSString *reason = [command.arguments objectAtIndex:1];
    if ([reason isKindOfClass:[NSNull class]]) {
        reason = nil;
    }
    [TDGAVirtualCurrency onReward:virtualCurrencyAmount reason:reason];
}

@end


@implementation TDGAItemPlugin

- (void)onPurchase:(CDVInvokedUrlCommand*)command {
    NSString *item = [command.arguments objectAtIndex:0];
    if (item == nil || [item isKindOfClass:[NSNull class]]) {
        return;
    }
    int number = 0;
    NSString *arg1 = [command.arguments objectAtIndex:1];
    if (arg1 != nil && ![arg1 isKindOfClass:[NSNull class]]) {
        number = [arg1 intValue];
    }
    double price = 0;
    NSString *arg2 = [command.arguments objectAtIndex:2];
    if (arg2 != nil && ![arg2 isKindOfClass:[NSNull class]]) {
        price = [arg2 doubleValue];
    }
    [TDGAItem onPurchase:item itemNumber:number priceInVirtualCurrency:price];
}

- (void)onUse:(CDVInvokedUrlCommand*)command {
    NSString *item = [command.arguments objectAtIndex:0];
    if (item == nil || [item isKindOfClass:[NSNull class]]) {
        return;
    }
    int number = 0;
    NSString *arg1 = [command.arguments objectAtIndex:1];
    if (arg1 != nil && ![arg1 isKindOfClass:[NSNull class]]) {
        number = [arg1 intValue];
    }
    [TDGAItem onUse:item itemNumber:number];
}

@end
