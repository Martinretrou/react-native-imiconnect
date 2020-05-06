//
//  ICInAppNotificationThemeStyle.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 10/04/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICInAppNotificationViewStyle.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    ICInAppBannerNotificationThemeDark, // Banner NotificationTheme is Dark
    ICInAppBannerNotificationThemeLight, // Banner NotificationTheme is Light
} ICInAppBannerNotificationTheme;

typedef enum {
    ICInAppModalNotificationThemeDark, // Modal NotificationTheme is Dark
    ICInAppModalNotificationThemeLight, // Modal NotificationTheme is Light
} ICInAppModalNotificationTheme;

@interface ICInAppNotificationThemeStyle : ICInAppNotificationViewStyle

// Banner type Notification Theme
@property (nonatomic) ICInAppBannerNotificationTheme notificationBannerTheme;

// Modal type Notification Theme
@property (nonatomic) ICInAppModalNotificationTheme notificationModalTheme;


/**
 * Gives a single instance of ICInAppNotificationThemeStyle.
 * The instance is created internally on demand.
 * @return the single instance of ICInAppNotificationThemeStyle
 */
+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END

