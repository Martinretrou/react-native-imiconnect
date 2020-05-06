//
//  ICMessaging.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 08/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICMessageStore.h"

#import "ICMessage.h"

typedef enum {
    ICConnectionStatusNone, // The connection process hasn’t been launched yet
    ICConnectionStatusConnecting, // The SDK is connecting to the Real Time Messaging server
    ICConnectionStatusConnected, // The SDK is connected and allows publication and receipt of messages through RTM
    ICConnectionStatusRefused, // The connection is refused by the server
    ICConnectionStatusClosed, // The SDK is disconnected from the Real Time Messaging server
    ICConnectionStatusError, // An error has occured during the connection
} ICConnectionStatus;

typedef enum {
    ICTopicAccessLevelFilterReadWrite = 0, // Used to fetch all the read-write topics
    ICTopicAccessLevelFilterRead = 1, // Used to fetch all the read-only topics
    ICTopicAccessLevelFilterWrite = 2, // Used to fetch all the write-only topics
    ICTopicAccessLevelFilterAll = 3, // Used to fetch all the topics (write and read-write)
} ICTopicAccessLevelFilter;

FOUNDATION_EXPORT NSString *const kICMessagingDidReceiveMessageNotification;

@protocol ICMessagingDelegate <NSObject>

@optional

/**
 * Invoked whenever a new message (Push or RTM) is received. 
 * This method is invoked after internal processing is complete, as such a local notification may have already been generated.
 * @param message the received message object
 */
- (void)didReceiveMessage:(ICMessage *)message DEPRECATED_MSG_ATTRIBUTE("Use didReceiveMessage:fromTap: instead");

/**
 * Invoked whenever a new message (Push or RTM) is received.
 * This method is invoked after internal processing is complete, as such a local notification may have already been generated.
 * @param message the received message object
 * @param fromTap informs if the message has been received after a tap of the user or not
 */
- (void)didReceiveMessage:(ICMessage *)message fromTap:(BOOL)fromTap;

/**
 * Invoked whenever there is a change to the Real Time Messaging connection status.
 * @param connectionStatus the new current connection status
 */
- (void)didChangeConnectionStatus:(ICConnectionStatus)connectionStatus;

@end

@protocol ICMessagingActionsDelegate <NSObject>

/**
 * Invoked whenever a user clicks on an action to know if the developer wants to override the internal process of the SDK. 
 * If not implemented, the default value is NO.
 * @param action The action related to the notification
 * @param identifier The identifier selected by the user
 * @param message The message object related to the action
 */
- (BOOL)shouldOverrideAction:(NSString *)action
              withIdentifier:(NSString *)identifier
                  forMessage:(ICMessage *)message;

/**
 * Invoked whenever a user clicks on an action that the developer should override:
 * (if [ICMessagingActionsDelegate shouldOverrideAction:forMessage:] returns YES)
 * @param action The action related to the notification
 * @param identifier the identifier selected by the user
 * @param message The message object related to the action
 * @param responseInfo an extra response dictionary (can be set for inline reply)
 */
- (void)performAction:(NSString *)action
       withIdentifier:(NSString *)identifier
           forMessage:(ICMessage *)message
     withResponseInfo:(NSDictionary *)responseInfo;

@end

@interface ICMessaging : NSObject

/// The delegate implementing ICMessagingDelegate methods
@property (nonatomic, weak) id<ICMessagingDelegate> delegate;

/// The delegate implementing ICMessagingActionsDelegate methods
@property (nonatomic, weak) id<ICMessagingActionsDelegate> actionsDelegate;

/// Returns YES if RTM connection is currently connected.
@property (nonatomic, readonly) BOOL isConnected;

/// Returns the current connection status between the SDK and the IMIconnect platform.
@property (nonatomic, readonly) ICConnectionStatus connectionStatus;

@property (nonatomic) id<ICMessageStore> messageStore;

#pragma mark - Instance

/**
 * Gives a single instance of ICMessaging.
 * The instance is created internally on demand.
 * @return the single instance of ICMessaging
 */
+ (instancetype)shared;

#pragma mark - Connection

/**
 * Establishes a connection with the IMIconnect platform in order to receive Real Time Messages.
 * Sets the error passed in parameter if a user is not currently registered to the SDK or if RTM feature is not enabled in the policy.
 * Connection status events are notified via [ICMessagingDelegate didChangeConnectionStatus:]
 * @param error an error that will be set if the user is not registered or if RTM is not enabled
 * @return YES if connection process has been launched
 */
- (BOOL)connect:(NSError **)error;

/**
 * Disconnects any established connection. If no connection is currently active it fails silently.
 * Sets the error passed in parameter if a user is not currently registered to the SDK or if RTM feature is not enabled in the policy.
 * Connection status events are notified via [ICMessagingDelegate didChangeConnectionStatus:]
 * @param error an error that will be set if the user is not registered or if RTM is not enabled
 * @return YES if disconnection process has been launched
 */
- (BOOL)disconnect:(NSError **)error;

#pragma mark - Threads

