#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <IMIconnectCoreSDK/IMIconnectCoreSDK.h>

@interface ImiconnectWrapper : NSObject <RCTBridgeModule>

//IMIConnect
- (void)startup:(NSDictionary **)command;
- (void)getDeviceProfile:(NSDictionary **)command;

@end
