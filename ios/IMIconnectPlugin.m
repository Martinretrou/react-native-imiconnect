
// @protocol ICMessagingDelegate;
// @class ICMessaging;

// @protocol ICSecurityTokenErrorDelegate;
// @class ICConfig;


#import "IMIconnectPlugin.h"
// #import <Cordova/CDV.h>
// #import <UserNotifications/UserNotifications.h>
// #import <CommonCrypto/CommonCrypto.h>
// #import "NSData+Encryption.h"
#import "CDVPlugin.h"

@interface IMIconnectPlugin ()
{

// }
// @property (nonatomic, copy) NSString *callbackId;
// @property (nonatomic, copy) NSString *callback;

// @property (nonatomic, strong) NSMutableArray *messageCallBackIds;
// @property (nonatomic, strong) NSMutableArray *deepLinkCallBackIds;
// @property (nonatomic, strong) NSMutableArray *securityTokenErrorCallBackIds;
// @property (nonatomic, strong) NSMutableArray *connectionChangeCallBackIds;

// @property (nonatomic, strong) NSMutableDictionary *handlerObj;
// @property (nonatomic, strong) NSMutableArray *topicsHandlerObj;
// @property (nonatomic, strong) NSMutableArray *threadsHandlerObj;
// @property (nonatomic, strong) NSMutableArray *messageHandlerObj;

// @property (nonatomic) ICAppDelegate *icAppDelegate;
// @property (nonatomic) ICConfig *icConfig;
// @property (nonatomic) ICDeviceProfile *deviceProfile;

// @end

// @implementation IMIconnectPlugin : CDVPlugin

// - (ICAppDelegate *)icAppDelegate
// {
//     if (_icAppDelegate != nil)
//     {
//         return _icAppDelegate;
//     }

//     _icAppDelegate = [ICAppDelegate new];
//     return _icAppDelegate;
// }


// #pragma mark- StartUP

// - (void)startupWithConfig:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *rootArray = [command argumentAtIndex:0];
//     NSString *app_id =  [rootArray valueForKey:@"appId"];
//     NSString *client_key = [rootArray valueForKey:@"clientKey"];
//     NSString *groupIdentifier = [rootArray valueForKey:@"groupIdentifier"];
//     NSString *serverDomain = [rootArray valueForKey:@"serverDomain"];

//     _icConfig = [[ICConfig alloc] initWithAppId:app_id
//                                       clientKey:client_key
//                                 groupIdentifier:groupIdentifier
//                                    serverDomain:serverDomain];

//     NSError *error;
//     [IMIconnect startupWithConfig:_icConfig error:&error];

//     if (error)
//     {
//         NSLog(@"Startup failed. Reason: %@", error.localizedDescription);
//         [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//     }
//     else
//     {
//         NSLog(@"Startup succeeded.");
//         [self successWithMessage:command.callbackId withInt:1];
//     }
// }

// - (void)startup:(CDVInvokedUrlCommand *)command
// {
//     NSError *error;

//     [IMIconnect startup:&error];
//     if(error)
//     {
//         NSLog(@"Startup failed. Reason: %@", error.localizedDescription);
//         [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//     }

//     else
//     {
//         NSLog(@"Startup succeeded.");
//         [self successWithMessage:command.callbackId withInt:1];
//     }
// }

// - (void)isSubscribed:(CDVInvokedUrlCommand*)command
// {
//     ICTopic *topic = [[ICTopic alloc]init];
//     BOOL subscription = topic.isSubscribed;
//     [self successWithMessage:command.callbackId withInt:subscription];
// }

// - (void)publishEvent:(CDVInvokedUrlCommand*)command
// {
//     NSDictionary *eventDict = [command argumentAtIndex:0];
//     if(eventDict)
//     {
//         [IMIconnect publishEventParam:eventDict completionHandler:^(NSDictionary *response, NSError *error)
//         {
//             if(error)
//             {
//                 NSLog(@"error :%@",error);
//                 [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//             }
//             else
//             {
//                 [self successWithMessage:command.callbackId withDictionary:response];
//             }
//         }];
//     }
//     else
//     {
//         NSString *errMsg = @"Please provide the valid Event parameter value";
//         NSError *error = [[NSError alloc] initWithDomain:@"Invalid Parameter Value" code:6004 userInfo:@{NSLocalizedDescriptionKey:errMsg}];

//         [self failWithMessage:command.callbackId withMsg:errMsg withError:error];
//     }
// }

// #pragma mark - GET Methods

// - (void)getSDKVersion:(CDVInvokedUrlCommand *)command
// {
//     NSString *callbackid = command.callbackId;
//     NSString *sdkVersion = [IMIconnect sdkVersion];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:sdkVersion];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackid];
// }
// #pragma mark DeviceProfile

// - (void)getDeviceProfile:(CDVInvokedUrlCommand *)command
// {
//     NSError *error;
//     ICDeviceProfile *deviceprofile = IMIconnect.deviceProfile;
//     NSMutableDictionary *deviceProfileDict = [[NSMutableDictionary alloc]init];
//     [deviceProfileDict setObject:deviceprofile.deviceId forKey:@"deviceId"];
//     [deviceProfileDict setObject:deviceprofile.customerId forKey:@"customerId"];
//     [deviceProfileDict setObject:deviceprofile.appUserId forKey:@"appUserId"];
//     [deviceProfileDict setObject:[NSNumber numberWithBool:deviceprofile.isAppUserIdSystemGenerated] forKey:@"isAppUserSystemGenerated"];
//     [deviceProfileDict setObject:[NSNumber numberWithBool:deviceprofile.isGuest] forKey:@"isGuest"];

//     if(_deviceProfile !=nil)
//     {
//         [self successWithMessage:command.callbackId withDictionary:deviceProfileDict];
//     }
//     else
//     {
//         [self failWithMessage:command.callbackId withMsg:@"getDeviceProfile failed" withError:error];
//     }

// }

// - (void)getDeviceId:(CDVInvokedUrlCommand *)command
// {
//     NSString *deviceID = _deviceProfile.deviceId;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceID];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

// }

// - (void)getAppUserId:(CDVInvokedUrlCommand *)command
// {
//     ICDeviceProfile *deviceProfile = [IMIconnect deviceProfile];
//     NSString *appUserId = deviceProfile.appUserId;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:appUserId];

//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getCustomerId:(CDVInvokedUrlCommand *)command
// {
//     NSString *customerID = _deviceProfile.customerId;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:customerID];

//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getDefaultDeviceId:(CDVInvokedUrlCommand *)command
// {
//     NSString *defaultDevice = [ICDeviceProfile defaultDeviceId];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:defaultDevice];

//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getPolicyPollingInterval:(CDVInvokedUrlCommand *)command
// {
//     NSTimeInterval time = [IMIconnect policyPollingInterval];
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:time];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
// }

