//
//  DBPicCell.m
//  PicWaterfall
//
//  Created by dengbin on 2017/12/29.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBPicCell.h"

@implementation DBPicCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
@end
