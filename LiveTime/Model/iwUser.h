//
//  iwUser.h
//  LiveTime
//
//  Created by Wayn Liu on 14-6-5.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iwUser : NSObject

@property (nonatomic, strong) NSString *mail;
@property (nonatomic, strong) NSString *password;

+ (void)loginWithUser:(NSDictionary *)user
              success:(void (^)(id userObject))success
              failure:(void (^)(NSError *error))failure;

+ (void)signUpWithUser:(NSDictionary *)user
              success:(void (^)(id userObject))success
              failure:(void (^)(NSError *error))failure;

@end
