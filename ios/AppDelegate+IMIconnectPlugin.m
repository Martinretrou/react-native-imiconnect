

#import "AppDelegate+IMIconnectPlugin.h"
#import "IMIconnectPlugin.h"
#import <objc/runtime.h>


#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)



static char launchNotificationKey;
static char coldstartKey;


@implementation AppDelegate (IMIconnectPlugin)
@dynamic icAppDelgate;


- (id) getCommandInstance:(NSString*)className
{
    return [self.viewController getCommandInstance:className];
}

// its dangerous to override a method from within a category.
// Instead we will use method swizzling. we set this up in the load call.
//
+ (void)load
{
    Method original =  class_getInstanceMethod(self, @selector(application:didFinishLaunchingWithOptions:));
    Method custom =    class_getInstanceMethod(self, @selector(application:customDidFinishLaunchingWithOptions:));
    method_exchangeImplementations(original, custom);
}
//*********
-(void)registerForRemoteNotifications {

    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){

        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

        center.delegate = self;

        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){

            if(!error){

                [[UIApplication sharedApplication] registerForRemoteNotifications];

            }

        }];

    }

    else {

        // Code for old versions

        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |

                                                        UIUserNotificationTypeBadge |

                                                        UIUserNotificationTypeSound);

        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes

                                                                                 categories:nil];

        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

        [[UIApplication sharedApplication] registerForRemoteNotifications];

    }

}


-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{

    NSLog(@"User Info : %@",notification.request.content.userInfo);

    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);

    [self handleRemoteNotification:[UIApplication sharedApplication] userInfo:notification.request.content.userInfo];
}

//Called to let your app know which action was selected by the user for a given notification.

-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{

    NSLog(@"User Info : %@",response.notification.request.content.userInfo);

    completionHandler();

    [self handleRemoteNotification:[UIApplication sharedApplication] userInfo:response.notification.request.content.userInfo];
}

-(void) handleRemoteNotification:(UIApplication *) application   userInfo:(NSDictionary *) remoteNotif {

    NSLog(@"handleRemoteNotification");

    NSLog(@"Handle Remote Notification Dictionary: %@", remoteNotif);

    // Handle Click of the Push Notification From Here…
    // You can write a code to redirect user to specific screen of the app here….
}

- (BOOL)application:(UIApplication *)application customDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [self application:application customDidFinishLaunchingWithOptions:launchOptions];

    NSLog(@"DidFinishLaunchingWithOptions");

    // Register for remote notifications. This shows a permission dialog on first run, to
    // show the dialog at a more appropriate time move this registration accordingly.

    [self registerForRemoteNotifications];



    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:[UIApplication sharedApplication] didFinishLaunchingWithOptions:launchOptions];


    //    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
    //        UIUserNotificationType allNotificationTypes =
    //        (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
    //        UIUserNotificationSettings *settings =
    //        [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
    //        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    //    } else {
    //        // iOS 10 or later
    //#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
    //        UNAuthorizationOptions authOptions =
    //        UNAuthorizationOptionAlert
    //        | UNAuthorizationOptionSound
    //        | UNAuthorizationOptionBadge;
    //        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
    //        }];
    //
    //        // For iOS 10 display notification (sent via APNS)
    //        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    //#endif
    //    }
    //    [[UIApplication sharedApplication] registerForRemoteNotifications];
    return YES;
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application didRegisterUserNotificationSettings:notificationSettings];

}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {


    NSLog(@"device token :%@",deviceToken);

    NSString *devtoken = [[[[deviceToken description]
                            stringByReplacingOccurrencesOfString:@"<"withString:@""]
                           stringByReplacingOccurrencesOfString:@">" withString:@""]
                          stringByReplacingOccurrencesOfString: @" " withString: @""];
    NSLog(@"My token is: %@", devtoken);

    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler didFailToRegisterForRemoteNotificationsWithError:error];

}
- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"clicked on the shade");
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application didReceiveRemoteNotification:userInfo];
}
-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application didReceiveLocalNotification:notification];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
    // app is in background or in stand by
}

- (BOOL)userHasRemoteNotificationsEnabled {
    UIApplication *application = [UIApplication sharedApplication];
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        return application.currentUserNotificationSettings.types != UIUserNotificationTypeNone;
    } else {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        return application.enabledRemoteNotificationTypes != UIRemoteNotificationTypeNone;
#pragma GCC diagnostic pop
    }
}

- (void)IMIconnectPluginOnApplicationDidBecomeActive:(NSNotification *)notification {

    NSLog(@"active");

    UIApplication *application = notification.object;

    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    if (pushHandler.clearBadge) {
        NSLog(@"IMIconnectPlugin clearing badge");
        //zero badge
        application.applicationIconBadgeNumber = 0;
    } else {
        NSLog(@"IMIconnectPlugin skip clear badge");
    }

    if (self.launchNotification) {
        pushHandler.isInline = NO;
        pushHandler.coldstart = [self.coldstart boolValue];
        pushHandler.notificationMessage = self.launchNotification;
        self.launchNotification = nil;
        self.coldstart = [NSNumber numberWithBool:NO];
    }
}
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
}


//- (void)application:(UIApplication *) application handleActionWithIdentifier: (NSString *) identifier forRemoteNotification: (NSDictionary *) notification completionHandler: (void (^)()) completionHandler {

//     IMIconnectPlugin *pushHandler = [self getCommandInstance:@"PushNotification"];
//      [pushHandler application:application handleActionWithIdentifier:identifier forRemoteNotification:notification completionHandler:completionHandler];
//}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    IMIconnectPlugin *pushHandler = [self getCommandInstance:@"IMIconnectPlugin"];
    [pushHandler application:application performFetchWithCompletionHandler:completionHandler];
}

- (NSMutableArray *)launchNotification
{
    return objc_getAssociatedObject(self, &launchNotificationKey);
}

- (void)setLaunchNotification:(NSDictionary *)aDictionary
{
    objc_setAssociatedObject(self, &launchNotificationKey, aDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)coldstart
{
    return objc_getAssociatedObject(self, &coldstartKey);
}

- (void)setColdstart:(NSNumber *)aNumber
{
    objc_setAssociatedObject(self, &coldstartKey, aNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dealloc
{
    self.launchNotification = nil; // clear the association and release the object
    self.coldstart = nil;
}
#pragma mark ApplicationStates
-(void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"active state");

}
-(void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"foreground state");
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"background state");
}
-(void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"terminate state");
}
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
//    NSLog(@"usercenter : %@",response);
//    completionHandler();
//}

@end
