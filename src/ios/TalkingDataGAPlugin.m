#import "TalkingDataGAPlugin.h"
#import "TalkingDataGA.h"


TDGAProfile *tdgaProfile = nil;

@implementation TalkingDataGAPlugin

- (void)onStart:(CDVInvokedUrlCommand*)command {
    NSString *appId = [command.arguments objectAtIndex:0];
    if (![appId isKindOfClass:[NSString class]]) {
        return;
    }
    
    NSString *channelId = [command.arguments objectAtIndex:1];
    if (![channelId isKindOfClass:[NSString class]]) {
        channelId = nil;
    }
    
    [TalkingDataGA onStart:appId withChannelId:channelId];
}

- (void)setVerboseLogDisabled:(CDVInvokedUrlCommand*)command {
    [TalkingDataGA setVerboseLogDisabled];
}

- (void)getDeviceId:(CDVInvokedUrlCommand*)command {
    NSString *deviceId = [TalkingDataGA getDeviceId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceId];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setLocation:(CDVInvokedUrlCommand*)command {
    NSNumber *arg0 = [command.arguments objectAtIndex:0];
    if (![arg0 isKindOfClass:[NSNumber class]]) {
        return;
    }
    double latitude = [arg0 doubleValue];
    
    NSNumber *arg1 = [command.arguments objectAtIndex:1];
    if (![arg1 isKindOfClass:[NSNumber class]]) {
        return;
    }
    double longitude = [arg1 doubleValue];
    
    [TalkingDataGA setLatitude:latitude longitude:longitude];
}

- (void)onEvent:(CDVInvokedUrlCommand*)command {
    NSString *eventId = [command.arguments objectAtIndex:0];
    if (![eventId isKindOfClass:[NSString class]]) {
        return;
    }
    
    NSString *arg1 = [command.arguments objectAtIndex:1];
    NSDictionary *eventData = [self jsonToDictionary:arg1];
    
    [TalkingDataGA onEvent:eventId eventData:eventData];
}

- (NSDictionary *)jsonToDictionary:(NSString *)jsonStr {
    if (![jsonStr isKindOfClass:[NSString class]]) {
        return nil;
    }

    NSError* error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    if (error || ![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    return object;
}

@end


@implementation TDGAProfilePlugin

- (void)setProfile:(CDVInvokedUrlCommand*)command {
    NSString *profileId = [command.arguments objectAtIndex:0];
    if (![profileId isKindOfClass:[NSString class]]) {
        return;
    }
    
    tdgaProfile = [TDGAProfile setProfile:profileId];
}

- (void)setProfileName:(CDVInvokedUrlCommand*)command {
    NSString *profileName = [command.arguments objectAtIndex:0];
    if (![profileName isKindOfClass:[NSString class]]) {
        return;
    }
    
    if (tdgaProfile) {
        [tdgaProfile setProfileName:profileName];
    }
}

- (void)setProfileType:(CDVInvokedUrlCommand*)command {
    NSNumber *arg0 = [command.arguments objectAtIndex:0];
    if (![arg0 isKindOfClass:[NSNumber class]]) {
        return;
    }
    int profileType = [arg0 intValue];
    
    if (tdgaProfile) {
        [tdgaProfile setProfileType:profileType];
    }
}

- (void)setLevel:(CDVInvokedUrlCommand*)command {
    NSNumber *arg0 = [command.arguments objectAtIndex:0];
    if (![arg0 isKindOfClass:[NSNumber class]]) {
        return;
    }
    int level = [arg0 intValue];
    
    if (tdgaProfile) {
        [tdgaProfile setLevel:level];
    }
}

- (void)setGender:(CDVInvokedUrlCommand*)command {
    NSNumber *arg0 = [command.arguments objectAtIndex:0];
    if (![arg0 isKindOfClass:[NSNumber class]]) {
        return;
    }
    int gender = [arg0 intValue];
    
    if (tdgaProfile) {
        [tdgaProfile setGender:gender];
    }
}

- (void)setAge:(CDVInvokedUrlCommand*)command {
    NSNumber *arg0 = [command.arguments objectAtIndex:0];
    if (![arg0 isKindOfClass:[NSNumber class]]) {
        return;
    }
    int age = [arg0 intValue];
    
    if (tdgaProfile) {
        [tdgaProfile setAge:age];
    }
}

- (void)setGameServer:(CDVInvokedUrlCommand*)command {
    NSString *gameServer = [command.arguments objectAtIndex:0];
    if (![gameServer isKindOfClass:[NSString class]]) {
        return;
    }
    
    if (tdgaProfile) {
        [tdgaProfile setGameServer:gameServer];
    }
}

@end


@implementation TDGAMissionPlugin

- (void)onBegin:(CDVInvokedUrlCommand*)command {
    NSString *missionId = [command.arguments objectAtIndex:0];
    if (![missionId isKindOfClass:[NSString class]]) {
        return;
    }
    
    [TDGAMission onBegin:missionId];
}

- (void)onCompleted:(CDVInvokedUrlCommand*)command {
    NSString *missionId = [command.arguments objectAtIndex:0];
    if (![missionId isKindOfClass:[NSString class]]) {
        return;
    }
    
    [TDGAMission onCompleted:missionId];
}

- (void)onFailed:(CDVInvokedUrlCommand*)command {
    NSString *missionId = [command.arguments objectAtIndex:0];
    if (![missionId isKindOfClass:[NSString class]]) {
        return;
    }
    
    NSString *failedCause = [command.arguments objectAtIndex:1];
    if (![failedCause isKindOfClass:[NSString class]]) {
        failedCause = nil;
    }
    
    [TDGAMission onFailed:missionId failedCause:failedCause];
}

@end


@implementation TDGAVirtualCurrencyPlugin

- (void)onChargeRequest:(CDVInvokedUrlCommand*)command {
    NSString *orderId = [command.arguments objectAtIndex:0];
    if (![orderId isKindOfClass:[NSString class]]) {
        return;
    }
    
    NSString *iapId = [command.arguments objectAtIndex:1];
    if (![iapId isKindOfClass:[NSString class]]) {
        iapId = nil;
    }
    
    double currencyAmount = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        currencyAmount = [arg2 doubleValue];
    }
    
    NSString *currencyType = [command.arguments objectAtIndex:3];
    if (![currencyType isKindOfClass:[NSString class]]) {
        currencyType = nil;
    }
    
    double virtualCurrencyAmount = 0;
    NSNumber *arg4 = [command.arguments objectAtIndex:4];
    if ([arg4 isKindOfClass:[NSNumber class]]) {
        virtualCurrencyAmount = [arg4 doubleValue];
    }
    
    NSString *paymentType = [command.arguments objectAtIndex:5];
    if (![paymentType isKindOfClass:[NSString class]]) {
        paymentType = nil;
    }
    
    [TDGAVirtualCurrency onChargeRequst:orderId iapId:iapId currencyAmount:currencyAmount currencyType:currencyType virtualCurrencyAmount:virtualCurrencyAmount paymentType:paymentType];
}

- (void)onChargeSuccess:(CDVInvokedUrlCommand*)command {
    NSString *orderId = [command.arguments objectAtIndex:0];
    if (![orderId isKindOfClass:[NSString class]]) {
        return;
    }
    
    [TDGAVirtualCurrency onChargeSuccess:orderId];
}

- (void)onReward:(CDVInvokedUrlCommand*)command {
    double virtualCurrencyAmount = 0.0;
    NSNumber *arg0 = [command.arguments objectAtIndex:0];
    if ([arg0 isKindOfClass:[NSNumber class]]) {
        virtualCurrencyAmount = [arg0 doubleValue];
    }
    
    NSString *reason = [command.arguments objectAtIndex:1];
    if (![reason isKindOfClass:[NSString class]]) {
        reason = nil;
    }
    
    [TDGAVirtualCurrency onReward:virtualCurrencyAmount reason:reason];
}

@end


@implementation TDGAItemPlugin

- (void)onPurchase:(CDVInvokedUrlCommand*)command {
    NSString *item = [command.arguments objectAtIndex:0];
    if (![item isKindOfClass:[NSString class]]) {
        return;
    }
    
    int number = 0;
    NSNumber *arg1 = [command.arguments objectAtIndex:1];
    if ([arg1 isKindOfClass:[NSNumber class]]) {
        number = [arg1 intValue];
    }
    
    double price = 0;
    NSNumber *arg2 = [command.arguments objectAtIndex:2];
    if ([arg2 isKindOfClass:[NSNumber class]]) {
        price = [arg2 doubleValue];
    }
    
    [TDGAItem onPurchase:item itemNumber:number priceInVirtualCurrency:price];
}

- (void)onUse:(CDVInvokedUrlCommand*)command {
    NSString *item = [command.arguments objectAtIndex:0];
    if (![item isKindOfClass:[NSString class]]) {
        return;
    }
    
    int number = 0;
    NSNumber *arg1 = [command.arguments objectAtIndex:1];
    if ([arg1 isKindOfClass:[NSNumber class]]) {
        number = [arg1 intValue];
    }
    
    [TDGAItem onUse:item itemNumber:number];
}

@end
