//
//  ICLogger.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 01/03/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ICLogType) {
    ICLogTypeNone, // No log will be displayed/recorded
    ICLogTypeDebug, // A large amount of logs will be logged that can help to debug
    ICLogTypeProduction // Logs will be kept at a minimum level.
};

typedef NS_ENUM(NSUInteger, ICLogTarget) {
    ICLogTargetConsole, // Logs will be displayed in the console
    ICLogTargetFile // Logs will be recorded in a file
};

@interface ICLogger : NSObject

/**
 * Sets the log options for the logger
 * @param logType the type of logs that will be logged
 * @param logTarget the target on which the logs will be displayed/recorded
 */
+ (void)setLogType:(ICLogType)logType forLogTarget:(ICLogTarget)logTarget;

/**
 * Sets the retention duration of the logs.
 * The logs will be kept during that duration and will be automatically purged after.
 * @param days the number of days after which the logs will be purged
 */
+ (void)setRetentionDuration:(NSInteger)days;

/**
 * Retrieves the directory path where the logs are stored
 * @return the directory path where the logs are stored
 */
+ (NSString *)logPath;

@end