// - (void)getAppId:(CDVInvokedUrlCommand *)command
// {
//     NSString *appID = _icConfig.appId;
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:appID];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
// }

// - (void)getClientKey:(CDVInvokedUrlCommand *)command
// {
//     NSString *clientKey = _icConfig.clientKey;
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:clientKey];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
// }

// - (void)getProjectNumber:(CDVInvokedUrlCommand *)command
// {
//     NSString *groipID = _icConfig.groupIdentifier;
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:groipID];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
// }

// - (void)getlogPath:(CDVInvokedUrlCommand*)command {

//     NSString *callbackId = command.callbackId;
//     NSString *pathForLog = [ICLogger logPath];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:pathForLog];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
// }
// - (void)getContentType:(CDVInvokedUrlCommand *)command
// {
//     ICAttachment *attachment = [[ICAttachment alloc]init];
//     NSString *attachmentType = attachment.contentType;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:attachmentType];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getDuration:(CDVInvokedUrlCommand *)command
// {
//     ICAudioAttachment *attachment = [[ICAudioAttachment alloc]init];
//     long attachmentType = attachment.duration;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:attachmentType];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getVideoDuration:(CDVInvokedUrlCommand *)command
// {
//     ICVideoAttachment *attachment = [[ICVideoAttachment alloc]init];
//     long attachmentType = attachment.duration;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:attachmentType];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getPreviewImage:(CDVInvokedUrlCommand *)command
// {
//     ICImageAttachment *attachment = [[ICImageAttachment alloc]init];
//     UIImage *previewImage = attachment.preview;

//     NSData *imageData = UIImageJPEGRepresentation(previewImage, 1.0);
//     NSString *base64image = [imageData base64Encoding];

//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:base64image];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getVideoPreviewImage:(CDVInvokedUrlCommand *)command
// {
//     ICVideoAttachment *attachment = [[ICVideoAttachment alloc]init];
//     UIImage *previewImage = attachment.preview;
//     NSData *imageData = UIImageJPEGRepresentation(previewImage, 1.0);
//     NSString *base64image = [imageData base64Encoding];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:base64image];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getLatitude:(CDVInvokedUrlCommand *)command
// {
//     ICLocationAttachment *loc =[[ICLocationAttachment alloc]init];
//     NSString *lattitude = [NSString stringWithFormat:@"%.20f", loc.latitude];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:lattitude];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getLongitude:(CDVInvokedUrlCommand *)command
// {
//     ICLocationAttachment *loc =[[ICLocationAttachment alloc]init];
//     NSString *longitude = [NSString stringWithFormat:@"%.20f", loc.longitude];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:longitude];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getTopic:(CDVInvokedUrlCommand*)command
// {
//     NSString *callbackId = command.callbackId;
//     ICTopic *topic = [[ICTopic alloc]init];
//     NSString *title = topic.name;
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:title];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
// }


// #pragma mark - SET

// - (void)setPolicyPollingInterval:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *timeDict = [command argumentAtIndex:0];
//     NSString *time = [timeDict valueForKey:@"interval"];

//     double timeInterval = [time doubleValue];
//     NSTimeInterval intervalForTimer = timeInterval;
//     [IMIconnect setPolicyPollingInterval:intervalForTimer];
//     [self successWithMessage:command.callbackId withMsg:[NSString stringWithFormat:@"%f",intervalForTimer]];
// }

// - (void)setMessageSyncPolicy:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *syncPolicyDict = [command argumentAtIndex:0];

//     ICMessageSynchronizationPolicy *syncPolicy = [ICMessageSynchronizationPolicy new];
//     [syncPolicy setMode:[self getMessageSyncMode:[[syncPolicyDict objectForKey:@"synchronizationMode"] intValue]]];
//     [syncPolicy setMaxThreads:[[syncPolicyDict objectForKey:@"maxThreads"] intValue]];
//     [syncPolicy setMaxMessagesPerThread:[[syncPolicyDict objectForKey:@"maxMessagesPerThread"] intValue]];

//     [ICMessageSynchronizer setPolicy:syncPolicy];
//     [self successWithMessage:command.callbackId withInt:1];
// }

// - (ICMessageSynchronizationMode )getMessageSyncMode:(int)syncMode
// {
//     ICMessageSynchronizationMode icMessageSynchronizationMode = ICMessageSynchronizationModeNone;
//     switch (syncMode) {
//         case 1:
//             icMessageSynchronizationMode = ICMessageSynchronizationModeLimited;
//             break;
//         case 2:
//             icMessageSynchronizationMode = ICMessageSynchronizationModeFull;
//             break;
//         default:
//             icMessageSynchronizationMode = ICMessageSynchronizationModeNone;
//             break;
//     }
//     return icMessageSynchronizationMode;
// }

// - (void)setSecurityToken :(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *securityTokenDict = [command argumentAtIndex:0];
//     NSString *token = [securityTokenDict valueForKey:@"token"];
//     [IMIconnect setSecurityToken:token];
//     [self successWithMessage:command.callbackId withInt:1];
// //    [self.commandDelegate runInBackground:^{
// //    }];
// }

// - (void)registerSecurityTokenExceptionListener :(CDVInvokedUrlCommand *)command
// {
//     if(self.securityTokenErrorCallBackIds == nil)
//     {
//         self.securityTokenErrorCallBackIds = [[NSMutableArray alloc] init];
//     }

//     if(![self.securityTokenErrorCallBackIds containsObject:command.callbackId])
//     {
//         [self.securityTokenErrorCallBackIds addObject:command.callbackId];
//     }

//     [IMIconnect setSecurityTokenErrorDelegate:self];
// }

// - (void)didReceiveTokenError:(NSError *)error
// {
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:[self getErrorJson:error]];
//     [commandResult setKeepCallbackAsBool:YES];

//     for(NSString *callBackId in self.securityTokenErrorCallBackIds)
//     {
//         [self.commandDelegate sendPluginResult:commandResult callbackId:callBackId];
//     }
// }

// - (void)setLogOptions:(CDVInvokedUrlCommand*)command
// {
//     [ICLogger setLogType:ICLogTypeDebug forLogTarget:ICLogTargetConsole];
//     [self successWithMessage:command.callbackId withMsg:[NSString stringWithFormat:@"setlogOptions ICLogTypeDebug/ICLogTargetConsole called"]];
// }

