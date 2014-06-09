//
//  iwRequest.h
//  LiveTime
//
//  Created by Wayn Liu on 14-6-5.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iwRequest : NSObject

+ (void)requestWithResource:(NSString *)resource
                     action:(NSString *)action
                 parameters:(NSDictionary *)parameters
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *))failure
                   animated:(BOOL)animated
                    message:(NSString *)message;

@end
