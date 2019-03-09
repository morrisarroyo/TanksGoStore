//
//  ItemImageViewButton.h
//  Store
//
//  Created by Student on 2019-03-06.
//  Copyright © 2019 Student. All rights reserved.
//

#ifndef ItemImageViewButton_h
#define ItemImageViewButton_h

#import <UIKit/UIKit.h>

@interface ItemImageViewButton : UIView
@property (strong, nonatomic) NSString* itemName;
- (id)initWithFrame:(CGRect)frame withName:(NSString *)name withImage:(UIImage *)image;
- (NSString *) getItemName;
//- (UIImage *) getHeight;
@end

#endif /* ItemImageViewButton_h */
