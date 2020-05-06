//
//  ICConfig.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 07/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICConfig : NSObject

/// The provided app id
@property (nonatomic, readonly) NSString *appId;

/// The provided client key
@property (nonatomic, readonly) NSString *clientKey;

/// The provided server domain
@property (nonatomic, readonly) NSString *serverDomain;

/// The associated group identifier
@property (nonatomic, readonly) NSString *groupIdentifier;



/**
 * Initialises an ICConfig instance with an appId and clientkey
 * @param appId the provided app id
 * @param clientKey the provided client key
 * @return An instance of ICConfig
 */
- (instancetype)initWithClientKey:(NSString *)clientKey
                         forAppId:(NSString *)appId DEPRECATED_MSG_ATTRIBUTE("Use initWithAppId:clientKey: instead");
/**
 * Initialises an ICConfig instance with an appId and clientkey
 * @param appId the provided app id
 * @param clientKey the provided client key
 * @return An instance of ICConfig
 */
- (instancetype)initWithAppId:(NSString *)appId
                    clientKey:(NSString *)clientKey;
/**
 * Initialises an ICConfig instance with an appId, clientkey and groupIdentifier
 * @param appId the provided app id
 * @param clientKey the provided client key
 * @param groupIdentifier the app group identifier associated to the app
 * @return An instance of ICConfig
 */
- (instancetype)initWithAppId:(NSString *)appId
                    clientKey:(NSString *)clientKey
              groupIdentifier:(NSString *)groupIdentifier;

/**
 * Initialises an ICConfig instance with an appId, clientkey and groupIdentifier
 * @param appId the provided app id
 * @param clientKey the provided client key
 * @param serverDomain the server domain
 * @return An instance of ICConfig
 */
- (instancetype)initWithAppId:(NSString *)appId
                    clientKey:(NSString *)clientKey
                 serverDomain:(NSString *)serverDomain;

/**
 * Initialises an ICConfig instance with an appId, clientkey and groupIdentifier
 * @param appId the provided app id
 * @param clientKey the provided client key
 * @param groupIdentifier the app group identifier associated to the app
 * @param serverDomain the server domain
 * @return An instance of ICConfig
 */
- (instancetype)initWithAppId:(NSString *)appId
                    clientKey:(NSString *)clientKey
              groupIdentifier:(NSString *)groupIdentifier
                 serverDomain:(NSString *)serverDomain;

@end
