//
//  ICUserAuthentication.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 07/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICUserAuthentication : NSObject

/**
 * Sends a PIN via SMS to a user allowing him to be authenticated with another way than the traditional login/password. 
 * The phone number must be provided when creating the user profile. 
 * If generation succeeds, error in completionHandler will be nil.
 * @param userId Specifies the user Id for authentication.
 * @param completionHandler it will be called when the SDK receives a response. If the request is unsuccessful, a non-nil error will be passed in parameter
 */
+ (void)generatePinForUserId:(NSString *)userId
           completionHandler:(void (^)(NSError *error))completionHandler;

/**
 * Validates a PIN sent to a user. If validation succeeds, error in completionHandler will be nil.
 * @note IMIconnect SDK provides Two Factor Authentication (2FA) service for mobile applications to validate their customer id (CRN and MSISDN) that are integrated with IMIconnect profile manager.
 * The OTP is valid for 30 minutes.
 * @param pin Specifies the pin (OTP) that is generated.
 * @param userId Specifies the user Id for authentication.
 * @param completionHandler The block to be executed when the SDK receives a response. If the request is unsuccessful, a non-nil error will be passed in parameter
 */
+ (void)validatePin:(NSString *)pin
          forUserId:(NSString *)userId
  completionHandler:(void (^)(NSError *error))completionHandler;

@end
