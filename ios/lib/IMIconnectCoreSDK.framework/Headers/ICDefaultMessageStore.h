//
//  ICDefaultMessageStore.h
//  IMIconnectCoreSDK
//
//  Created by Umesh Naidu.C on 25/09/17.
//  Copyright © 2017 IMImobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef CORESDKFRAMEWORK
#import <IMIconnectCoreSDK/ICMessageStore.h>
#else
#import "ICMessageStore.h"
#endif

#import <CoreData/CoreData.h>

@interface ICDefaultMessageStore : NSObject <ICMessageStore>

- (instancetype)init DEPRECATED_MSG_ATTRIBUTE("Please use initWithPassword: instead");
- (instancetype)initWithPassword:(NSString *)password;

@end
