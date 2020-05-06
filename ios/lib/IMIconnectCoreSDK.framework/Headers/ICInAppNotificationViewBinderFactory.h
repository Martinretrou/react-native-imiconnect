//
//  ICInAppNotificationViewBinderFactory.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 07/01/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICInAppDisplay.h"

@class ICInAppNotificationViewBinder;

NS_ASSUME_NONNULL_BEGIN

@protocol ICInAppNotificationViewBinderFactory <NSObject>

/**
 * Indicates the type of the message part handled by the factory.
 * @return the content type of the message part handled by the factory.
 */
- (ICInAppNotificationType)notificationType;

/**
 * Creates a new ICMessagePartView depending on the content type of message part.
 * @return a new ICMessagePartView instance
 */
- (ICInAppNotificationViewBinder *)createNotificationView;


@end

NS_ASSUME_NONNULL_END
