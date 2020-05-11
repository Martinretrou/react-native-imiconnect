
// @protocol ICSecurityTokenErrorDelegate;
// @class ICConfig;

// #import <Cordova/CDV.h>
// #import <Cordova/CDVPlugin.h>
#import "CDVPlugin.h"
#import <IMIconnectCoreSDK/IMIconnectCoreSDK.h>

@interface IMIconnectPlugin : CDVPlugin

// @property (nonatomic, strong) NSDictionary *notificationMessage;
// @property (nonatomic, strong) NSString *password;

// @property BOOL clearBadge;
// @property BOOL isInline;
// @property BOOL coldstart;

// //IMIConnect
// - (void)icConfig:(CDVInvokedUrlCommand *)command;
// - (void)startupWithConfig:(CDVInvokedUrlCommand *)command;
// - (void)startup:(CDVInvokedUrlCommand *)command;
// - (void)isSubscribed:(CDVInvokedUrlCommand*)command;
// - (void)publishEvent:(CDVInvokedUrlCommand*)command;

// - (void)messageListener:(CDVInvokedUrlCommand *)command;
// - (void)deeplinkListener:(CDVInvokedUrlCommand *)command;
// - (void)connectionStatusChangedListener:(CDVInvokedUrlCommand *)command;

// - (void)getSDKVersion:(CDVInvokedUrlCommand *)command;
// - (void)getDeviceProfile:(CDVInvokedUrlCommand *)command;
// - (void)getDeviceId:(CDVInvokedUrlCommand *)command;
// - (void)getAppUserId:(CDVInvokedUrlCommand *)command;
// - (void)getCustomerId:(CDVInvokedUrlCommand *)command;
// - (void)getDefaultDeviceId:(CDVInvokedUrlCommand *)command;
// - (void)getPolicyPollingInterval:(CDVInvokedUrlCommand *)command;
// - (void)getAppId:(CDVInvokedUrlCommand *)command;
// - (void)getClientKey:(CDVInvokedUrlCommand *)command;
// - (void)getProjectNumber:(CDVInvokedUrlCommand *)command;
// - (void)getlogPath:(CDVInvokedUrlCommand*)command;
// - (void)getContentType:(CDVInvokedUrlCommand *)command;
// - (void)getDuration:(CDVInvokedUrlCommand *)command;
// - (void)getVideoDuration:(CDVInvokedUrlCommand *)command;
// - (void)getPreviewImage:(CDVInvokedUrlCommand *)command;
// - (void)getVideoPreviewImage:(CDVInvokedUrlCommand *)command;
// - (void)getLatitude:(CDVInvokedUrlCommand *)command;
// - (void)getLongitude:(CDVInvokedUrlCommand *)command;
// - (void)getTopic:(CDVInvokedUrlCommand*)command;

// - (void)setPolicyPollingInterval:(CDVInvokedUrlCommand *)command;
// - (void)setSecurityToken :(CDVInvokedUrlCommand *)command;
// - (void)setLogOptions:(CDVInvokedUrlCommand*)command;
// - (void)setRetentionDuration:(CDVInvokedUrlCommand*)command;
// - (void)setMessageSyncPolicy:(CDVInvokedUrlCommand*)command;

// - (void)connect:(CDVInvokedUrlCommand *)command;
// - (void)disconnect:(CDVInvokedUrlCommand *)command;
// - (void)isConnected:(CDVInvokedUrlCommand *)command;
// - (void)getConnectionStatus:(CDVInvokedUrlCommand *)command;
// - (void)isRTMSupported:(CDVInvokedUrlCommand *)command;
// - (void)shutdown:(CDVInvokedUrlCommand *)command;

// - (void)fetchTopics:(CDVInvokedUrlCommand *)command;
// - (void)setMessageAsRead:(CDVInvokedUrlCommand *)command;
// - (void)setMessagesAsRead:(CDVInvokedUrlCommand *)command;
// - (void)subscribeTopic:(CDVInvokedUrlCommand *)command;
// - (void)unsubscribeTopic:(CDVInvokedUrlCommand *)command;

