//
//  ICLocationAttachment.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 18/05/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#ifdef CORESDKFRAMEWORK
#import <IMIconnectCoreSDK/ICAttachment.h>
#else
#import "ICAttachment.h"
#endif

@interface ICLocationAttachment : ICAttachment

/// The longitude of the location
@property (nonatomic) double longitude;

/// The latitude of the location
@property (nonatomic) double latitude;

@end
