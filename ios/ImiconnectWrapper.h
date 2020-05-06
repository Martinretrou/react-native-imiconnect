@protocol ICSecurityTokenErrorDelegate;
@class ICConfig;

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <IMIconnectCoreSDK/IMIconnectCoreSDK.h>


@interface ImiconnectWrapper : NSObject <RCTBridgeModule>

@property (nonatomic, strong) NSDictionary *notificationMessage;
@property (nonatomic, strong) NSString *password;

@property BOOL clearBadge;
@property BOOL isInline;
@property BOOL coldstart;

//IMIConnect
- (void)startup:(NSError **)error;

@end