/**
 * Creates a thread
 * @param thread The thread that will be created
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)createThread:(ICThread *)thread
   completionHandler:(void(^)(ICThread *thread, NSError *error))completionHandler;

/**
 * Updates a thread
 * @param thread The thread that will be updated
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)updateThread:(ICThread *)thread
   completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Closes a thread
 * @param thread The thread that will be closed
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)closeThread:(ICThread *)thread
  completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Fetches a list of threads based on some restrictions.
 * @param updatedBefore the date before which the threads have been updated
 * @param completionHandler a completionHandler called when the response is received. It will contain an array of threads or an error if the request failed.
 */
- (void)fetchThreadsUpdatedBeforeDate:(NSDate *)updatedBefore
                     completionHandler:(void(^)(NSArray *threads,
                                                BOOL hasMoreThreads,
                                                NSError *error))completionHandler;

/**
 * Fetches a list of threads based on some restrictions.
 * @param updatedBefore the date before which the threads have been updated
 * @param limit the max number of threads that will be received
 * @param completionHandler a completionHandler called when the response is received. It will contain an array of threads or an error if the request failed.
 */
- (void)fetchThreadsUpdatedBeforeDate:(NSDate *)updatedBefore
                                 limit:(NSInteger)limit
                     completionHandler:(void(^)(NSArray *threads,
                                                BOOL hasMoreThreads,
                                                NSError *error))completionHandler;

#pragma mark - Messages

/**
 * Fetches a list of messages received or sent before the date parameter.
 * @note the messages will be fetched 50 by 50. Check hasMoreMessages parameter to see if more messages are available
 * @param threadId the threadId on which the messages have been received
 * @param date the date until when the messages will be fetched
 * @param completionHandler a completionHandler called when the response is received. It will contain an array of messages or an error if the request failed.
 */
- (void)fetchMessagesForThreadId:(NSString *)threadId
                       untilDate:(NSDate *)date
               completionHandler:(void(^)(NSArray *messages, BOOL hasMoreMessages, NSError *error))completionHandler;

/**
 * Fetches a list of messages based on date which have been configured for user.
 * Use the date parameter to fetch messages.
 * Results are reported via completionHandler.
 * @param threadId fetch based on threadId
 * @param date fetch based on date passed
 * @param completionHandler a completionHandler called when the response is received. It will contain an array of messages or an error if the request failed.
 */
- (void)fetchMessagesForThreadId:(NSString *)threadId
                       untilDate:(NSDate *)date
                           limit:(NSInteger)limit
               completionHandler:(void(^)(NSArray *messages, BOOL hasMoreMessages, NSError *error))completionHandler;

/**
 * Attempts to publish the passed ICMessage instance via the RTM connection. 
 * If message is published, error in completionHandler will be nil.
 * @param message the message to publish
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)publishMessage:(ICMessage *)message
     completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Attempts to delete the message.
 * If message is deleted, error in completionHandler will be nil.
 * @param transactionId The transactionId of the message to delete.
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)deleteMessageForTransactionId:(NSString *)transactionId
                    completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Used to update the status of the message identified by transactionId as Read. 
 * If message status is set to read, error in completionHandler will be nil.
 * @param transactionId The transactionId of the message to set to read
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)setMessageAsReadForTransactionId:(NSString *)transactionId
                       completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Used to update the status of the messages identified by the transactionIds array as Read. 
 * Results of the operation are reported via completionHandler. 
 * If message status is set to read, error in completionHandler will be nil.
 * @param transactionIds The transactionIds of the messages to set to read
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)setMessagesAsReadForTransactionIds:(NSArray *)transactionIds
                         completionHandler:(void(^)(NSError *error))completionHandler;

#pragma mark - Topics

/**
 * Fetches a list of topics which have been configured for use with the current IMIconnect appId.
 * Results are reported via completionHandler.
 * @param offset the offset count based on topics response
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)fetchTopics:(int)offset completionHandler:(void(^)(NSArray *topics, BOOL hasMoreTopics, NSError *error))completionHandler;

/**
 * Subscribes to the passed topic, allowing the SDK to receiving incoming messages.
 * If subscription succeeds, error in completionHandler will be nil.
 * Incoming messages are received via [ICMessagingDelegate didReceiveMessage:]
 * @param topicId the topicId to subscribe
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)subscribeTopic:(NSString *)topicId
     completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Unsubscribes from the passed topic, preventing further messages for that topic from being received.
 * Results of the operation are reported via completionHandler.
 * @note that messages may still be received until the completionHandler has reported success (error == nil).
 * @param topicId the topicId to unsubscribe
 * @param completionHandler a completionHandler called when the response is received
 */
- (void)unsubscribeTopic:(NSString *)topicId
       completionHandler:(void(^)(NSError *error))completionHandler;

#pragma mark - Notifications

/**
 * Registers new notification categories that can be used for interactive notifications
 * @param notificationCategories an array of notificationCategories to register
 */
- (void)setNotificationCategories:(NSArray *)notificationCategories;

#pragma mark - Actions

/**
 * Handles the interactive action or default action selected by a user. 
 * For the default action case, the identifier to be passed is nil.
 * @note This method should be called only if the action is selected while the app is active.
 * Otherwise, a notification will be created, and [ICAppDelegate handleActionWithIdentifier:] should be called
 * @param identifier the identifier of the action (nil for default action)
 * @param message the message containing the action
 * @param response an extra response associated to the action (could be used for inline reply)
 */
- (void)handleActionWithIdentifier:(NSString *)identifier
                        forMessage:(ICMessage *)message
                      withResponse:(NSString *)response;

@end
