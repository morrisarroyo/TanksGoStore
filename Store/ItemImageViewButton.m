//
//  ItemImageViewButton.m
//  Store
//
//  Created by Student on 2019-03-06.
//  Copyright © 2019 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemImageViewButton.h"


@interface ItemImageViewButton ()
    @property (strong, nonnull) UIImageView  *buttonImageView;
    @property (strong, nonnull) UILabel *buttonLabel;
@end

@implementation ItemImageViewButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // initilize all your UIView components
        
        _buttonImageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 64, 64)];
        UIImage *buttonImage = [UIImage imageNamed:@"roundedSquarePlus"];
        [_buttonImageView setImage:buttonImage];
        //_buttonImageView.image = ;
        [self addSubview:_buttonImageView];

        _buttonLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,30, 200, 44)];
        _buttonLabel.text = @"i am label 1";
        [self addSubview:_buttonLabel]; //add label1 to your custom view
        
        
        //[label1 release];//i am using without ARC, comment if u are using ARC
        //[label2 release];//i am using without ARC, comment if u are using ARC
    }
    return self;
}

- (float)getWidth {
    return 0.0f;
}

- (float)getHeight {
    return 0.0f;
}
@end
