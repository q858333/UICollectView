//
//  DBTagCell.m
//  UICollectView
//
//  Created by deng on 2020/7/26.
//  Copyright © 2020 IUAIJIA. All rights reserved.
//

#import "DBTagCell.h"
#import "Masonry.h"
#import "TagsConfig.h"
@implementation DBTagCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self configView];
    }
    return self;
}

- (void)configView{
    UIView *bgView = [[UIView alloc] init];
    [self.contentView addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 8;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = kTagFont;
    [bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(bgView);
        make.leading.equalTo(@10);
        make.trailing.equalTo(@(-10));
    }];
    self.titleLabel = label;
    
}
- (void)updateUIWithModel:(NSString *)tag{
    self.titleLabel.text = tag;
}
@end
