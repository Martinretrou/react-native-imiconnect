//
//  ICMessageStore.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu.C on 25/09/17.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICMessage.h"

@protocol ICMessageStore <NSObject>

/**
 * Saves single ICMessage
 * @param message the ICMessage to be saved
 * @return YES if message storage completes
 */
- (BOOL)saveMessage:(ICMessage *)message;

/**
 * Saves multiple ICMessages
 * @param messages the array of ICMessages to be saved
 * @return YES if message storage completes
 */
- (BOOL)saveMessages:(NSArray *)messages;

/**
 * loads single ICMessage from local storage based on transactionId
 * @param transactionId the transactionId to be retrieved from local storage
 * @return ICMessage instance if message exists with transactionId
 */
- (ICMessage *)loadMessageWithTransactionId:(NSString *)transactionId;

/**
 * loads ICMessage from local storage based on threadId and submitted date with specific limit
 * @param threadId the threadId to be retrieved from local storage
 * @param submittedBefore the submittedBefore to be  used to fetch messages before submittedBefore from local storage
 * @param limit the limit to be  used to fetch limited number of messages from local storage
 * @return array of ICMessages instance if message exists with threadId
 */
- (NSArray *)loadMessagesWithThreadId:(NSString *)threadId submittedBefore:(NSDate *)submittedBefore limit:(int)limit;

/**
 * loads ICMessage from local storage based on threadId and submitted date with specific limit
 * @param threadId the threadId to be retrieved from local storage
 * @param submittedBefore the submittedBefore to be  used to fetch messages before submittedBefore from local storage
 * @param submittedAfter the submittedAfter to be  used to fetch messages after submittedAfter from local storage
 * @param limit the limit to be  used to fetch limited number of messages from local storage
 * @return array of ICMessage instance if message exists with threadId
 */
- (NSArray *)loadMessagesWithThreadId:(NSString *)threadId submittedBefore:(NSDate *)submittedBefore submittedAfter:(NSDate *)submittedAfter limit:(int)limit;

/**
 * loads single outgoing ICMessage from local storage based on threadId
 * @param threadId the threadId to be retrieved from local storage
 * @return ICMessage instance if message exists with threadId
 */
- (ICMessage *)loadLatestOutgoingMessageWithThreadId:(NSString *)threadId;

/**
 * deletes single ICMessage from local storage based on transactionId
 * @param transactionId the transactionId to be deleted from local storage
 * @return YES if message deletes completes
 */
- (BOOL)deleteMessageWithTransactionId:(NSString *)transactionId;

/**
 * gives count of messages from local storage based on threadId
 * @param threadId the threadId to be fetched count from local storage
 * @return count of messages
 */
- (int)numberOfMessagesForThreadId:(NSString *)threadId;

/**
 * Saves single ICThread
 * @param thread the ICThread to be saved
 * @return YES if thread storage completes
 */
- (BOOL)saveThread:(ICThread *)thread;

/**
 * Saves multiple ICThreads
 * @param threads the array of ICThreads to be saved
 * @return YES if threads storage completes
 */
- (BOOL)saveThreads:(NSArray *)threads;

/**
 * loads single ICThread from local storage based on threadId
 * @param threadId the threadId to be retrieved from local storage
 * @return ICThread instance if thread exists with threadId
 */
- (ICThread *)loadThreadWithThreadId:(NSString *)threadId;

/**
 * loads ICThreads from local storage based date updatedBefore with specific limit
 * @param updatedBefore the updatedBefore to be  used to fetch threads updated before from local storage
 * @param limit the limit to be  used to fetch limited number of threads from local storage
 * @return array of ICThreads instance if threads exists before updated date with limit
 */
- (NSArray *)loadThreadsUpdatedBeforeDate:(NSDate *)updatedBefore limit:(int)limit;

/**
 * loads ICThreads from local storage based date updatedBefore with specific limit
 * @param updatedBefore the updatedBefore to be  used to fetch threads updated before from local storage
 * @param updatedAfter the updatedAfter to be  used to fetch threads updated after from local storage
 * @param limit the limit to be  used to fetch limited number of threads from local storage
 * @return array of ICThreads instance if threads exists between before & after updated date with limit
 */
- (NSArray *)loadThreadsUpdatedBeforeDate:(NSDate *)updatedBefore updatedAfter:(NSDate *)updatedAfter limit:(int)limit;

/**
 * Loads some ICThread instance containing at least one unread message from local storage with specific limit
 * @param limit the limit to be used to fetch limited number of threads from local storage
 * @return an array of ICThread instance with some unread messages
 */
- (NSArray *)loadUnreadThreadsWithLimit:(int)limit;

/**
 * deletes single ICThread from local storage based on threadId
 * @param threadId the threadId to be deleted from local storage
 * @return YES if thread deletes completes
 */
- (BOOL)deleteThreadWithThreadId:(NSString *)threadId;

/**
 * gives total number of threads count from local storage
 * @return count of threads
 */
- (int)numberOfThreads;

/**
 * Gives the total number of threads containing unread messages
 * @return the number of threads containing unread messages
 */
- (NSInteger)numberOfUnreadThreads;

/**
 * deletes complete threads & messages
 * @return YES if deletes completes
 */
- (BOOL)deleteAll;

@end
