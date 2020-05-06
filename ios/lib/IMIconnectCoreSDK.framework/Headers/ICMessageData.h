//
//  ICMessageData.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 02/10/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef CORESDKFRAMEWORK
#import <IMIconnectCoreSDK/ICThread.h>
#import <IMIconnectCoreSDK/ICMessageType.h>
#else
#import "ICThread.h"
#import "ICMessageType.h"
#endif

typedef NS_ENUM(NSUInteger, ICMessageStatus) {
    ICMessageStatusNone,
    ICMessageStatusFailed,
    ICMessageStatusSent,
    ICMessageStatusDelivered,
    ICMessageStatusRead
};

@protocol ICMessageData <NSObject>

/**
 * Retrieves the messsage's transaction id
 * @return the messsage's transaction id
 */
- (NSString *)transactionId;

/**
 * Retrieves the status of the message
 * @return the status of the message.
 */
- (ICMessageStatus)status;

/**
 * Retrieves the date to be displayed in the inbox or in the conversation.
 * @return the date that will be displayed.
 */
- (NSDate *)date;

/**
 * Informs if the message is outgoing or not.
 * @returns YES if the message is outgoing, NO otherwise.
 */
- (BOOL)isOutgoing;

/**
 * Retrieves the thread associated to the message
 * @return the thread of the message
 */
- (ICThread *)thread;


/**
 * Retrieves the message type
 * @return the ICMessageType
 */
- (ICMessageType)type;

@end
