//
//  ICNotificationService.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 24/03/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICNotificationService : UNNotificationServiceExtension

@property (nonatomic, readonly) NSString *groupIdentifier;

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request
                   withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler;

- (void)willDisplayNotificationContent:(UNNotificationContent *)content
                     completionHandler:(void(^)(UNNotificationContent *))completionHandler;

- (void)serviceExtensionTimeWillExpire;

@end

NS_ASSUME_NONNULL_END
