//
//  LMStatus.h
//  自定义不等高cell
//
//  Created by le tong on 2018/11/24.
//  Copyright © 2018年 limin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMStatus : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign, getter=isVip) BOOL vip;
@property (nonatomic, copy) NSString *picture;


@end
