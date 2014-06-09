//
//  NSString+helper.m
//  LiveTime
//
//  Created by Wayn Liu on 14-5-31.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import "NSString+helper.h"

@implementation NSString (helper)

- (NSString *)trimStringWithSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
