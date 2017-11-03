//
//  FittingCellCollectionViewFlowLayout.m
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import "FittingBottomCellCollectionViewLayout.h"

//#define numberOfItems 8
#define kMaxColumns 3 //Maximum number of Items in a row
#define kCellHeight 135.0f

@interface FittingBottomCellCollectionViewLayout()

@property (nonatomic) CGFloat contentWidth;
@property (nonatomic) CGFloat contentHeight;
@property (nonatomic) NSMutableArray *cache;

@end


@implementation FittingBottomCellCollectionViewLayout

- (CGFloat)contentWidth {
    return self.collectionView.bounds.size.width;
}

- (CGFloat)contentHeight {
    return self.collectionView.bounds.size.height;
}

- (NSMutableArray *)cache {
    if (_cache == nil) {
        _cache = [NSMutableArray array];
    }
    
    return _cache;
}

- (void)prepareLayout {
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGFloat columnWidth = self.contentWidth / kMaxColumns;
    NSInteger lastRowIndex = (numberOfItems / kMaxColumns);
    NSInteger lastRowItems = (numberOfItems % kMaxColumns);
    CGFloat xOffset = 0.0f;
    CGFloat yOffset = 0.0f;
    NSInteger rowIndex = 0, columnIndex = 0;
    for (int cellIndex = 0; cellIndex < numberOfItems; cellIndex++) {
        NSIndexPath *cellIndexPath = [NSIndexPath indexPathForItem:cellIndex inSection:0];
        CGRect cellFrame = CGRectMake(xOffset, yOffset, columnWidth, kCellHeight);

        if (rowIndex == lastRowIndex && lastRowItems != 0) {
            columnWidth = self.contentWidth / lastRowItems;
            cellFrame = CGRectMake(xOffset, yOffset, columnWidth, kCellHeight);
        }
        
        UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:cellIndexPath];
        layoutAttributes.frame = cellFrame;
        [self.cache addObject:layoutAttributes];
        
        if (columnIndex < kMaxColumns - 1) {
            xOffset += columnWidth;
            columnIndex++;
        }
        else {
            columnIndex = 0;
            xOffset = 0.0f;
            yOffset += kCellHeight;
            rowIndex++;
        }
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *visibleLayoutAttributes = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *layoutAttribute in self.cache) {
        if (CGRectIntersectsRect(layoutAttribute.frame, rect)) {
            [visibleLayoutAttributes addObject:layoutAttribute];
        }
    }

    return visibleLayoutAttributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.cache[indexPath.item];
}

@end