// - (void)register:(CDVInvokedUrlCommand *)command;
// - (void)registerNoUser:(CDVInvokedUrlCommand *)command;
// - (void)unregister:(CDVInvokedUrlCommand *)command;
// - (void)isRegistered:(CDVInvokedUrlCommand*)command;
// - (void)generatePin:(CDVInvokedUrlCommand*)command;
// - (void)validatePin:(CDVInvokedUrlCommand*)command;
// - (void)updateProfileData:(CDVInvokedUrlCommand *)command;
// - (void)removeProfileData:(CDVInvokedUrlCommand *)command;
// - (void)updateUserId:(CDVInvokedUrlCommand *)command;
// - (void)removeUserId:(CDVInvokedUrlCommand *)command;

// - (void)downloadFile:(CDVInvokedUrlCommand *)command;
// - (void)uploadFile:(CDVInvokedUrlCommand *)command;
// - (void)getCachedFile:(CDVInvokedUrlCommand *)command;
// - (void)isFileDownloading:(CDVInvokedUrlCommand *)command;
// - (void)isFileUploading:(CDVInvokedUrlCommand *)command;

// //Message
// - (void)publishMessage:(CDVInvokedUrlCommand *)command;
// - (void)fetchMessages:(CDVInvokedUrlCommand *)command;
// - (void)deleteMessage:(CDVInvokedUrlCommand *)command;
// - (void)publishTypingIndicator:(CDVInvokedUrlCommand *)command;

// //Threads
// - (void)createThread:(CDVInvokedUrlCommand *)command;
// - (void)updateThread:(CDVInvokedUrlCommand *)command;
// - (void)closeThread:(CDVInvokedUrlCommand *)command;
// - (void)fetchThreads:(CDVInvokedUrlCommand *)command;


// - (void)setApplicationIconBadgeNumber:(CDVInvokedUrlCommand *)command;
// - (void)getApplicationIconBadgeNumber:(CDVInvokedUrlCommand *)command;

// - (void)successWithMessage:(NSString *)myCallbackId withMsg:(NSString *)message;
// - (void)failWithMessage:(NSString *)myCallbackId withMsg:(NSString *)message withError:(NSError *)error;

// //ICMessageStore

// - (void)saveMessage:(CDVInvokedUrlCommand *)command;
// - (void)saveMessages:(CDVInvokedUrlCommand *)command;
// - (void)loadMessage:(CDVInvokedUrlCommand *)command;
// - (void)loadMessages:(CDVInvokedUrlCommand *)command;
// - (void)loadLatestOutgoingMessage:(CDVInvokedUrlCommand *)command;
// - (void)deleteMessageFromStore:(CDVInvokedUrlCommand *)command;
// - (void)getMessageCount:(CDVInvokedUrlCommand *)command;

// - (void)saveThread:(CDVInvokedUrlCommand *)command;
// - (void)saveThreads:(CDVInvokedUrlCommand *)command;
// - (void)loadThread:(CDVInvokedUrlCommand *)command;
// - (void)loadThreads:(CDVInvokedUrlCommand *)command;
// - (void)loadUnreadThreads:(CDVInvokedUrlCommand *)command;
// - (void)deleteThread:(CDVInvokedUrlCommand *)command;
// - (void)getThreadCount:(CDVInvokedUrlCommand *)command;
// - (void)getUnReadThreadCount:(CDVInvokedUrlCommand *)command;
// - (void)deleteAll:(CDVInvokedUrlCommand *)command;

// //Appdelegate
// - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

// - (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;

// - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

// - (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

// - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

// - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
// - (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;

// //- (void)application:(UIApplication *) application handleActionWithIdentifier: (NSString *) identifier forRemoteNotification: (NSDictionary *) notification completionHandler: (void (^)()) completionHandler;

// - (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler;

// - (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *_Nullable)userInfo withResponseInfo:(NSDictionary *_Nullable)responseInfo completionHandler:(void(^_Nullable)())completionHandler;

// - (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

// @end