// - (void)setRetentionDuration:(CDVInvokedUrlCommand*)command
// {
//     NSDictionary *durationArr = [command argumentAtIndex:0];
//     NSString *duration;
//     duration = [durationArr valueForKey:@"days"];
//     int durationdays = [duration intValue];
//     [ICLogger setRetentionDuration:durationdays];
//     [self successWithMessage:command.callbackId withInt:1];
// }

// #pragma mark - ICMessageStore

// //ICMessageStore

// - (void)saveMessage:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *messageDict = [command argumentAtIndex:0];
//     ICMessage *message = [[ICMessage alloc] initWithData:[self dataFromDictionary:messageDict]];
//     BOOL status = [[ICMessaging shared].messageStore saveMessage:message];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)saveMessages:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *messageDict = [command argumentAtIndex:0];
//     ICMessage *message = [[ICMessage alloc] initWithData:[self dataFromDictionary:messageDict]];
//     BOOL status = [[ICMessaging shared].messageStore saveMessage:message];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)loadMessage:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *transIdDict = [command argumentAtIndex:0];
//     ICMessage *message = [[ICMessaging shared].messageStore loadMessageWithTransactionId:[transIdDict objectForKey:@"transactionId"]];
//     [self successWithMessage:command.callbackId withDictionary:message.dictionary];
// }

// - (void)loadMessages:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *dict = [command argumentAtIndex:0];
//     int limit = [[dict objectForKey:@"limit"] intValue];
//     long int timeIntervalBefore = [[dict objectForKey:@"submittedBefore"] doubleValue];
//     long int timeIntervalAfter = [[dict objectForKey:@"submittedAfter"] doubleValue];
//     NSDate *beforeDate = [NSDate dateWithTimeIntervalSince1970:(timeIntervalBefore/1000)];
//     NSDate *afterDate = [NSDate dateWithTimeIntervalSince1970:(timeIntervalAfter/1000)];

//     NSArray *messages = [[ICMessaging shared].messageStore loadMessagesWithThreadId:[dict objectForKey:@"threadId"] submittedBefore:beforeDate submittedAfter:afterDate limit:limit];

//     _messageHandlerObj = [[NSMutableArray alloc]init];
//     if (messages != nil && messages.count > 0)
//     {
//         for (ICMessage *message in messages)
//         {
//             [_messageHandlerObj addObject:message.dictionary];
//         }
//         [self successWithMessage:command.callbackId withArray:_messageHandlerObj];
//     }

// }

// - (void)loadLatestOutgoingMessage:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICMessage *message = [[ICMessaging shared].messageStore loadLatestOutgoingMessageWithThreadId:[threadDict objectForKey:@"threadId"]];
//     [self successWithMessage:command.callbackId withDictionary:message.dictionary];
// }

// - (void)deleteMessageFromStore:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *transIdDict = [command argumentAtIndex:0];
//     BOOL status = [[ICMessaging shared].messageStore deleteMessageWithTransactionId:[transIdDict objectForKey:@"transactionId"]];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getMessageCount:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     int messagesCount = [[ICMessaging shared].messageStore numberOfMessagesForThreadId:[threadDict objectForKey:@"threadId"]];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:messagesCount];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)saveThread:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICThread *thread = [[ICThread alloc] initWithData:[self dataFromDictionary:threadDict]];
//     BOOL status = [[ICMessaging shared].messageStore saveThread:thread];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)saveThreads:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICThread *thread = [[ICThread alloc] initWithData:[self dataFromDictionary:threadDict]];
//     BOOL status = [[ICMessaging shared].messageStore saveThread:thread];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)loadThread:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICThread *thread = [[ICMessaging shared].messageStore loadThreadWithThreadId:[threadDict objectForKey:@"threadId"]];
//     [self successWithMessage:command.callbackId withDictionary:[self dictionaryFromData:thread.data]];
// }

// - (void)loadThreads:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     int limit = [[threadDict objectForKey:@"limit"] intValue];
//     long int timeIntervalBefore = [[threadDict objectForKey:@"modifiedBefore"] doubleValue];
//     long int timeIntervalAfter = [[threadDict objectForKey:@"modifiedAfter"] doubleValue];
//     NSDate *beforeDate = [NSDate dateWithTimeIntervalSince1970:(timeIntervalBefore/1000)];
//     NSDate *afterDate = [NSDate dateWithTimeIntervalSince1970:(timeIntervalAfter/1000)];

//     NSArray *threads = [[ICMessaging shared].messageStore loadThreadsUpdatedBeforeDate:beforeDate updatedAfter:afterDate limit:limit];

//     _threadsHandlerObj = [[NSMutableArray alloc]init];
//     if (threads != nil && threads.count > 0)
//     {
//         for (ICThread *thread in threads)
//         {
//             [_threadsHandlerObj addObject:[self dictionaryFromData:thread.data]];
//         }
//         [self successWithMessage:command.callbackId withArray:_threadsHandlerObj];
//     }
// }

// - (void)loadUnreadThreads:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     int limit = [[threadDict objectForKey:@"limit"] intValue];
//     NSArray *threads = [[ICMessaging shared].messageStore loadUnreadThreadsWithLimit:limit];
//     _threadsHandlerObj = [[NSMutableArray alloc]init];
//     if (threads != nil && threads.count > 0)
//     {
//         for (ICThread *thread in threads)
//         {
//             [_threadsHandlerObj addObject:[self dictionaryFromData:thread.data]];
//         }
//         [self successWithMessage:command.callbackId withArray:_threadsHandlerObj];
//     }
// }

// - (void)deleteThread:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     BOOL status = [[ICMessaging shared].messageStore deleteThreadWithThreadId:[threadDict objectForKey:@"threadId"]];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getThreadCount:(CDVInvokedUrlCommand *)command
// {
//     int threadsCount = [[ICMessaging shared].messageStore numberOfThreads];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:threadsCount];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getUnReadThreadCount:(CDVInvokedUrlCommand *)command
// {
//     NSInteger threadsCount = [[ICMessaging shared].messageStore numberOfUnreadThreads];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSInteger:threadsCount];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)deleteAll:(CDVInvokedUrlCommand *)command
// {
//     BOOL status = [[ICMessaging shared].messageStore deleteAll];
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// #pragma mark - RTMManager

// - (void)connect:(CDVInvokedUrlCommand *)command
// {
//     [ICMessaging shared].delegate = self;
//     [ICMessaging shared].actionsDelegate = self;

//     if ([[ICMessaging shared] connect:nil]){
//         [self successWithMessage:command.callbackId withInt:1];
//     } else{
//         [self failWithMessage:command.callbackId withMsg:@"" withError:nil];
//     }
// }

