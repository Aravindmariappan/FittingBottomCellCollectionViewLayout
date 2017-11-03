//
//  DisplayObject.h
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import <Foundation/Foundation.h>
#

@interface DisplayObject : NSObject

@property NSString *displayImageName;
@property NSString *displayName;

- (instancetype)initWithDisplayName:(NSString *)displayName imageName:(NSString *)imageName;

@end
