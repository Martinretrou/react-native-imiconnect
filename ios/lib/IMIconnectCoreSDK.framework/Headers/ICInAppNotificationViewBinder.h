//
//  ICInAppNotificationViewBinder.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 03/01/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMessage.h"
#import "ICInAppModalNotificationViewStyle.h"
#import "ICInAppBannerNotificationViewStyle.h"
#import "ICInAppNotificationThemeStyle.h"

NS_ASSUME_NONNULL_BEGIN

@protocol InAppNotificationViewBinderDelegate <NSObject>

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


@end

@interface ICInAppNotificationViewBinder : UIViewController

@property (nonatomic, weak) id<InAppNotificationViewBinderDelegate> delegate;

/// The message data associated to the view
@property (nonatomic, retain)ICMessage *message;

// The view style associated to the Banner Notification
@property (nonatomic)ICInAppBannerNotificationViewStyle *bannerViewStyle;

// The view style associated to the Modal Notification
@property (nonatomic)ICInAppModalNotificationViewStyle *modalViewStyle;

// Binds the message data to the Notification View binder
- (void)bindMessage:(ICMessage *)message;

- (UIViewController *)getView;

// Binds the modal view style to the Modal Notification View binder
- (void)bindModalViewStyle:(ICInAppModalNotificationViewStyle *)modalViewStyle;

// Binds the Banner view style to the Banner Notification View binder
- (void)bindBannerViewStyle:(ICInAppBannerNotificationViewStyle *)bannerViewStyle;


@end

NS_ASSUME_NONNULL_END