// - (void)disconnect:(CDVInvokedUrlCommand *)command
// {
//     NSError * error;
//     [[ICMessaging shared] disconnect: & error];
//     if (error) {
//         [self failWithMessage:command.callbackId withMsg:@"" withError:error];
//     } else {
//         [self successWithMessage:command.callbackId withMsg:@""];
//     }
// }

// - (void)isConnected:(CDVInvokedUrlCommand *)command
// {
//     BOOL isConnected = NO;
//     if([[ICMessaging shared] isConnected]){
//         isConnected = YES;
//     }
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isConnected];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

// - (void)getConnectionStatus:(CDVInvokedUrlCommand *)command
// {
//     ICConnectionStatus connectionStatus = [[ICMessaging shared] connectionStatus];
//     NSString *connectionStatusStr = [self prettyStringFromConnectionStatus:connectionStatus];

//     [self successWithMessage:command.callbackId withMsg:connectionStatusStr];
// }

// - (void)connectionStatusChangedListener:(CDVInvokedUrlCommand *)command
// {
//     if(self.connectionChangeCallBackIds == nil)
//     {
//         self.connectionChangeCallBackIds = [[NSMutableArray alloc] init];
//     }

//     if(![self.connectionChangeCallBackIds containsObject:command.callbackId])
//     {
//         [self.connectionChangeCallBackIds addObject:command.callbackId];
//     }
// }

// - (void)didChangeConnectionStatus:(ICConnectionStatus)connectionStatus
// {
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[self prettyStringFromConnectionStatus:connectionStatus]];
//     [commandResult setKeepCallbackAsBool:YES];

//     for(NSString *callBackId in self.connectionChangeCallBackIds)
//     {
//         [self.commandDelegate sendPluginResult:commandResult callbackId:callBackId];
//     }
// }

// - (NSString *)prettyStringFromConnectionStatus:(ICConnectionStatus)connectionStatus
// {
//     switch (connectionStatus)
//     {
//         case ICConnectionStatusConnecting:
//             return @"Connecting";
//         case ICConnectionStatusConnected:
//             return @"Connected";
//         case ICConnectionStatusRefused:
//             return @"Refused";
//         case ICConnectionStatusClosed:
//             return @"Closed";
//         case ICConnectionStatusError:
//             return @"Error";
//         default:
//             return @"None";
//     }
// }

// - (void)isRTMSupported:(CDVInvokedUrlCommand *)command
// {
// }

// #pragma mark - ICMessaging
// - (void)fetchTopics:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *topicsDict = [command argumentAtIndex:0];
//     NSString *topicInt = [topicsDict valueForKey:@"offset"];
//     int offset = [topicInt intValue];
//     [[ICMessaging shared] fetchTopics:offset
//                     completionHandler:^(NSArray *topics, BOOL hasMoreTopics, NSError *error)
//      {
//          if(error != nil)
//          {
//              NSLog(@"error :%@",error);
//              [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//          }
//          else
//          {
//              _topicsHandlerObj = [[NSMutableArray alloc]init];
//              if (topics != nil && topics.count > 0)
//              {
//                  for (ICTopic *topic in topics)
//                  {
//                      [_topicsHandlerObj addObject:[self dictionaryFromData:topic.data]];
//                  }
//              }

//              [self successWithMessage:command.callbackId withDictionary:@{@"topics" : _topicsHandlerObj, @"hasMoreData" : [NSNumber numberWithBool:hasMoreTopics]}];
//          }
//      }];
// }

// - (void)setMessageAsRead:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *appuseDict  = [command argumentAtIndex:0];
//     NSString *transcID = [appuseDict valueForKey:@"messageId"];
//     NSArray *strings = [transcID componentsSeparatedByString:@","];
//     [[ICMessaging shared] setMessageAsReadForTransactionId:transcID
//                                          completionHandler:^(NSError *error)
//      {
//          if (error)
//          {
//              [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//          }
//          else
//          {
//              NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc]init];
//              [jsonDict setObject:strings forKey:@"tids"];
//              [self successWithMessage:command.callbackId withDictionary:jsonDict];
//          }
//      }];
// }

// - (void)setMessagesAsRead:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *appuseDict  = [command argumentAtIndex:0];
//     NSString *transactionids = [appuseDict valueForKey:@"messageIds"];
//     NSArray *strings = [transactionids componentsSeparatedByString:@","];

//     [[ICMessaging shared] setMessagesAsReadForTransactionIds:strings completionHandler:^(NSError *error) {
//         {
//             if (error)
//             {
//                 [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//             }
//             else
//             {
//                 NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc]init];
//                 [jsonDict setObject:strings forKey:@"tids"];
//                 [self successWithMessage:command.callbackId withDictionary:jsonDict];
//             }
//         }
//     }];

// }

// - (void)subscribeTopic:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *topicidDict = [command argumentAtIndex:0];
//     NSString *topicId = [topicidDict valueForKey:@"topicId"];
//     [[ICMessaging shared] subscribeTopic:topicId completionHandler:^(NSError *error)
//      {
//          if (error)
//          {
//              [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//          }
//          else
//          {
//              [self successWithMessage:command.callbackId withMsg:topicId];
//          }
//      }];
// }

// - (void)unsubscribeTopic:(CDVInvokedUrlCommand *)command
// {

//     NSDictionary *topicidDict = [command argumentAtIndex:0];
//     NSString *topicId = [topicidDict valueForKey:@"topicId"];
//     [[ICMessaging shared] unsubscribeTopic:topicId completionHandler:^(NSError *error)
//      {
//          if (error)
//          {
//              [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//          }
//          else
//          {
//              [self successWithMessage:command.callbackId withMsg:topicId];
//          }
//      }];
// }

// #pragma mark - register


// - (void)shutdown:(CDVInvokedUrlCommand *)command
// {
//     [IMIconnect shutdown];
//     [self successWithMessage:command.callbackId withInt:1];
// }

// - (void)register:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *appuseDict  = [command argumentAtIndex:0];
//     NSString *appuseId = [appuseDict valueForKey:@"appUserId"];
//     NSString *deviceId = [appuseDict valueForKey:@"deviceId"];
//     if(appuseId && appuseId.length > 0)
//     {
//         _deviceProfile = [[ICDeviceProfile alloc]
//                           initWithDeviceId:deviceId appUserId:appuseId];
//     }else{
//         _deviceProfile = [[ICDeviceProfile alloc]
//                           initWithDeviceId:deviceId];
//     }

//     id isGuest = [appuseDict objectForKey:@"isGuest"];
//     [_deviceProfile setIsGuest: isGuest ? [isGuest boolValue] : NO];

