//
//  ICMediaAttachment.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 18/05/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import "ICAttachment.h"

@interface ICMediaAttachment : ICAttachment

@property (nonatomic) NSString *mediaId;

/// The size of the media in bytes
@property (nonatomic, readonly) long size;

/// The URL to where the media is located
@property (nonatomic, readonly) NSURL *url;

/// The local file path
@property (nonatomic) NSURL *filePath;

@end
