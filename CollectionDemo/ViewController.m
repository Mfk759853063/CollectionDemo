//
//  ViewController.m
//  CollectionDemo
//
//  Created by huayu on 15/5/12.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,dds>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"customCell"];
    CustomCell *preCell =  [[CustomCell alloc] init];
    preCell.holder = @"请输入类别";
    self.dataArray = [NSMutableArray arrayWithObject:preCell];

    CustomCell *preCell2 =  [[CustomCell alloc] init];
    preCell2.holder = @"请输入类别";
    [self.dataArray addObject:preCell2];
    
    CustomCell *preCell3 =  [[CustomCell alloc] init];
    preCell3.holder = @"请输入类别";
    [self.dataArray addObject:preCell3];
    [self.view addSubview:self.collectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"customCell";
    CustomCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setDelegate:self];
    CustomCell *preCell = self.dataArray[indexPath.row];
    [cell.textField setPlaceholder:preCell.holder];
    return cell;
    
}

////定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = (CustomCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (!cell) {
        return CGSizeMake(100, 50);
    }
    return cell.bounds.size;
    
}

- (void)changed
{
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0;
}


//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = (CustomCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.textField becomeFirstResponder];
    return YES;
}



@end
