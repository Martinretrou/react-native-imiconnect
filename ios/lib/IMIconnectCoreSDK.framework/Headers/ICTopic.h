//
//  ICTopic.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 08/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICTopic : NSObject

/// The id of the topic
@property (nonatomic, readonly) NSString *topicId;

/// The name of the topic
@property (nonatomic, readonly) NSString *name;

/// Informs if the user is subscribed to the current topic
@property (nonatomic, readonly) BOOL isSubscribed;

/// The group of the topic
@property (nonatomic, readonly) NSString *group;

/// The date of creation of the topic
@property (nonatomic, readonly) NSDate *createdAt;

/// The last date of updates on the topic
@property (nonatomic, readonly) NSString *desc;

/**
 * Retrieves the data from an ICTopic
 * @return the data from an ICTopic
 */
- (NSData *)data;

@end
