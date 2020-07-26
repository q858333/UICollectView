//
//  DBTagCell.h
//  UICollectView
//
//  Created by deng on 2020/7/26.
//  Copyright © 2020 IUAIJIA. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBTagCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *titleLabel;
- (void)updateUIWithModel:(NSString *)tag;
@end

NS_ASSUME_NONNULL_END
