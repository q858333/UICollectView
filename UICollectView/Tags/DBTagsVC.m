//
//  DBTagsVC.m
//  UICollectView
//
//  Created by deng on 2020/7/26.
//  Copyright © 2020 IUAIJIA. All rights reserved.
//

#import "DBTagsVC.h"
#import "DBTagCell.h"
#import "DBTagsLayout.h"
@interface DBTagsVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *tags;
@end

@implementation DBTagsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     
    NSArray *tags = @[@"1111",@"22222",@"3333",@"44444",@"555555",@"66666",@"77777",@"88888"];
    self.tags = tags;
       
    DBTagsLayout *layout = [[DBTagsLayout alloc] init];
        
    layout.tags = tags;
        
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 28) collectionViewLayout:layout];
                        
    [collectionView registerClass:[DBTagCell class] forCellWithReuseIdentifier:@"DBTagCell"];
                        
    collectionView.delegate = self;
                       
    collectionView.dataSource = self;
                   
    [self.view addSubview:collectionView];

        
    collectionView.backgroundColor = [UIColor redColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tags.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *tag = self.tags[indexPath.row];
    
     DBTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DBTagCell" forIndexPath:indexPath];
    
    [cell updateUIWithModel:tag];
    return cell;
}
@end
