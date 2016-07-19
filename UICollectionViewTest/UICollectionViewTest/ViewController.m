//
//  ViewController.m
//  UICollectionViewTest
//
//  Created by 宇中 on 16/7/4.
//  Copyright © 2016年 LuoXingBin. All rights reserved.
//

#import "ViewController.h"
#import "FlowLayoutTest.h"
#import "Masonry.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;/**<  */
@property (nonatomic,strong) NSArray *dataArray;/**< 数据源数组 */
@end

@implementation ViewController

-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        FlowLayoutTest *flow = [[FlowLayoutTest alloc] init];
        flow.minimumLineSpacing = 5;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
        [self.view addSubview:_collectionView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
//        _collectionView.minimumZoomScale = 5;
        __weak typeof(self) weakSelf = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        NSString *a = [NSString stringWithFormat:@"%d",i];
        [tempArray addObject:a];
    }
    self.dataArray = [tempArray copy];
    [self.collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
