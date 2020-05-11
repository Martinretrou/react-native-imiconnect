//
//  IMIconnectCoreSDK.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 30/03/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for IMIconnectCoreSDKFramework.
FOUNDATION_EXPORT double IMIconnectCoreSDKFrameworkVersionNumber;

//! Project version string for IMIconnectCoreSDKFramework.
FOUNDATION_EXPORT const unsigned char IMIconnectCoreSDKFrameworkVersionString[];

#if __has_include("IMIconnect.h")
#import "IMIconnect.h"
#else
#import <IMIconnectCoreSDK/IMIconnect.h>
#endif

#if __has_include("ICLogger.h")
#import "ICLogger.h"
#else
#import <IMIconnectCoreSDK/ICLogger.h>
#endif

#if __has_include("ICAppDelegate.h")
#import "ICAppDelegate.h"
#else
#import <IMIconnectCoreSDK/ICAppDelegate.h>
#endif

#if __has_include("ICMessaging.h")
#import "ICMessaging.h"
#else
#import <IMIconnectCoreSDK/ICMessaging.h>
#endif

#if __has_include("ICMessageHelper.h")
#import "ICMessageHelper.h"
#else
#import <IMIconnectCoreSDK/ICMessageHelper.h>
#endif
#if __has_include("ICMediaFileManager.h")
#import "ICMediaFileManager.h"
#else
#import <IMIconnectCoreSDK/ICMediaFileManager.h>
#endif

#if __has_include("ICFileDownloadManager.h")
#import "ICFileDownloadManager.h"
#else
#import <IMIconnectCoreSDK/ICFileDownloadManager.h>
#endif
#if __has_include("ICFileUploadManager.h")
#import "ICFileUploadManager.h"
#else
#import <IMIconnectCoreSDK/ICFileUploadManager.h>
#endif

#if __has_include("ICAttachment.h")
#import "ICAttachment.h"
#else
#import <IMIconnectCoreSDK/ICAttachment.h>
#endif
#if __has_include("ICMediaAttachment.h")
#import "ICMediaAttachment.h"
#else
#import <IMIconnectCoreSDK/ICMediaAttachment.h>
#endif

#if __has_include("ICAudioAttachment.h")
#import "ICAudioAttachment.h"
#else
#import <IMIconnectCoreSDK/ICAudioAttachment.h>
#endif

#if __has_include("ICImageAttachment.h")
#import "ICImageAttachment.h"
#else
#import <IMIconnectCoreSDK/ICImageAttachment.h>
#endif

#if __has_include("ICVideoAttachment.h")
#import "ICVideoAttachment.h"
#else
#import <IMIconnectCoreSDK/ICVideoAttachment.h>
#endif

#if __has_include("ICLocationAttachment.h")
#import "ICLocationAttachment.h"
#else
#import <IMIconnectCoreSDK/ICLocationAttachment.h>
#endif

#if __has_include("ICMessageData.h")
#import "ICMessageData.h"
#else
#import <IMIconnectCoreSDK/ICMessageData.h>
#endif
#if __has_include("ICMessageType.h")
#import "ICMessageType.h"
#else
#import <IMIconnectCoreSDK/ICMessageType.h>
#endif

#if __has_include("ICMessage.h")
#import "ICMessage.h"
#else
#import <IMIconnectCoreSDK/ICMessage.h>
#endif
#if __has_include("ICThread.h")
#import "ICThread.h"
#else
#import <IMIconnectCoreSDK/ICThread.h>
#endif

#if __has_include("ICInAppDisplay.h")
#import "ICInAppDisplay.h"
#else
#import <IMIconnectCoreSDK/ICInAppDisplay.h>
#endif
#if __has_include("ICTopic.h")
#import "ICTopic.h"
#else
#import <IMIconnectCoreSDK/ICTopic.h>
#endif

#if __has_include("ICConfig.h")
#import "ICConfig.h"
#else
#import <IMIconnectCoreSDK/ICConfig.h>
#endif






#if __has_include("ICDeviceProfile.h")
#import "ICDeviceProfile.h"
#else
#import <IMIconnectCoreSDK/ICDeviceProfile.h>
#endif

#if __has_include("ICUserAuthentication.h")
#import "ICUserAuthentication.h"
#else
#import <IMIconnectCoreSDK/ICUserAuthentication.h>
#endif

#if __has_include("ICErrorCode.h")
#import "ICErrorCode.h"
#else
#import <IMIconnectCoreSDK/ICErrorCode.h>
#endif
#if __has_include("ICMessageStore.h")
#import "ICMessageStore.h"
#else
#import <IMIconnectCoreSDK/ICMessageStore.h>
#endif

#if __has_include("ICMessageSynchronizationPolicy.h")
#import "ICMessageSynchronizationPolicy.h"
#else
#import <IMIconnectCoreSDK/ICMessageSynchronizationPolicy.h>
#endif
#if __has_include("ICMessageSynchronizer.h")
#import "ICMessageSynchronizer.h"
#else
#import <IMIconnectCoreSDK/ICMessageSynchronizer.h>
#endif

#if __has_include("ICDefaultMessageStore.h")
#import "ICDefaultMessageStore.h"
#else
#import <IMIconnectCoreSDK/ICDefaultMessageStore.h>
#endif
#if __has_include("ICInAppNotificationManager.h")
#import "ICInAppNotificationManager.h"
#else
#import <IMIconnectCoreSDK/ICInAppNotificationManager.h>
#endif

#if __has_include("ICInAppNotificationViewBinder.h")
#import "ICInAppNotificationViewBinder.h"
#else
#import <IMIconnectCoreSDK/ICInAppNotificationViewBinder.h>
#endif

#if __has_include("ICInAppNotificationViewBinderFactory.h")
#import "ICInAppNotificationViewBinderFactory.h"
#else
#import <IMIconnectCoreSDK/ICInAppNotificationViewBinderFactory.h>
#endif

#if __has_include("ICInAppBannerNotificationViewBinder.h")
#import "ICInAppBannerNotificationViewBinder.h"
#else
#import <IMIconnectCoreSDK/ICInAppBannerNotificationViewBinder.h>
#endif

#if __has_include("ICInAppBannerNotificationViewBinderFactory.h")
#import "ICInAppBannerNotificationViewBinderFactory.h"
#else
#import <IMIconnectCoreSDK/ICInAppBannerNotificationViewBinderFactory.h>
#endif

#if __has_include("ICInAppModalNotificationViewBinder.h")
#import "ICInAppModalNotificationViewBinder.h"
#else
#import <IMIconnectCoreSDK/ICInAppModalNotificationViewBinder.h>
#endif
#if __has_include("ICInAppModalNotificationViewBinderFactory.h")
#import "ICInAppModalNotificationViewBinderFactory.h"
#else
#import <IMIconnectCoreSDK/ICInAppModalNotificationViewBinderFactory.h>
#endif

#if __has_include("ICInAppNotificationThemeStyle.h")
#import "ICInAppNotificationThemeStyle.h"
#else
#import <IMIconnectCoreSDK/ICInAppNotificationThemeStyle.h>
#endif
#if __has_include("ICInAppNotificationViewStyle.h")
#import "ICInAppNotificationViewStyle.h"
#else
#import <IMIconnectCoreSDK/ICInAppNotificationViewStyle.h>
#endif

#if __has_include("ICInAppBannerNotificationViewStyle.h")
#import "ICInAppBannerNotificationViewStyle.h"
#else
#import <IMIconnectCoreSDK/ICInAppBannerNotificationViewStyle.h>
#endif
