//
//  DisplayObject.m
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import "DisplayObject.h"

@implementation DisplayObject

- (instancetype)initWithDisplayName:(NSString *)displayName imageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.displayName = displayName;
        self.displayImageName = imageName;
    }
    return self;
}

@end
