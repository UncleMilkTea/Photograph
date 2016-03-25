//
//  ViewController.m
//  Photograph
//
//  Created by 侯玉昆 on 16/3/25.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "ViewController.h"
#import "PhotoFlowLayout.h"
#import "PhotoCell.h"

#define identifier @"cell"

@interface ViewController ()<UICollectionViewDataSource>

@property (nonatomic,strong) NSMutableArray *imageArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PhotoFlowLayout *layout = [[PhotoFlowLayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200) collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    
    [collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:identifier];
    
    [self.view addSubview:collectionView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.imageArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.image = self.imageArr[indexPath.item];
    
    return cell;
}


- (NSMutableArray *)imageArr{
    
    if (!_imageArr) {
        
        _imageArr = [NSMutableArray array];
        
        for (int i =0; i<7; i++) {
            
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
            
            [_imageArr addObject:image];
        }
    }
    return _imageArr;
}
@end
