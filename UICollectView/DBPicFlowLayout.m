//
//  DBPicFlowLayout.m
//  UICollectView
//
//  Created by dengbin on 2017/12/29.
//  Copyright © 2017年 IUAIJIA. All rights reserved.
//

#import "DBPicFlowLayout.h"

#define JPCollectionW self.collectionView.frame.size.width

/** 每一行之间的间距 */
static const CGFloat DBDefaultRowMargin = 10;
/** 每一列之间的间距 */
static const CGFloat DBDefaultColumnMargin = 10;
/** 每一列之间的间距 top, left, bottom, right */
static const UIEdgeInsets DBDefaultInsets = {10, 10, 10, 10};
/** 默认的列数 */
static const int DBDefaultColumsCount = 3;
@interface DBPicFlowLayout()

/** 每一列的最大Y值 */
@property (nonatomic, strong) NSMutableArray *columnMaxYs;
/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;


@end

@implementation DBPicFlowLayout
#pragma mark - 懒加载
- (NSMutableArray *)columnMaxYs
{
    if (!_columnMaxYs) {
        _columnMaxYs = [[NSMutableArray alloc] init];
    }
    return _columnMaxYs;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}


#pragma mark - 实现内部的方法
/**
 * 决定了collectionView的contentSize
 */
- (CGSize)collectionViewContentSize
{


    CGFloat maxValue = [[self.columnMaxYs valueForKeyPath:@"@max.floatValue"] floatValue];

    return CGSizeMake(0, maxValue + DBDefaultInsets.bottom);
}

//每次刷新会调用
- (void)prepareLayout
{
    [super prepareLayout];
    [self method1];
    return;
    // 重置每一列的最大Y值
    if (self.columnMaxYs.count == 0) {
        for (NSUInteger i = 0; i<DBDefaultColumsCount; i++) {
            [self.columnMaxYs addObject:@(DBDefaultInsets.top)];
        }
    }


    // 计算所有cell的布局属性

        int count = self.attrsArray.count;
        for (NSUInteger i = 0; i < 10; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:count+i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attrsArray addObject:attrs];
        }


}


- (void)method1{
        [self.columnMaxYs removeAllObjects];
        for (NSUInteger i = 0; i<DBDefaultColumsCount; i++) {
            [self.columnMaxYs addObject:@(DBDefaultInsets.top)];
        }
    


    // 计算所有cell的布局属性
    [self.attrsArray removeAllObjects];
    NSUInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i < cellCount; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}



/**
 * 说明所有元素（比如cell、补充控件、装饰控件）的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 说明cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    /** 计算indexPath位置cell的布局属性 */

    // 水平方向上的总间距
    CGFloat xMargin = DBDefaultInsets.left + DBDefaultInsets.right + (DBDefaultColumsCount - 1) * DBDefaultColumnMargin;
    // cell的宽度
    CGFloat w = (JPCollectionW - xMargin) / DBDefaultColumsCount;


    CGFloat h = [self.cellHeights[indexPath.row] floatValue];

    // 找出最短那一列的 列号 和 最大Y值
    CGFloat destMaxY = [self.columnMaxYs[0] doubleValue];
    NSUInteger destColumn = 0;
    for (NSUInteger i = 1; i<self.columnMaxYs.count; i++) {
        // 取出第i列的最大Y值
        CGFloat columnMaxY = [self.columnMaxYs[i] doubleValue];

        // 找出数组中的最小值
        if (destMaxY > columnMaxY) {
            destMaxY = columnMaxY;
            destColumn = i;
        }
    }





    // cell的x值
    CGFloat x = DBDefaultInsets.left + destColumn * (w + DBDefaultColumnMargin);
    // cell的y值
    CGFloat y = destMaxY + DBDefaultRowMargin;
    // cell的frame
    attrs.frame = CGRectMake(x, y, w, h);

    // 更新数组中的最大Y值
    self.columnMaxYs[destColumn] = @(CGRectGetMaxY(attrs.frame));

    return attrs;
}


@end
