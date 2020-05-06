//
//  ICInAppDisplay.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 16/04/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ICInAppNotificationTypeBanner, // The incoming message type to display notification Banner
    ICInAppNotificationTypeModal, // The incoming message type to display notification Modal
    ICInAppNotificationTypeNone
} ICInAppNotificationType;

@interface ICInAppDisplay : NSObject

/// NotificationType which has to be displayed either Banner or Modal
@property (nonatomic, readonly) ICInAppNotificationType notificationType;

@property (nonatomic, readonly) BOOL isExpandable;

//- (instancetype)initWithData:(NSData *)data;
+ (NSString *)getNotificationType:(ICInAppNotificationType)notificationType;

@end
