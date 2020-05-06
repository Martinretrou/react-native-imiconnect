#import "ImiconnectWrapper.h"

@protocol ICMessagingDelegate;
@class ICMessaging;

@protocol ICSecurityTokenErrorDelegate;
@class ICConfig;

#import <UserNotifications/UserNotifications.h>
#import <CommonCrypto/CommonCrypto.h>
#import "NSData+Encryption.h"

@interface IMIconnectWrapper ()
{

}
@property (nonatomic, copy) NSString *callbackId;
@property (nonatomic, copy) NSString *callback;

@property (nonatomic, strong) NSMutableArray *messageCallBackIds;
@property (nonatomic, strong) NSMutableArray *deepLinkCallBackIds;
@property (nonatomic, strong) NSMutableArray *securityTokenErrorCallBackIds;
@property (nonatomic, strong) NSMutableArray *connectionChangeCallBackIds;

@property (nonatomic, strong) NSMutableDictionary *handlerObj;
@property (nonatomic, strong) NSMutableArray *topicsHandlerObj;
@property (nonatomic, strong) NSMutableArray *threadsHandlerObj;
@property (nonatomic, strong) NSMutableArray *messageHandlerObj;

@property (nonatomic) ICAppDelegate *icAppDelegate;
@property (nonatomic) ICConfig *icConfig;
@property (nonatomic) ICDeviceProfile *deviceProfile;

@end


@implementation ImiconnectWrapper

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startup:(NSDictionary **)command)
{
    NSError *error;

    [IMIconnect startup:&error];
    if(error)
    {
        NSLog(@"Startup failed. Reason: %@", error.localizedDescription);
        [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
    }

    else
    {
        NSLog(@"Startup succeeded.");
        [self successWithMessage:command.callbackId withInt:1];
    }
}

RCT_EXPORT_METHOD(getDeviceProfile:(NSDictionary **)command)
{
    NSError *error;
    ICDeviceProfile *deviceprofile = IMIconnect.deviceProfile;
    NSMutableDictionary *deviceProfileDict = [[NSMutableDictionary alloc]init];
    [deviceProfileDict setObject:deviceprofile.deviceId forKey:@"deviceId"];
    [deviceProfileDict setObject:deviceprofile.customerId forKey:@"customerId"];
    [deviceProfileDict setObject:deviceprofile.appUserId forKey:@"appUserId"];
    [deviceProfileDict setObject:[NSNumber numberWithBool:deviceprofile.isAppUserIdSystemGenerated] forKey:@"isAppUserSystemGenerated"];
    [deviceProfileDict setObject:[NSNumber numberWithBool:deviceprofile.isGuest] forKey:@"isGuest"];

    if(_deviceProfile !=nil)
    {
        [self successWithMessage:command.callbackId withDictionary:deviceProfileDict];
    }
    else
    {
        [self failWithMessage:command.callbackId withMsg:@"getDeviceProfile failed" withError:error];
    }

}

@end
