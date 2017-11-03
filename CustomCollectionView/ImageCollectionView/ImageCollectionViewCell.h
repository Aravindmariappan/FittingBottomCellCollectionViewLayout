//
//  ImageCollectionViewCell.h
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayObject.h"

@interface ImageCollectionViewCell : UICollectionViewCell

- (void)configureWithDisplayObject:(DisplayObject *)displayObject;

@end
