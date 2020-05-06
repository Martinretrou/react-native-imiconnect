//
//  ICInAppNotificationManager.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 03/01/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#ifdef CORESDKFRAMEWORK
//#import <IMIconnectCoreSDK/ICInAppNotificationManager.h>
//#else
//#import "ICInAppNotificationManager.h"
//#endif
//

#import <UIKit/UIKit.h>
#import "ICMessage.h"
#import "ICInAppNotificationViewBinderFactory.h"
#import "ICInAppNotificationThemeStyle.h"
#import "ICInAppModalNotificationViewStyle.h"
#import "ICInAppBannerNotificationViewStyle.h"
#import "ICMessaging.h"
#import "ICInAppDisplay.h"


NS_ASSUME_NONNULL_BEGIN

@protocol InAppNotificationManagerDelegate <NSObject>

@optional

/**
 * Invoked whenever a InAppNotification clicked Push is received.
 * This method is invoked after internal processing is complete, as such a InAppNotification displayed.
 * @param message the received message object
 * @param action the received NSString action type
 * @param value the received NSString value
 */
- (void)onNotificationClicked:(ICMessage *)message withAction:(NSString *)action value:(NSString *)value;

/**
 * Invoked whenever there is a InAppNotification dismissed.
 * @param message the received message object
 */
- (void)onNotificationDismiss:(ICMessage *)message;

/**
 * Invoked whenever there is a InAppNotification displayed.
 * @param message the received message object
 */
- (void)onNotificationDisplayed:(ICMessage *)message;

@end


@interface ICInAppNotificationManager : UIViewController <ICMessagingDelegate>

@property (nonatomic, weak) id<InAppNotificationManagerDelegate> delegate;

+ (instancetype)shared;


/**
 * Enable notification display when app is in active state
 */
- (void)setEnable:(BOOL)enable;


- (void)registerViewFactory:(id<ICInAppNotificationViewBinderFactory>)notificationFactory forNotificationType:(ICInAppNotificationType)notificationType;

//Remove Later
- (void)displayInAppNotification:(ICMessage *)message;

/**
 * Sets the InAppNotification modal view style
 * @param viewStyle is the view style for modal type InAppNotifications
 */
- (void)setModalNotificationViewStyle:(ICInAppModalNotificationViewStyle *)viewStyle;

/**
 * Sets the InAppNotification banner view style
 * @param viewStyle is the view style for banner type InAppNotifications
 */
- (void)setBannerNotificationViewStyle:(ICInAppBannerNotificationViewStyle *)viewStyle;

/**
 * Sets the InAppNotification modal view theme
 * @param modalNotificaitonTheme is the theme for modal type InAppNotifications
 */
- (void)setModalNotificationViewTheme:(ICInAppModalNotificationTheme)modalNotificaitonTheme;

/**
 * Sets the InAppNotification banner view theme
 * @param bannerNotificaitonTheme is the theme for banner type InAppNotifications
 */
- (void)setBannerNotificationViewTheme:(ICInAppBannerNotificationTheme)bannerNotificaitonTheme;

@end

NS_ASSUME_NONNULL_END
