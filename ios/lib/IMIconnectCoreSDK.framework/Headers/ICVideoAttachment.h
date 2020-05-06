//
//  ICVideoAttachment.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 18/05/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#ifdef CORESDKFRAMEWORK
#import <IMIconnectCoreSDK/ICMediaAttachment.h>
#else
#import "ICMediaAttachment.h"
#endif

@interface ICVideoAttachment : ICMediaAttachment

/// The preview thumbnail as a UIImage
@property (nonatomic) UIImage *preview;

/// The duration of the video
@property (nonatomic) long duration;

@end