//     [self registerWithDeviceProfile:_deviceProfile command:command];
// }

// - (void)registerNoUser:(CDVInvokedUrlCommand *)command
// {
//     _deviceProfile = [[ICDeviceProfile alloc]
//                       initWithDeviceId:[ICDeviceProfile defaultDeviceId]];

//     [self registerWithDeviceProfile:_deviceProfile command:command];
// }

// - (void)registerWithDeviceProfile:(ICDeviceProfile *)deviceProfile command:(CDVInvokedUrlCommand *)command
// {
//     [IMIconnect registerWithDeviceProfile:_deviceProfile
//                         completionHandler:^(NSDictionary *response, NSError *error)
//      {
//          if(error)
//          {
//              NSLog(@"error :%@",error);
//              [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//          }
//          else
//          {
//              [self successWithMessage:command.callbackId withDictionary:response];
//              [ICMessaging shared].actionsDelegate = self;
//              [ICMessaging shared].delegate = self;
//          }
//      }];
// }

// - (void)generatePin:(CDVInvokedUrlCommand*)command
// {
//     NSDictionary *jsonDict  = [command argumentAtIndex:0];
//     NSString *userId = [jsonDict valueForKey:@"userId"];

//     [ICUserAuthentication generatePinForUserId:userId completionHandler:^(NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             [self successWithMessage:command.callbackId withMsg:@"GeneratePin success"];
//         }
//     }];
// }

// - (void)validatePin:(CDVInvokedUrlCommand*)command
// {
//     NSDictionary *jsonDict  = [command argumentAtIndex:0];
//     NSString *userId = [jsonDict valueForKey:@"userId"];
//     NSString *pin = [jsonDict valueForKey:@"pin"];
//     [ICUserAuthentication validatePin:pin forUserId:userId completionHandler:^(NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             [self successWithMessage:command.callbackId withMsg:@"Validate Pin success"];
//         }
//     }];
// }

// - (void)unRegister:(CDVInvokedUrlCommand *)command
// {
//     [IMIconnect unregister:^(NSError *error) {
//         if(error == nil)
//         {
//             NSLog(@"device unregistered");
//             [self successWithMessage:command.callbackId withDictionary:nil];
//         }else{
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//     }];
// }

// - (void)isRegistered:(CDVInvokedUrlCommand*)command {
//     [self successWithMessage:command.callbackId withInt:[IMIconnect isRegistered]];
// }

// - (void)connectMessage:(CDVInvokedUrlCommand*)command {

//     NSError *error;
//     [ICMessaging shared].delegate = self;
//     [[ICMessaging shared] connect: & error];
//     if (error)
//     {
//         NSLog(@ "Connection Failed. Reason: %@", error.localizedDescription);
//         [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//     }
//     else
//     {
//         [self successWithMessage:command.callbackId withInt:1];
//     }
// }

// - (void)updateProfileData:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *dict = [command argumentAtIndex:0];
//     NSString *value = [dict valueForKey:@"value"];
//     NSString *param = [dict valueForKey:@"param"];
//     ICDeviceProfileParam deviceProfileParam;
//     if ([param isEqualToString:@"customerId"]) {
//         deviceProfileParam = ICDeviceProfileParamCustomerId;
//     }
//     if ([param isEqualToString:@"userId"]) {
//         deviceProfileParam = ICDeviceProfileParamUserId;
//     }
//     [IMIconnect updateDeviceProfileParam:deviceProfileParam withValue:value completionHandler:^(NSDictionary *response, NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:@"%@" withError:error];
//         }
//         else
//         {
//             [self successWithMessage:command.callbackId withDictionary:response];
//         }
//     }];
// }

// - (void)updateUserId:(CDVInvokedUrlCommand *)command
// {

//     NSDictionary *customerIdDict = [command argumentAtIndex:0];
//     NSString *userId = [customerIdDict valueForKey:@"userId"];

//     [IMIconnect updateDeviceProfileParam:ICDeviceProfileParamUserId withValue:userId completionHandler:^(NSDictionary *response, NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:@"%@" withError:error];
//         }
//         else
//         {
//             [self successWithMessage:command.callbackId withDictionary:response];
//         }
//     }];
// }

// - (void)removeProfileData:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *dict = [command argumentAtIndex:0];
//     NSString *param = [dict valueForKey:@"param"];
//     ICDeviceProfileParam deviceProfileParam;
//     if ([param isEqualToString:@"customerId"]) {
//         deviceProfileParam = ICDeviceProfileParamCustomerId;
//     }
//     if ([param isEqualToString:@"userId"]) {
//         deviceProfileParam = ICDeviceProfileParamUserId;
//     }

//     [IMIconnect removeDeviceProfileParam:deviceProfileParam completionHandler:^(NSDictionary *response, NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:@"%@" withError:error];
//         }
//         else
//         {
//             [self successWithMessage:command.callbackId withDictionary:response];
//         }
//     }];
// }

// - (void)removeUserId:(CDVInvokedUrlCommand *)command
// {
//     [IMIconnect removeDeviceProfileParam:ICDeviceProfileParamUserId completionHandler:^(NSDictionary *response, NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:@"%@" withError:error];
//         }
//         else
//         {
//             [self successWithMessage:command.callbackId withDictionary:response];
//         }
//     }];
// }

// #pragma mark - Publish Message
// - (void)publishMessage:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *messageDict = [command argumentAtIndex:0];
//     ICMessage *message = [[ICMessage alloc] initWithData:[self dataFromDictionary:messageDict]];
//     [[ICMessaging shared] publishMessage:message completionHandler:^(NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             NSLog(@"publish message success");
//             [self successWithMessage:command.callbackId withDictionary:message.dictionary];
//         }
//     }];
// }

// - (void)fetchMessages:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     long int limit = [[threadDict objectForKey:@"limit"] integerValue];
//     long int timeInterval = [[threadDict objectForKey:@"beforeDate"] doubleValue];
//     NSDate *beforeDate = [NSDate dateWithTimeIntervalSince1970:(timeInterval/1000)];

//     [[ICMessaging shared] fetchMessagesForThreadId:[threadDict objectForKey:@"threadId"] untilDate:beforeDate limit:limit completionHandler:^(NSArray *messages, BOOL hasMoreMessages, NSError *error) {

//         if(error){
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];

//         }else{

//             _messageHandlerObj = [[NSMutableArray alloc]init];
//             if (messages != nil && messages.count > 0)
//             {
//                 for (ICMessage *message in messages)
//                 {
//                     [_messageHandlerObj addObject:message.dictionary];
//                 }
//             }

