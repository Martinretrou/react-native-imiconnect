//
//  ICFileDownloadManager.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 17/07/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICFileDownloadManager <NSObject>

/**
 * Downloads a file from a URL if needed.
 * @note This method may retrieve a file locally if already downloaded
 * or queue the completionHandler if the file associated to the URL is already being downloaded
 * @param url the URL of the file
 * @param completionHandler a completionHandler that will be call once the file is downloaded
 */
- (void)downloadFileAtURL:(NSURL *)url
        completionHandler:(void(^)(NSData *contentOfFile, NSError *error))completionHandler;

@end
