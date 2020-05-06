//
//  ICMessageSynchronizationPolicy.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 25/09/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ICMessageSynchronizationMode) {
    ICMessageSynchronizationModeNone, // The messages won't be synchronized
    ICMessageSynchronizationModeLimited, // The messages will be synchronized following the policy parameters
    ICMessageSynchronizationModeFull // All the messages will be synchronized
};

@interface ICMessageSynchronizationPolicy : NSObject

/// The synchronization mode that will be used to synchronize messages
@property (nonatomic) ICMessageSynchronizationMode mode;

/// The maximum number of threads that will be synchronized at once
@property (nonatomic) NSInteger maxThreads;

/// The maximum number of messages that will be synchronized per thread
@property (nonatomic) NSInteger maxMessagesPerThread;

/**
 * Instantiates a new policy
 * @param mode the synchronization mode
 * @param maxThreads the max number of threads that will be synchronized at once
 * @param maxMessagesPerThread The maximum number of messages that will be synchronized per thread
 * @return a new instance of ICMessageSynchronizationPolicy
 */
- (instancetype)initWithMode:(ICMessageSynchronizationMode)mode
                  maxThreads:(NSInteger)maxThreads
        maxMessagesPerThread:(NSInteger)maxMessagesPerThread;

@end