//             [self successWithMessage:command.callbackId withDictionary:@{@"messages" : _messageHandlerObj, @"hasMoreData" : [NSNumber numberWithBool:hasMoreMessages]}];
//         }
//     }];
// }

// #pragma mark - Threads

// - (void)createThread:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICThread *thread = [[ICThread alloc] initWithData:[self dataFromDictionary:threadDict]];

//     [[ICMessaging shared] createThread:thread completionHandler:^(ICThread *thread, NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             NSDictionary *threadDict = [self dictionaryFromData:thread.data];
//             [self successWithMessage:command.callbackId withDictionary:threadDict];
//         }
//     }];
// }

// - (void)updateThread:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICThread *thread = [[ICThread alloc] initWithData:[self dataFromDictionary:threadDict]];

//     [[ICMessaging shared] updateThread:thread completionHandler:^(NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             NSDictionary *threadDict = [self dictionaryFromData:thread.data];
//             [self successWithMessage:command.callbackId withDictionary:threadDict];
//         }
//     }];
// }

// - (void)closeThread:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     ICThread *thread = [[ICThread alloc] initWithData:[self dataFromDictionary:threadDict]];

//     [[ICMessaging shared] closeThread:thread completionHandler:^(NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             NSDictionary *threadDict = [self dictionaryFromData:thread.data];
//             [self successWithMessage:command.callbackId withDictionary:threadDict];
//         }
//     }];
// }

// - (void)fetchThreads:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *threadDict = [command argumentAtIndex:0];
//     long int limit = [[threadDict objectForKey:@"limit"] integerValue];
//     long int timeInterval = [[threadDict objectForKey:@"beforeDate"] doubleValue];
//     NSDate *beforeDate = [NSDate dateWithTimeIntervalSince1970:(timeInterval/1000)];

//     [[ICMessaging shared] fetchThreadsUpdatedBeforeDate:beforeDate limit:limit completionHandler:^(NSArray *threads, BOOL hasMoreThreads, NSError *error) {
//         if(error)
//         {
//             NSLog(@"error :%@",error);
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             _threadsHandlerObj = [[NSMutableArray alloc]init];
//             if (threads != nil && threads.count > 0)
//             {
//                 for (ICThread *thread in threads)
//                 {
//                     [_threadsHandlerObj addObject:[self dictionaryFromData:thread.data]];
//                 }
//             }

//             [self successWithMessage:command.callbackId withDictionary:@{@"threads" : _threadsHandlerObj, @"hasMoreData" : [NSNumber numberWithBool:hasMoreThreads]}];
//         }
//     }];
// }

// - (void)deleteMessage:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *transIdDict = [command argumentAtIndex:0];
//     NSString *transactionId = [transIdDict objectForKey:@"transactionId"];
//     if(transactionId != nil && transactionId.length > 0)
//     {
//         [[ICMessaging shared] deleteMessageForTransactionId:transactionId completionHandler:^(NSError *error) {
//             if(error)
//             {
//                 NSLog(@"error :%@",error);
//                 [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//             }
//             else
//             {
//                 [self successWithMessage:command.callbackId withMsg:transactionId];
//             }
//         }];
//     }
//     else
//     {
//         NSString *errMsg = @"Please provide the valid messageTransactionId";
//         NSError *error = [[NSError alloc] initWithDomain:@"Invalid Parameter Value" code:6004 userInfo:@{NSLocalizedDescriptionKey:errMsg}];

//         [self failWithMessage:command.callbackId withMsg:errMsg withError:error];
//     }
// }

// - (void)publishTypingIndicator:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary *dict = [command argumentAtIndex:0];

//     ICThread *thread = [[ICThread alloc] initWithData:[dict objectForKey:@"threadJson"]];

//     if(thread != nil)
//     {
//         id isEnable = [dict objectForKey:@"indicatorEnabled"];

//         [ICMessageHelper publishTypingIndicatorOnThread:thread typing:isEnable ? [isEnable boolValue] : NO];

//         CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
//         [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
//     }
//     else
//     {
//         NSString *errMsg = @"Please provide the valid thread";
//         NSError *error = [[NSError alloc] initWithDomain:@"Invalid Parameter Value" code:6004 userInfo:@{NSLocalizedDescriptionKey:errMsg}];

//         [self failWithMessage:command.callbackId withMsg:errMsg withError:error];
//     }

// }

// #pragma mark - ICMediaFileManager

// - (void)downloadFile:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary * fileDict = [command argumentAtIndex:0];
//     NSURL *fileUrl = [NSURL URLWithString:[fileDict valueForKey:@"fileUrl"]];
//     NSMutableDictionary *uploadDict = [[NSMutableDictionary alloc]init];
//     [ICMediaFileManager downloadFileAtURL:fileUrl completionHandler:^(NSData *contentOfFile, NSURL *filePath, NSError *error) {
//         if(error)
//         {
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }
//         else
//         {
//             [uploadDict setObject:@"true" forKey:@"completed"];
//             [uploadDict setObject:fileUrl.absoluteString forKey:@"filePath"];
//             [self successWithMessage:command.callbackId withDictionary:uploadDict];
//         }
//     }];
// }

// - (void)uploadFile:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary * fileDict = [command argumentAtIndex:0];
//     NSURL *fileUrl = [NSURL URLWithString:[fileDict valueForKey:@"fileUrl"]];
//     NSMutableDictionary *uploadDict = [[NSMutableDictionary alloc]init];

//     [ICMediaFileManager uploadFileFromLocation:fileUrl progressHandler:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
//         [uploadDict setObject:@"false" forKey:@"completed"];
//         [uploadDict setObject:[NSString stringWithFormat:@"%lld",totalBytesWritten] forKey:@"bytesUploaded"];
//         [uploadDict setObject:[NSString stringWithFormat:@"%lu",(unsigned long)bytesWritten] forKey:@"bytesTotal"];

//         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:uploadDict];
//         [commandResult setKeepCallbackAsBool:YES];

//         [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];

//     } completionHandler:^(NSString *mediaId, NSError *error) {
//         if (error){
//             [self failWithMessage:command.callbackId withMsg:error.localizedDescription withError:error];
//         }else{
//             [uploadDict setObject:@"true" forKey:@"completed"];
//             [uploadDict setObject:fileUrl.absoluteString forKey:@"filePath"];
//             [uploadDict setObject:mediaId forKey:@"mediaId"];
//             [self successWithMessage:command.callbackId withDictionary:uploadDict];
//         }
//     }];

// }

// - (void)getCachedFile:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary * fileDict = [command argumentAtIndex:0];
//     NSURL *cachedFile = [NSURL URLWithString:[fileDict valueForKey:@"fileUrl"]];
//     [ICMediaFileManager filePathForURL:cachedFile];

