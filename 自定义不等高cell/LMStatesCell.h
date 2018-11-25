//
//  LMStatesCell.h
//  自定义不等高cell
//
//  Created by le tong on 2018/11/24.
//  Copyright © 2018年 limin. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kLMStatesCell = @"kLMStatesCell";

@class LMStatusModel;
@interface LMStatesCell : UITableViewCell

@property (nonatomic, strong) LMStatusModel *status;

+ (CGFloat)heightForCell:(LMStatusModel *)model;

@end
