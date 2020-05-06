//
//  ICInAppNotificationViewStyle.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu Challa on 10/04/19.
//  Copyright © 2019 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ICInAppNotificationButtonStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface ICInAppNotificationViewStyle : NSObject

// Notification Title Label Text Color
@property (nonatomic, readwrite) UIColor *titleTextColor;

// Notification Title Label Text Font
@property (nonatomic, readwrite) UIFont *titleTextFont;

// Notification Title Label Text Shadow Color
@property (nonatomic, readwrite) UIColor *titleTextShadowColor;

// Notification Details Label Text Color
@property (nonatomic, readwrite) UIColor *textColor;

// Notification Details Label Text Font
@property (nonatomic, readwrite) UIFont *textFont;

// Notification Details Label Text Shadow Color
@property (nonatomic, readwrite) UIColor *textShadowColor;

// Notification view Background Color
@property (nonatomic, readwrite) UIColor *backGroundColor;

// Notification Buttons Style Info
@property (nonatomic, readwrite) ICInAppNotificationButtonStyle *buttonStyle;


/**
 * Gives a single instance of ICInAppNotificationViewStyle.
 * The instance is created internally on demand.
 * @return the single instance of ICInAppNotificationViewStyle
 */
+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
