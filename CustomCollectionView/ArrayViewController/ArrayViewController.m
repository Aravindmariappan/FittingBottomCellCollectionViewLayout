//
//  ArrayViewController.m
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import "ArrayViewController.h"
#import "FittingBottomCellCollectionViewLayout.h"
#import "DisplayObject.h"
#import "ImageCollectionViewCell.h"

#define KCellIdentifier @"cellIdentifier"

#define kImageNames @[@"FnBService",@"Golf",@"HouseKeeping",@"SpaService",@"Transportation",@"WakeUpCall"]
#define KDisplayNames @[@"SPA",@"NEWSPAPER",@"HOUSEKEEPING",@"GOLF",@"TRANSPORTAION",@"WAKEUPCALL"]
#define kMaxItems 6

@interface ArrayViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *contentArray;

@end

@implementation ArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configDataSource];
    [self configureCollectionView:self.collectionView];
}

- (void)configureCollectionView:(UICollectionView *)collectionView {
    collectionView.dataSource = self;
    FittingBottomCellCollectionViewLayout *fittingCollectionViewLayout = [[FittingBottomCellCollectionViewLayout alloc] init];
    collectionView.collectionViewLayout = fittingCollectionViewLayout;
}

- (void)configDataSource {
    DisplayObject *displayObject;
    self.contentArray = [NSMutableArray array];
    for(int i = 0; i < self.totalNumberOfRows; i++) {
        int index = i;
        if (i > kMaxItems-1) {
            index = 1;
        }
        displayObject = [[DisplayObject alloc] initWithDisplayName:KDisplayNames[index] imageName:kImageNames[index]];
        [self.contentArray addObject:displayObject];
    }
}

#pragma mark - Collection View Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.contentArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DisplayObject *displayObject = self.contentArray[indexPath.item];
    ImageCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:KCellIdentifier forIndexPath:indexPath];
    [collectionViewCell configureWithDisplayObject:displayObject];

    NSLog(@"fame : x = %f, y =%f, width = %f, hieght = %f",collectionViewCell.frame.origin.x, collectionViewCell.frame.origin.y, collectionViewCell.frame.size.width, collectionViewCell.frame.size.height);
    return collectionViewCell;
}


@end