//     [self successWithMessage:command.callbackId withMsg:[NSString stringWithFormat:@"getCachedFile :Success"]];
// }

// - (void)isFileDownloading:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary * fileDict = [command argumentAtIndex:0];
//     NSURL *fileDownLoadUrl = [NSURL URLWithString:[fileDict valueForKey:@"fileUrl"]];
//     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
//     dispatch_async(queue, ^{

//         if ([ICMediaFileManager isFileDownloadingAtURL:fileDownLoadUrl] == YES) {
//             [self successWithMessage:command.callbackId withInt:1];
//         }
//         else{
//             [self successWithMessage:command.callbackId withInt:0];
//         }
//     });

// }

// - (void)isFileUploading:(CDVInvokedUrlCommand *)command
// {
//     NSDictionary * fileDict = [command argumentAtIndex:0];
//     NSURL *fileUploadUrl = [NSURL URLWithString:[fileDict valueForKey:@"fileUrl"]];

//     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
//     dispatch_async(queue, ^{

//         if ([ICMediaFileManager isFileUploadingFromLocation:fileUploadUrl] == YES) {
//             [self successWithMessage:command.callbackId withInt:1];
//         }
//         else{
//             [self successWithMessage:command.callbackId withInt:0];
//         }
//     });
// }

// - (void)setApplicationIconBadgeNumber:(CDVInvokedUrlCommand *)command
// {
//     NSMutableDictionary* options = [command.arguments objectAtIndex:0];
//     int badge = [[options objectForKey:@"badge"] intValue] ?: 0;

//     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];

//     NSString* message = [NSString stringWithFormat:@"app badge count set to %d", badge];
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
// }

// - (void)getApplicationIconBadgeNumber:(CDVInvokedUrlCommand *)command
// {
//     NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;

//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:(int)badge];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
// }

// #pragma mark-  CallBacks

// - (void)successWithMessage:(NSString *)myCallbackId withMsg:(NSString *)message
// {
//     if (myCallbackId != nil)
//     {
//         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
//         [self.commandDelegate sendPluginResult:commandResult callbackId:myCallbackId];
//     }
// }

// - (void)successWithMessage:(NSString *)myCallbackId withArray:(NSArray *)message
// {
//     if (myCallbackId != nil)
//     {
//         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:message];
//         [self.commandDelegate sendPluginResult:commandResult callbackId:myCallbackId];
//     }
// }

// - (void)successWithMessage:(NSString *)myCallbackId withDictionary:(NSDictionary *)message
// {
//     if (myCallbackId != nil)
//     {
//         if (message == nil) {
//             message = [[NSDictionary alloc]init];
//         }
//         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:message];
//         [self.commandDelegate sendPluginResult:commandResult callbackId:myCallbackId];
//     }
// }

// - (void)successWithMessage:(NSString *)myCallbackId withInt:(int)intValue
// {
//     if (myCallbackId != nil)
//     {
//         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:intValue];
//         [self.commandDelegate sendPluginResult:commandResult callbackId:myCallbackId];
//     }
// }

// - (void)failWithMessage:(NSString *)myCallbackId withMsg:(NSString *)message withError:(NSError *)error
// {
//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:[self getErrorJson:error]];
//     [self.commandDelegate sendPluginResult:commandResult callbackId:myCallbackId];
// }

// - (NSDictionary *)getErrorJson:(NSError *)error
// {
//     NSMutableDictionary *errorDict = [[NSMutableDictionary alloc]init];
//     if (error !=nil)
//     {
//         [errorDict setObject:[NSString stringWithFormat:@"%ld",(long)error.code] forKey:@"errCode"];
//         [errorDict setObject:error.localizedDescription forKey:@"errName"];
//     }
//     return errorDict;
// }

// #pragma mark - Received Message

// - (void)didReceiveMessage:(ICMessage *)message
// {
//     NSString *pswrd = (self.password !=nil && self.password.length>0)? self.password :@"messageData";

//     [[ICMessaging shared] setMessageAsReadForTransactionId:message.transactionId
//                                          completionHandler:^(NSError *error)
//      {
//          if (error)
//          {
//              NSLog(@"Can't set the message: %@ to read. Reason: %@"
//                    ,message.transactionId
//                    ,error.localizedDescription);
//          }
//          else
//          {
//              NSLog(@"Message:%@ has been set as read", message.transactionId);
//          }
//      }];

//     NSMutableArray * notificationArray = [[NSMutableArray alloc]init];
//     NSMutableArray* myMutableArrayAgain;
//     if ([self loadPreferenceWithKey:pswrd] !=nil) {
//         myMutableArrayAgain = [NSMutableArray arrayWithArray:[self loadPreferenceWithKey:pswrd]];
//     }
//     if(myMutableArrayAgain !=nil && myMutableArrayAgain.count > 0)
//     {
//         notificationArray = myMutableArrayAgain;
//     }
//     [notificationArray addObject:message.dictionary];

//     [self savePreferenceWithKey:pswrd andValue:notificationArray];

//     CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:notificationArray];
//     [commandResult setKeepCallbackAsBool:YES];

//     for(NSString *callBackId in self.messageCallBackIds)
//     {
//         [self.commandDelegate sendPluginResult:commandResult callbackId:callBackId];
//     }
// }

// - (void)messageListener:(CDVInvokedUrlCommand *)command
// {
//     if(self.messageCallBackIds == nil)
//     {
//         self.messageCallBackIds = [[NSMutableArray alloc] init];
//     }

//     if(![self.messageCallBackIds containsObject:command.callbackId])
//     {
//         [self.messageCallBackIds addObject:command.callbackId];
//     }
// }

// #pragma mark - DeepLink

// - (void)deeplinkListener:(CDVInvokedUrlCommand *)command
// {
//     if(self.deepLinkCallBackIds == nil)
//     {
//         self.deepLinkCallBackIds = [[NSMutableArray alloc] init];
//     }

//     if(![self.deepLinkCallBackIds containsObject:command.callbackId])
//     {
//         [self.deepLinkCallBackIds addObject:command.callbackId];
//     }
// }

// - (BOOL)shouldOverrideAction:(NSString *)action
//               withIdentifier:(NSString *)identifier
//                   forMessage:(ICMessage *)message
// {
//     NSString *value = @"";

