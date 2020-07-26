//
//  DBTagsLayout.m
//  UICollectView
//
//  Created by deng on 2020/7/26.
//  Copyright © 2020 IUAIJIA. All rights reserved.
//

#import "DBTagsLayout.h"
#import "YYKit.h"
#import "TagsConfig.h"
@interface DBTagsLayout ()
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) CGFloat columnSpace;
@property (nonatomic, assign) CGFloat MaxX;

@property (nonatomic, assign) CGFloat insetLeft;
@property (nonatomic, assign) CGFloat insetRight;

@end
@implementation DBTagsLayout
#pragma mark - 实现内部的方法


- (void)prepareLayout{
    [super prepareLayout];
    self.columnSpace = 8.0;

    self.itemHeight  = kTagHeight;
    self.MaxX = 0;
    self.insetLeft = 10.0;//tag距离itme左侧距离
    self.insetRight = 10.0;//tag距离itme右侧距离
    
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i = 0; i < [self.collectionView numberOfSections]; i++) {
        for (NSInteger j = 0; j < [self.collectionView numberOfItemsInSection:i]; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    
    return [attributes copy];
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSString *text = [self.tags objectAtIndex:indexPath.row];
    CGFloat textWidth = ceil([text widthForFont:kTagFont]) + self.insetLeft + self.insetRight;
    NSInteger space = self.columnSpace;
    if(indexPath.row == 0){
        self.MaxX  = 0;
        space = 0;
    }
    attr.frame = CGRectMake(self.MaxX + space , 0, textWidth, self.itemHeight);
    
    self.MaxX = CGRectGetMaxX(attr.frame);

    return attr;
}

- (CGSize)collectionViewContentSize{

    CGSize contentSize = CGSizeMake(self.MaxX , self.itemHeight);
    return contentSize;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds) && CGRectGetHeight(newBounds) != CGRectGetHeight(oldBounds)) {
        return YES;
    }
    return NO;
}
@end
