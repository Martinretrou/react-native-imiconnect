//
//  ICFileUploadManager.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 17/07/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICFileUploadManager <NSObject>

/**
 * Uploads a file from a URL.
 * @param location the URL of the local file
 * @param progressHandler a progressHandler that will inform on the current progress of the upload
 * @param completionHandler a completionHandler that will be call once the file is uploaded with the associated mediaId
 */
- (void)uploadFileFromLocation:(NSURL *)location
               progressHandler:(void(^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progressHandler
             completionHandler:(void(^)(NSString *mediaId, NSError *error))completionHandler;

@end
