//
//  ICErrorCode.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 01/08/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

typedef enum {
    ICErrorCodeNotInitialized = 6000, // Raised when trying to access a feature whereas the SDK hasn’t been started up
    ICErrorCodeAlreadyInitialized = 6001, // Raised when trying to start up the SDK whereas the SDK is already started up
    ICErrorCodeNotRegistered = 6002, // Raised when trying to access a feature which needs the user to be registered whereas he is not.
    ICErrorCodeFeatureNotSupported = 6003, // Raised when trying to access a feature not supported by the appId (i.e. trying to publish a message whereas the app authorizes PUSH only)
    ICErrorCodeInvalidParameterValue = 6004, // Raised when not passing a required parameter to a method (publishing a message without passing the topic)
    ICErrorCodeAlreadyRegistered = 6006, // Raised when trying to register again, when user is already registered.
    ICErrorCodeServerUnreachable = 6100, // Raised when the app credentials are invalid (i.e. appId or secretKey are malformed) or if the server can’t be reached
    ICErrorCodeRegistrationFailed = 6101, // Raised when registration failed
    ICErrorCodeInvalidResponse = 6102, // Raised when the response from the server is invalid
    ICErrorCodeNotConnected = 6200, // Raised when trying to communicate with the RTM server whereas the connection isn’t established.
    ICErrorCodeTokenInvalid = 38, // The token is not in the expected format.
    ICErrorCodeTokenRequired = 39, // The token does not provide authorization to access the requested resource.
    ICErrorCodeTokenExpired = 40 // The token has expired.
} ICErrorCode;
