//
//  ICDeviceProfile.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 05/01/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ICDeviceProfileParamUserId, // the user id param
    ICDeviceProfileParamCustomerId // the customer id param
} ICDeviceProfileParam;

@interface ICDeviceProfile : NSObject

/// The device id
@property (nonatomic) NSString *deviceId;

/// The app user id
@property (nonatomic) NSString *appUserId;

/// Informs if the appUserId is registered as guest
@property (nonatomic) BOOL isGuest;

/// Informs if the appUserId has been generated by the system
@property (nonatomic) BOOL isAppUserIdSystemGenerated;

/// The customer id
@property (nonatomic) NSString *customerId;

/**
 * Inits an ICDeviceProfile with a deviceId
 * @param deviceId the device id of the profile
 * @return an instance of an ICDeviceProfile
 */
- (instancetype)initWithDeviceId:(NSString *)deviceId;

/**
 * Inits a device profile with a device id and an app user id
 * @note The default device id method could be used to retrieve a device id.
 * @param deviceId a device id.
 * @param appUserId an app user id
 * @return an instance of the device profile
 */
- (instancetype)initWithDeviceId:(NSString *)deviceId
                       appUserId:(NSString *)appUserId;

/**
 * Inits a device profile with a device id and an app user id
 * @note The default device id method could be used to retrieve a device id.
 * @param deviceId a device id.
 * @param appUserId an app user id
 * @param isGuest guest flag
 * @return an instance of the device profile
 */
- (instancetype)initWithDeviceId:(NSString *)deviceId
                       appUserId:(NSString *)appUserId
                         isGuest:(BOOL)isGuest;

/**
 * Retrieves the default device id based on the vendor id of the device
 * @return the default device id
 */
+ (NSString *)defaultDeviceId;

@end
