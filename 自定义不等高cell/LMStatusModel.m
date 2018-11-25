//
//  LMStatusModel.m
//  自定义不等高cell
//
//  Created by le tong on 2018/11/25.
//  Copyright © 2018年 limin. All rights reserved.
//

#import "LMStatusModel.h"

@implementation LMStatusModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"vip"])
        return YES;
    
    return NO;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"name": @"nickName"
                                                                  }];
}

@end
