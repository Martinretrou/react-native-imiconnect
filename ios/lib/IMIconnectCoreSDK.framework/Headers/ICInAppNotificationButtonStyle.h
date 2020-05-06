//
//  ICInAppNotificationButtonStyle.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 10/04/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICInAppNotificationButtonStyle : NSObject

// Notification Button Text Color
@property (nonatomic) UIColor *buttonTextColor;

// Notification Button Tint Color
@property (nonatomic) UIColor *buttonTintColor;

// Notification Button Type
@property (nonatomic) UIButtonType buttonType;

// Notification Button Background Color
@property (nonatomic) UIColor *buttonBackgroundColor;

@end

NS_ASSUME_NONNULL_END
