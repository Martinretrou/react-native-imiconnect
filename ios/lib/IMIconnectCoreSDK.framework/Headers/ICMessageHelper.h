//
//  ICMessageHelper.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 18/10/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICThread.h"

@interface ICMessageHelper : NSObject

/**
 * Publishes a typing indicator information on a thread
 * @param thread The thread on which the information will be passed
 * @param typing Informs if the user has started typing or stopped typing
 */
+ (void)publishTypingIndicatorOnThread:(ICThread *)thread typing:(BOOL)typing;

@end
