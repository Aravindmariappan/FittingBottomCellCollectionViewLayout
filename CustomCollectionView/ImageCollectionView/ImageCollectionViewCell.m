//
//  ImageCollectionViewCell.m
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@interface ImageCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
@property (weak, nonatomic) IBOutlet UILabel *displayName;

@end

@implementation ImageCollectionViewCell

- (void)configureWithDisplayObject:(DisplayObject *)displayObject {
    [self.displayImageView setImage:[UIImage imageNamed:displayObject.displayImageName]];
    [self.displayName setText:displayObject.displayName];
}

@end