//     if ([action isEqualToString:@"DEEPLINK"])
//     {
//         NSMutableArray *deeplinkAry = [[NSMutableArray alloc]init];
//         NSMutableDictionary *deepLinkDict = [[NSMutableDictionary alloc]init];
//         NSDictionary *actionDic;
//         if (message.category != nil)
//         {
//             actionDic = [self actionInfoWithIdentifier:identifier fromActions:[message.extras objectForKey:@"actions"]];
//         }
//         if(actionDic && actionDic.count > 0)
//         {
//             value = [actionDic objectForKey:@"value"];
//         }
//         [deepLinkDict setObject:value forKey:@"value"];
//         [deepLinkDict setObject:[actionDic objectForKey:@"action"] forKey:@"action"];
//         [deepLinkDict setObject:message.transactionId forKey:@"tid"];
//         [deepLinkDict setObject:message.message forKey:@"message"];
//         if (message.customTags) {
//             [deepLinkDict setObject:message.customTags forKey:@"customtags"];
//         }
//         [deeplinkAry addObject:deepLinkDict];

//         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deepLinkDict];
//         [commandResult setKeepCallbackAsBool:YES];

//         for(NSString *callBackId in self.deepLinkCallBackIds)
//         {
//             [self.commandDelegate sendPluginResult:commandResult callbackId:callBackId];
//         }

//         return YES;
//     }

//     return [[ICMessaging shared].actionsDelegate shouldOverrideAction:action withIdentifier:identifier forMessage:message];
// }

// - (NSDictionary *)actionInfoWithIdentifier:(NSString *)identifier fromActions:(NSArray *)actions
// {
//     if(actions && actions.count > 0)
//     {
//         for(NSDictionary *actionDic in actions)
//         {
//             if([identifier isEqualToString:[actionDic objectForKey:@"identifier"]])
//             {
//                 return actionDic;
//             }
//         }
//     }
//     return nil;
// }

// #pragma mark - NSData from NSDictionary
// - (NSData *)dataFromDictionary:(NSDictionary *)dictionary
// {
//     NSError *error = nil;
//     NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
//                                                        options:NSJSONWritingPrettyPrinted
//                                                          error:&error];
//     return jsonData;
// }

// - (NSDictionary *)dictionaryFromData:(NSData *)data
// {
//     NSError *error;
//     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
//                                                          options:kNilOptions
//                                                            error:&error];
//     return json;
// }

// /**
//  * Saves a key-value pair in the preferences
//  * @return YES if the pair has been successfully stored, NO otherwise
//  */
// - (BOOL)savePreferenceWithKey:(NSString *)key andValue:(NSMutableArray *)value
// {
//     key = [self removeSpacesAndLineBreaks:key];
//     if (key !=nil & key.length>0)
//     {
//         NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
// //        NSData *dataValue = [[self removeSpacesAndLineBreaks:value] dataUsingEncoding:NSUTF8StringEncoding];
//         NSData *dataValue = [self dataFromArray:value];
//         NSError *error;
//         NSData *encryptedData = [dataValue encryptDataWithPassword:key error:&error];
//         [preferences setValue:encryptedData  forKey:key];
//         return  [preferences synchronize];
//     }
//     return NO;
// }

// - (NSString *)removeSpacesAndLineBreaks:(NSString *)value
// {
//     if (value !=nil & value.length>0)
//     {
//         value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//     }
//     else
//     {
//         return @"";
//     }
//     return value;
// }

// /**
//  * Loads preferences from an associated key
//  * @return the preference value
//  */
// - (NSMutableArray *)loadPreferenceWithKey:(NSString *)key
// {
//     NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
//     if (key !=nil & key.length>0)
//     {
//         if([preferences objectForKey:key] != nil
//            && [[preferences objectForKey:key] isKindOfClass:[NSData class]])
//         {
//             NSData *valueData = [preferences valueForKey:key];
//             NSError *error;
//             NSData *decryptedData =  [valueData decryptDataWithPassword:key error:&error];
// //            NSString *decryptedStr = [[NSString alloc] initWithData:decryptedData  encoding:NSUTF8StringEncoding];
//             NSMutableArray *decryptedAry = [self arrayFromData:decryptedData];
//             return  decryptedAry;
//         }
//     }
//     return nil;
// }

// - (NSData *)dataFromArray:(NSMutableArray *)array
// {
//     return [NSKeyedArchiver archivedDataWithRootObject:array];
// }

// - (NSMutableArray *)arrayFromData:(NSData *)data
// {
//     return [NSKeyedUnarchiver unarchiveObjectWithData:data];
// }

// /**
//  * Removes preferences from an associated key
//  * @return YES if the pair has been successfully removed, NO otherwise
//  */
// + (BOOL)removePreferenceWithKey:(NSString *)key
// {
//     NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
//     if (key !=nil & key.length>0)
//     {
//         if([preferences objectForKey:key] != nil
//            && [[preferences objectForKey:key] isKindOfClass:[NSData class]])
//         {
//             [preferences removeObjectForKey:key];
//             return [preferences synchronize];
//         }
//     }
//     return NO;
// }

// #pragma mark - Appdelegate

// -(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
// {
//     NSError *error;
//     [IMIconnect startup:&error];

//     if (IMIconnect.isRegistered)
//     {
//         [ICMessaging shared].delegate = self;
//     }

//     [self.icAppDelegate application:application didFinishLaunchingWithOptions:launchOptions];

//     return YES;
// }

// - (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
// {
//     [self.icAppDelegate application:application didRegisterUserNotificationSettings:notificationSettings];
// }

// - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{

//     NSLog(@"Push Plugin register success: %@", deviceToken);
//     [self.icAppDelegate application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
// }

// - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
// {
//     [self.icAppDelegate application:application didReceiveRemoteNotification:userInfo];
//     NSLog(@"info :%@",userInfo);
// }

// - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
// {
//     [self.icAppDelegate application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];

// }
// - (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
// {
//     [self.icAppDelegate application:application didReceiveLocalNotification:notification];
// }

// //- (void)application:(UIApplication *) application handleActionWithIdentifier: (NSString *) identifier forRemoteNotification: (NSDictionary *) notification {

// //   [self.icAppDelegate application:application handleActionWithIdentifier:identifier forRemoteNotification:notification completionHandler:completionHandler];
// //}
// - (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
// {
//     [self.icAppDelegate application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
// }

// //}
// - (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
// {
//     [self.icAppDelegate application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
// }

// - (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
// {
//     [self.icAppDelegate application:application performFetchWithCompletionHandler:completionHandler];
// }

// - (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
// {
//     [self.icAppDelegate application:[UIApplication sharedApplication] didFailToRegisterForRemoteNotificationsWithError:error];
// }

// RCT_EXPORT_MODULE(IMIconnectPlugin);

// RCT_EXPORT_METHOD(sample:(NSString *)name)
// {
//   RCTLogInfo(@"Logging% @", name);
// }

// @end
