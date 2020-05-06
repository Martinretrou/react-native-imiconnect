//
//  ICMessage.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 08/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef CORESDKFRAMEWORK
#import <IMIconnectCoreSDK/ICMessageData.h>
#import <IMIconnectCoreSDK/ICMessageType.h>

#else
#import "ICMessageData.h"
#import "ICMessageType.h"

#endif


@class ICThread;
@class ICInAppDisplay;

typedef enum {
    ICMessageChannelRealTime, // The incoming message comes from Real Time Messaging
    ICMessageChannelPush // The incoming message comes from Push notification
} ICMessageChannel;

@interface ICMessage : NSObject <ICMessageData>

/// Identifies the message transaction within the IMIconnect platform
@property (nonatomic, readonly) NSString *transactionId;

/// The title of the message
@property (nonatomic, readonly) NSString *title;

/// The content of the message. Usually this is the text that is displayed to end users
@property (nonatomic) NSString *message;

/// The thread related to the message
@property (nonatomic) ICThread *thread;

/// The inAppDisplay related to the message
@property (nonatomic) ICInAppDisplay *inAppDisplay;

/// The message status
@property (nonatomic) ICMessageStatus status;

/// Informs if the message is an outgoing message
@property (nonatomic, readonly) BOOL isOutgoing;

/// The userId of the message.
@property (nonatomic, readonly) NSString *userId;

/// The date when the message has been submitted
@property (nonatomic, readonly) NSDate *submittedAt;

/// The date when the message has been delivered
@property (nonatomic, readonly) NSDate *deliveredAt;

/// The date when the message has been read
@property (nonatomic, readonly) NSDate *readAt;

/// The date when the message has been created
@property (nonatomic, readonly) NSDate *createdAt;

/// The channel on which the message was received (Push or RTM)
@property (nonatomic, readonly) ICMessageChannel channel;

/// The type of the message
@property (nonatomic, readonly) ICMessageType type;

/// Any attachments which are or have to be attached to the message
@property (nonatomic) NSMutableArray *attachments;

/// The category of message. The category will be used by the SDK to create an interactive notification. It will be nil if the message is basic.
@property (nonatomic, readonly) NSString *category;

/// Any supplementary data that was sent as part of the message payload.
/// This format of this data is controlled by the IMIconnect platform and enables certain standard features such as interactive messages.
@property (nonatomic, readonly) NSDictionary *extras;

/// Any custom, developer specified, data that was sent or to be sent as part of the message payload
@property (nonatomic) NSMutableDictionary *customTags;

/**
 * Creates an instance of an ICMessage based on data
 * @param data Data from which an ICMessage is created
 * @return An instance of ICMessage
 */
- (instancetype)initWithData:(NSData *)data;

/**
 * Creates an instance of an ICMessage based on a dictionary
 * @param dictionary The dictionary from which an ICMessage is created
 * @return An instance of ICMessage
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 * Creates data from an ICMessage
 * @return data containing the ICMessage
 */
- (NSData *)data;

/**
 * Creates a dictionary from an ICMessage
 * @return a dictionary containing the ICMessage
 */
- (NSDictionary *)dictionary;

@end
