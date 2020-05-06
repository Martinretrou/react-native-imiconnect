//
//  ICMediaFileManager.h
//  IMIconnectCoreSDK
//
//  Created by Jeremy Oddos on 18/05/2017.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICFileUploadManager.h"
#import "ICFileDownloadManager.h"

@interface ICMediaFileManager : NSObject

/**
 * Informs if the manager is currently downloading or uploading a file
 * @note this method could be used to trigger a background task to finish uploading/downloading files
 * @return YES if the manager is currently downloading/uploading a file, NO otherwise
 */
+ (BOOL)isProcessing;

/**
 * Uploads a file from a URL.
 * @param location the URL of the local file
 * @param progressHandler a progressHandler that will inform on the current progress of the upload
 * @param completionHandler a completionHandler that will be call once the file is uploaded with the associated mediaId
 */
+ (void)uploadFileFromLocation:(NSURL *)location
               progressHandler:(void(^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progressHandler
             completionHandler:(void(^)(NSString *mediaId, NSError *error))completionHandler;

/**
 * Checks if the manager is currently uploading a file from a local URL
 * @param location the local URL of the file
 * @return YES if the file is currently being uploaded
 */
+ (BOOL)isFileUploadingFromLocation:(NSURL *)location;

/**
 * Observes the upload of a file
 * @param filePath the filePath of the file that is being observed
 * @param completionHandler a completionHandler that will be called once the file is uploaded
 */
+ (void)addObserverForFileAtPath:(NSURL *)filePath
               completionHandler:(void(^)(NSError *error))completionHandler;

/**
 * Downloads a file from a URL if needed.
 * @note This method may retrieve a file locally if already downloaded
 * or queue the completionHandler if the file associated to the URL is already being downloaded
 * @param url the URL of the file
 * @param completionHandler a completionHandler that will be call once the file is downloaded
 */
+ (void)downloadFileAtURL:(NSURL *)url
        completionHandler:(void(^)(NSData *contentOfFile, NSURL *filePath, NSError *error))completionHandler;

/**
 * Checks if the manager is currently downloading a file at a URL
 * @param url the URL of the file that will be checked
 * @return YES if the file is currently being downloaded
 */
+ (BOOL)isFileDownloadingAtURL:(NSURL *)url;

/**
 * Retrieves the content of a file associated to a URL
 * @param url the URL associated to the content
 * @param completionHandler a completion that will be called with the content if the content exists, nil otherwise
 */
+ (void)contentOfFileForURL:(NSURL *)url completionHandler:(void(^)(NSData *contentOfFile))completionHandler;

/**
 * Retrieves the filePath where the content of the file at the passed URL is stored
 * @param url the URL where the content has been retrieved
 * @return the filePath where the content is locally located
 */
+ (NSURL *)filePathForURL:(NSURL *)url;

/**
 * Checks if a file exists for a URL
 * @param url the URL to be checked
 * @return YES if the file exists, NO otherwise
 */
+ (BOOL)fileExistsForURL:(NSURL *)url;

@end
