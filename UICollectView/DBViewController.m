//
//  DBViewController.m
//  UICollectView
//
//  Created by dengbin on 14/9/3.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import "DBViewController.h"
#import "DBPicCell.h"
#import "DBPicFlowLayout.h"
@interface DBViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray *_heights;
    UICollectionView *_collectionView;
}
@end

@implementation DBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"dengdengdengdengdengdeng");

    _heights = [NSMutableArray array];

    for (int i =0; i<10; i++) {
        [_heights addObject:@(50 + arc4random_uniform(150))];
    }
    
    DBPicFlowLayout *flowLayout=[[DBPicFlowLayout alloc] init];
    flowLayout.cellHeights = _heights;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];


    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) collectionViewLayout:flowLayout];
    _collectionView.delegate=self;
    [_collectionView registerClass:[DBPicCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    _collectionView.dataSource=self;
    
    [self.view addSubview:_collectionView];
   // char a[10]=
    NSString *str=@"sadasd123";

    char *b=[str cString];
    char a[str.length];
    strcpy(a, b);
    for(int i=0;i<strlen(a);i++)
    {
        
        printf("%c",a[i]);
    }
     KL(a);
    printf("%s",a);
    NSString *s=[[NSString alloc] initWithCString:a encoding:NSUTF8StringEncoding];
    NSLog(@"%@",s);
    for(int i=0;i<strlen(a);i++)
    {
        
    }


    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"添加" forState:0];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.frame =CGRectMake(0, CGRectGetMaxY(_collectionView.frame), 100, 40);
    [self.view addSubview:btn];





}
void KL (char *inStr)
{
    for(int i=0;i<strlen(inStr);i++)
    {
        inStr[i]=inStr[i]^'t';
        
        printf("%c",inStr[i]);
    }
}
- (void)btnClick{


    for (int i =0; i<10; i++) {
        [_heights addObject:@(50 + arc4random_uniform(150))];
    }
    [_collectionView reloadData];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _heights.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionCell";
    DBPicCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(  255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    cell.titleLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(96, 100);
//}
//设置顶部的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    CGSize size={50,50};
//    return size;
//}
//定义每个UICollectionView 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
   }
@end
