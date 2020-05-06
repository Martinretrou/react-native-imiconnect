//
//  IMIconnect.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 07/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICDeviceProfile.h"

@class ICConfig;

@protocol ICSecurityTokenErrorDelegate <NSObject>

- (void)didReceiveTokenError:(NSError *)error;

@end

@interface IMIconnect : NSObject

#pragma mark - Start up

/**
 * Initialises the SDK, reading configuration from the configuration file (IMIconnectConfiguration.plist).
 * An error can passed in parameter, which will be set if something wrong occurs during the startup process.
 * This method is not mandatory if [ICAppDelegate didFinishLaunchingWithOptions:] method is used.
 * @param error error will be set if start up fails
 * @return YES if start up succeed, else NO
 */
+ (BOOL)startup:(NSError **)error;

/**
 * Initialises the SDK using the passed configuration options.
 * An error can passed in parameter, which will be set if something wrong occurs during the startup process.
 * This method is mandatory if IMIconnectConfiguration.plist is not used.
 * @param config The config object containing the appId and the clientKey.
 * @param error error will be set if start up fails
 * @return YES if start up succeed, else NO
 */
+ (BOOL)startupWithConfig:(ICConfig *)config error:(NSError **)error;

#pragma mark - Shut down

/**
 * Performs cleanup of the SDK, freeing all internal object instances. 
 * @note Normally usage of this method is not required, there are a few limited cases where you may wish to use it, 
 * such as if you are only using the Authentication or Monitoring features.
 * Calling this method will stop any of the SDK features from functioning 
 * as such RTM will no longer be received and Push notifications will not be handled by the SDK.
 */
+ (void)shutdown;

#pragma mark - Security Tokens

/**
 * Register the listener which handles internal exceptions
 * @parm completionHandler A completionHandler that will be called when exception occured
 */
+ (void)setSecurityTokenErrorDelegate:(id<ICSecurityTokenErrorDelegate>)delegate;

/**
 * Register the security token & this has to pass accross all HTTP headers
 * @parm token the token which has to validate
 */
+ (void)setSecurityToken:(NSString *)token;

#pragma mark - Registration

/**
 * Registers the device profile with the SDK.
 * This method causes profile details to be sent to the IMIconnect platform.
 * Once a profile is registered all further SDK calls take place in the context of that profile.
 * @note this method can be used only if the SDK is already started.
 * @param deviceProfile The device profile to be registered.
 * @param completionHandler A completionHandler that will be called when a response from the server is received
 * The response will contain the current appType (none,rt,push or both)
 */
+ (void)registerWithDeviceProfile:(ICDeviceProfile *)deviceProfile
                completionHandler:(void (^)(NSDictionary *response,NSError *error))completionHandler;

/**
 * Retrieves the current registered device profile.
 * @return the current registered device profile
 */
+ (ICDeviceProfile *)deviceProfile;

/**
 * Checks if the current user is registered with the SDK
 * @return YES if the user is currently registered
 */
+ (BOOL)isRegistered;

/**
 * Updates the device profile with a new userId or customerId
 * @param deviceProfileParam the device profile param targeted
 * @param value the new value of the parameter
 * @param completionHandler A completionHandler that will be called when a response from the server is received
 */
+ (void)updateDeviceProfileParam:(ICDeviceProfileParam)deviceProfileParam
                       withValue:(NSString *)value
               completionHandler:(void (^)(NSDictionary *response,NSError *error))completionHandler;

/**
 * Removes the current userId or customerId from the device profile
 * @param deviceProfileParam the device profile param targeted
 * @param completionHandler A completionHandler that will be called when a response from the server is received
 */
+ (void)removeDeviceProfileParam:(ICDeviceProfileParam)deviceProfileParam
               completionHandler:(void (^)(NSDictionary *response,NSError *error))completionHandler;

/**
 * Publish custom events
 * @param eventParams the eventParams for custom params which needs to be published
 * @param completionHandler A completionHandler that will be called when a response from the server is received
 */
+ (void)publishEventParam:(NSDictionary *)eventParams
        completionHandler:(void (^)(NSDictionary *response, NSError *error))completionHandler;

/**
 * Unregisters the current device profile.
 * @note Features that rely on a registered user will no longer function after this has been called.
 * @param completionHandler A completionHandler that will be called when a response from the server is received
 */
+ (void)unregister:(void (^)(NSError *error))completionHandler;

#pragma mark - Device Details

/**
 * Retrieves the deviceId used by IMIconnect APIs
 * @return the deviceId or nil if the user isn't registered
 */
+ (NSString *)deviceId DEPRECATED_MSG_ATTRIBUTE("Use deviceProfile instead.");

#pragma mark - Policy polling

/**
 * Sets the interval (minutes) at which the SDK will poll for policy updates.
 * To prevent adverse affects on battery or cpu usage a minimum interval of 30 minutes is enforced. 
 * To disable polling pass a value of 0. 
 * If Real time messaging or Push is enabled, this value won’t be used.
 * @param interval The interval (minutes) between 2 policy updates poll.
 */
+ (void)setPolicyPollingInterval:(NSTimeInterval)interval;

/**
 * Retrieves the current policy polling interval
 * @return The current policy polling interval
 */
+ (NSTimeInterval)policyPollingInterval;

/**
 * Retrieves the current SDK version number
 * @return The current SDK version number
 */
+ (NSString *)sdkVersion;
@end
