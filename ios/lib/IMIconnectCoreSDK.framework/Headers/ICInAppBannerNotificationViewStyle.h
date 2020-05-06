//
//  ICInAppBannerNotificationViewStyle.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 10/04/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ICInAppNotificationViewStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface ICInAppBannerNotificationViewStyle : ICInAppNotificationViewStyle

// Banner Notification Close Button Tint Color
@property (nonatomic, readwrite) UIColor *closeButtonTintColor;

// Banner Notification Close Button Background Color
@property (nonatomic, readwrite) UIColor *closeButtonBackgroundColor;

// Banner Notification Close Button Image
@property (nonatomic, readwrite) UIImage *closeButtonImage;

@end

NS_ASSUME_NONNULL_END
