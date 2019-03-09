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

- (id)initWithFrame:(CGRect)frame withName:(NSString *)name withImage: (UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // initilize all your UIView components
        
        _itemName = name;

        self.frame = frame;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        _buttonImageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 64, 64)];
        [_buttonImageView setImage:image];
        //_buttonImageView.image = ;
        [self addSubview:_buttonImageView];

        _buttonLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 64, 64)];
        _buttonLabel.text = name;
        _buttonLabel.textAlignment = NSTextAlignmentCenter;

        [self addSubview:_buttonLabel]; //add label1 to your custom view
        
        
        //[label1 release];//i am using without ARC, comment if u are using ARC
        //[label2 release];//i am using without ARC, comment if u are using ARC
        _buttonImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _buttonLabel.translatesAutoresizingMaskIntoConstraints = NO;

        NSLayoutConstraint *bivTopConstraint = [NSLayoutConstraint
                                                constraintWithItem:_buttonImageView
                                                attribute:NSLayoutAttributeTop
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:self
                                                attribute:NSLayoutAttributeTop
                                                multiplier:1
                                                constant:0
        
        ];
        NSLayoutConstraint *bivLeadingConstraint = [NSLayoutConstraint
                                                constraintWithItem:_buttonImageView
                                                attribute:NSLayoutAttributeLeading
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:self
                                                attribute:NSLayoutAttributeLeading
                                                multiplier:1
                                                constant:0
                                                
                                                ];
        NSLayoutConstraint *bivTrailingConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self
                                                    attribute:NSLayoutAttributeTrailing
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:_buttonImageView
                                                    attribute:NSLayoutAttributeTrailing
                                                    multiplier:1
                                                    constant:0
                                                    
                                                    ];

        NSLayoutConstraint *bivWidthConstraint = [NSLayoutConstraint
                                                        constraintWithItem:_buttonImageView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                        attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                        constant:0];
        NSLayoutConstraint *bivAspectRatioConstraint = [NSLayoutConstraint
                                                              constraintWithItem:_buttonImageView
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:_buttonImageView
                                                              attribute:NSLayoutAttributeWidth
                                                              multiplier:1
                                                              constant:0];
        NSLayoutConstraint *blHeightConstraint = [NSLayoutConstraint
                                                              constraintWithItem:_buttonLabel
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:_buttonImageView
                                                              attribute:NSLayoutAttributeHeight
                                                              multiplier:1.0f/3.0f
                                                              constant:0];
        NSLayoutConstraint *blTopConstraint = [NSLayoutConstraint
                                                                     constraintWithItem:_buttonLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                     toItem:_buttonImageView
                                                                     attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                     constant:0];
        NSLayoutConstraint *blLeadingConstraint = [NSLayoutConstraint
                                                   constraintWithItem:_buttonLabel
                                                   attribute:NSLayoutAttributeLeading
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:self
                                                   attribute:NSLayoutAttributeLeading
                                                   multiplier:1.0
                                                   constant:0];
        NSLayoutConstraint *blTrailingConstraint = [NSLayoutConstraint
                                                   constraintWithItem:self
                                                   attribute:NSLayoutAttributeTrailing
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:_buttonLabel
                                                   attribute:NSLayoutAttributeTrailing
                                                   multiplier:1.0
                                                   constant:0];
        NSLayoutConstraint *blBottomConstraint = [NSLayoutConstraint
                                                   constraintWithItem:self
                                                   attribute:NSLayoutAttributeBottom
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:_buttonLabel
                                                   attribute:NSLayoutAttributeBottom
                                                   multiplier:1.0
                                                   constant:0];
        [self addConstraints:@[bivTopConstraint,bivLeadingConstraint,bivTrailingConstraint,bivWidthConstraint,bivAspectRatioConstraint,blHeightConstraint,blTopConstraint,blLeadingConstraint,blTrailingConstraint,blBottomConstraint]];

    }
    return self;
}

- (NSString *) getItemName {
    return _itemName;
}
- (float)getWidth {
    return 0.0f;
}

- (float)getHeight {
    return _buttonImageView.frame.size.height + _buttonLabel.frame.size.height + 0;
}
@end
