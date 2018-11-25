//
//  LMStatusModel.h
//  自定义不等高cell
//
//  Created by le tong on 2018/11/25.
//  Copyright © 2018年 limin. All rights reserved.
//

#import "JSONModel.h"

@interface LMStatusModel : JSONModel

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign, getter=isVip) BOOL vip;
@property (nonatomic, copy) NSString <Optional> *picture;

@end
