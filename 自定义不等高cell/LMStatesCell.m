//
//  LMStatesCell.m
//  自定义不等高cell
//
//  Created by le tong on 2018/11/24.
//  Copyright © 2018年 limin. All rights reserved.
//

#import "LMStatesCell.h"
#import "LMStatusModel.h"
#import <Masonry.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LMStatesCell ()


@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *vipImageView;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *pictureImageView;

@end

@implementation LMStatesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutUIFrames];
    }
    return self;
}


/**
 计算cell的高度

 @param model 这个cell的模型
 @return 返回计算的cell高度
 */
+ (CGFloat)heightForCell:(LMStatusModel *)model
{
    CGFloat cellHeight;
    
    CGSize textSize = CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT);
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:12]};
    //计算label的高度，Size：设置的区域大小label的最大宽度和最大高度；options：自适应设置；attributes:文字属性，通常这里要知道的是文字大小；context:绘制文本上下文,做底层排版时使用,填nil即可
    CGFloat strHeight = [model.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.height;
    cellHeight = strHeight + 10 + 30 + 10;
    if (!model.picture) {
        cellHeight += 10;
    }else{
        cellHeight += 100;
        cellHeight += 20;
    }
    return cellHeight;
}


// 1. 记住自定义cell三大步：初始化构造方法，子控件布局，设置数据；
#pragma mark ===============布局子控件==================

- (void)layoutUIFrames
{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.pictureImageView];
    [self.contentView addSubview:self.vipImageView];
    [self.contentView addSubview:self.contentLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
    }];
    
    [self.vipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.nameLabel);
        make.height.mas_equalTo(14);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
    }];
    
    [self.pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(10);
        make.width.height.mas_equalTo(100);
    }];

}


#pragma mark ===============设置数据==================

- (void)setStatus:(LMStatusModel *)status
{
    _status = status;
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", status.icon]];
    if (status.isVip) {
          self.vipImageView.hidden = NO;
    }else{
        self.vipImageView.hidden = YES;
    }
    if (status.picture) {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",status.picture]];
    }else{
        self.pictureImageView.hidden = YES;
    }
    self.nameLabel.text = status.name;
    self.contentLabel.text = status.text;
}


#pragma mark ===============lazy==================toDo

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UIImageView *)vipImageView
{
    if (!_vipImageView) {
        _vipImageView = [[UIImageView alloc]init];
        _vipImageView.image = [UIImage imageNamed:@"crown"];
        _vipImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _vipImageView;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
    }
    return _contentLabel;
}

- (UIImageView *)pictureImageView
{
    if (!_pictureImageView) {
        _pictureImageView = [[UIImageView alloc]init];
        _pictureImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _pictureImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
