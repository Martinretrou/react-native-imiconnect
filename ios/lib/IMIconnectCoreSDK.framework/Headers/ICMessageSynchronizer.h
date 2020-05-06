//
//  ICMessageSynchronizer.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 25/09/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICMessageSynchronizationPolicy.h"

@interface ICMessageSynchronizer : NSObject

/**
 * Sets the synchronization policy
 * @param policy the synchronization policy
 */
+ (void)setPolicy:(ICMessageSynchronizationPolicy *)policy;

@end
