//
//  iwRequest.m
//  LiveTime
//
//  Created by Wayn Liu on 14-6-5.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import "iwRequest.h"
#import "AFNetworking.h"

@implementation iwRequest

+ (id)sharedManager
{
    static AFHTTPRequestOperationManager *sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [AFHTTPRequestOperationManager manager];
    });
    
    return sharedManager;
}

+ (void)requestWithResource:(NSString *)resource
                     action:(NSString *)action
                 parameters:(NSDictionary *)parameters
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *))failure
                   animated:(BOOL)animated
                    message:(NSString *)message
{
    if (message == nil)
    {
        message = @"Loading...";
    }
    
    AFHTTPRequestOperationManager *manager = [iwRequest sharedManager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [manager POST:[NSString stringWithFormat:@"%@/%@/%@/%@", kHosts, kEndpoint, resource, action]
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                           options:NSJSONReadingAllowFragments
                                                                             error:nil];
              
              if ([responseJson isKindOfClass:[NSDictionary class]])
              {
                  success(responseJson);
              }
              
              NSLog(@"===============\n%@", [operation request]);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              failure(error);
          }];
}

@end
