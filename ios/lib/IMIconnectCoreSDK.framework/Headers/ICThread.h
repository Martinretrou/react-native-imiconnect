//
//  ICThread.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 02/05/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ICThreadTypeConversation,
    ICThreadTypeAnnouncement
} ICThreadType;

typedef enum
{
    ICThreadStatusActive,
    ICThreadStatusClosed
} ICThreadStatus;

@interface ICThread : NSObject

/// The thread id
@property (nonatomic, readonly) NSString *threadId;

/// The thread title
@property (nonatomic) NSString *title;

/// The creation date of the thread
@property (nonatomic, readonly) NSDate *createdAt;

/// The update date of the thread
@property (nonatomic, readonly) NSDate *updatedAt;

/// The thread type
@property (nonatomic) ICThreadType type;

/// The thread status
@property (nonatomic, readonly) ICThreadStatus status;

/// The thread category
@property (nonatomic) NSString *category;

/// The external id
@property (nonatomic) NSString *externalId;

/// The thread extras
@property (nonatomic) NSMutableDictionary *extras;

/**
 * Instantiates an ICThread from a NSData object
 * @param data the data from which the ICThread will be instantiated
 * @return an ICThread object
 */
- (instancetype)initWithData:(NSData *)data;

/**
 * Retrieves the data from an ICThread
 * @return the data from an ICThread
 */
- (NSData *)data;

@end
