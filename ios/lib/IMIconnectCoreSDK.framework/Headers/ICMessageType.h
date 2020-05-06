//
//  ICMessageType.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 02/10/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

typedef NS_ENUM(NSUInteger,ICMessageType) {
    ICMessageTypeMessage, // The message is normal message
    ICMessageTypeDeleted,
    ICMessageTypeNotification, // The message is a notification related to a message
    ICMessageTypeDeliveryReceipt,
    ICMessageTypeReadReceipt, // The message is notifying that a published message has been received
    ICMessageTypeRepublish, // The message is notifying that a message has been sent from the current user with a different device
    ICMessageTypeTypingStart, // The message is notifying that the recipent has started to type
    ICMessageTypeTypingStop, // The message is notifying that the recipent ended to type
    ICMessageTypeAlert,
    ICMessageTypeThreadUpdate, // The message is notifying that the thread has been updated
};
