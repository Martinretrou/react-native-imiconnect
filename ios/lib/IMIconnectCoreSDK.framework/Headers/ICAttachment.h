//
//  ICAttachment.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 08/07/2016.
//  Copyright © 2016 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ICAttachment : NSObject

/// The content type of the attachment, such as image, video, audio or location
@property (nonatomic) NSString *contentType;

@end
