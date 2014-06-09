//
//  iwUser.m
//  LiveTime
//
//  Created by Wayn Liu on 14-6-5.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import "iwUser.h"
#import "iwRequest.h"

@implementation iwUser

+ (void)loginWithUser:(NSDictionary *)user success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [iwRequest requestWithResource:@"user"
                            action:@"login"
                        parameters:user
                           success:^(id data) {
                               success(data);
                           }
                           failure:^(NSError *error) {
                               
                           }
                          animated:YES
                           message:nil];
}

@end
