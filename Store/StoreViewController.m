//
//  StoreViewController.m
//  Store
//
//  Created by Student on 2019-03-06.
//  Copyright © 2019 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StoreViewController.h"

#import "ViewController.h"
#import "ItemImageViewButton.h"

@interface StoreViewController ()
    @property (strong, nonatomic) NSMutableArray *itemArray;
@end


@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int items = 20;
    int columns = 5;
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *dButton = [self createDoneButtonWithText:@"Done"];
    UIScrollView *scrollView = [self createScrollViewWithBottomTo:dButton withLength:(int)(items/columns +1) * (self.view.frame.size.width / (columns + 1))];
    [self createItemButtonArrayWithSize:items inView:scrollView];

   }
-(UIScrollView*)createScrollViewWithBottomTo:(UIButton*)button withLength:(float)length{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:({
        CGRect frame = CGRectMake(10.0, 10.0, 10.0, 10.0);
        frame;
    })];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, length);
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *svTopConstraint = [NSLayoutConstraint
                                           constraintWithItem:scrollView
                                           attribute:NSLayoutAttributeTop
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute:NSLayoutAttributeTop
                                           multiplier:1
                                           constant:0];
    NSLayoutConstraint *svLeadingConstraint = [NSLayoutConstraint
                                           constraintWithItem:scrollView
                                           attribute:NSLayoutAttributeLeading
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute:NSLayoutAttributeLeading
                                           multiplier:1
                                           constant:0];
    NSLayoutConstraint *svTrailingConstraint = [NSLayoutConstraint
                                               constraintWithItem:scrollView
                                               attribute:NSLayoutAttributeTrailing
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:self.view
                                               attribute:NSLayoutAttributeTrailing
                                               multiplier:1
                                               constant:0];
    NSLayoutConstraint *svBottomConstraint = [NSLayoutConstraint
                                                constraintWithItem:scrollView
                                                attribute:NSLayoutAttributeBottom
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:button
                                                attribute:NSLayoutAttributeTop
                                                multiplier:1
                                                constant:0];
    [self.view addConstraints:@[svTopConstraint,svLeadingConstraint,svTrailingConstraint,svBottomConstraint]];    return scrollView;
}

-(void)createItemButtonArrayWithSize:(int)size inView:(UIView *)view {
    _itemArray = [[NSMutableArray alloc] init];
    
    int columns = 5;
    
    UIImage *image = [UIImage imageNamed:@"roundedSquarePlus"];
    for (int i = 0; i < size; ++i) {
        NSString * name = [NSString stringWithFormat:@"Item %d", i];
        ItemImageViewButton *viewButton = [[ItemImageViewButton alloc] initWithFrame:({
            CGRect frame = CGRectMake(10.0 + 10 * i, 10.0 + 10 * i, 10.0, 10.0);
            frame;
        }) withName: name withImage:image];
        viewButton.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buyItem:)];
        [viewButton addGestureRecognizer:tap];
        [view addSubview:viewButton];
        [_itemArray addObject:viewButton ];
                NSLayoutConstraint *vbWidthConstraint = [NSLayoutConstraint
                                                              constraintWithItem:viewButton
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:view
                                                              attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0/(columns + 4 )
                                                              constant:0];
        NSLayoutConstraint *vbTopConstraint = [NSLayoutConstraint
                                               constraintWithItem:viewButton
                                               attribute:NSLayoutAttributeTop
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:view
                                               attribute:NSLayoutAttributeTop
                                               multiplier:1
                                               constant:10 + 10  * (int)(i / columns) + ((self.view.frame.size.width / (columns + 4 )) *4/3)  * (int)(i / columns)];

        NSLayoutConstraint *vbCentreHorizontallyConstraint = [NSLayoutConstraint
                                                                      constraintWithItem:viewButton
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                      toItem:view
                                                                      attribute:NSLayoutAttributeCenterX
                                                                    multiplier: (1 + ((i % columns) * 2.0f))/(columns)
                                                                      constant:0];
        [view addConstraints:@[vbTopConstraint,vbWidthConstraint,vbCentreHorizontallyConstraint]];
        //NSLog(@"%f", vbWidthConstraint.multiplier);
        
        NSLog(@"%d", columns);
        
        //NSLog(@"%f %lu", (float)size, (unsigned long)_itemArray.count);

    }
    /*
    for (ItemImageViewButton* vb in _itemArray) {
        //NSLog(@"%@", vb);
    }
     */

}

- (UIButton*)createDoneButtonWithText:(NSString*)text {
    UIButton *doneButton = [[UIButton alloc] initWithFrame:({
        CGRect frame = CGRectMake(10.0, 10.0, 100.0, 75.0);
        frame;
    })];
    
    
    // doneButton
    [doneButton setBackgroundColor:[UIColor blueColor]];
    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [doneButton addTarget:self
                   action:@selector(done)
         forControlEvents:UIControlEventTouchUpInside];
    [doneButton setTitle:text forState:UIControlStateNormal];
    [self.view addSubview:doneButton];
    doneButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *doneButtonWidthConstraint = [NSLayoutConstraint
                                                     constraintWithItem:doneButton
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self.view
                                                     attribute:NSLayoutAttributeWidth
                                                     multiplier:2.0f/9.0f
                                                     constant:0];
    NSLayoutConstraint *doneButtonAspectRatioConstraint = [NSLayoutConstraint
                                                           constraintWithItem:doneButton
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                           toItem:doneButton
                                                           attribute:NSLayoutAttributeWidth
                                                           multiplier:2.0f/5.0f
                                                           constant:0];
    NSLayoutConstraint *doneButtonCentreHorizontallyConstraint = [NSLayoutConstraint
                                                                  constraintWithItem:doneButton
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                  constant:0];
    NSLayoutConstraint *doneButtonBottomConstraint = [NSLayoutConstraint
                                                      constraintWithItem:doneButton
                                                      attribute:NSLayoutAttributeBottom
                                                      relatedBy:NSLayoutRelationEqual
                                                      toItem:self.view
                                                      attribute:NSLayoutAttributeBottom
                                                      multiplier:1.0
                                                      constant:-20];
    [self.view addConstraints:@[doneButtonWidthConstraint,doneButtonAspectRatioConstraint,doneButtonCentreHorizontallyConstraint,doneButtonBottomConstraint]];
    return doneButton;
}
- (void)createViewTableHorizontal {
    
}

- (void)createViewTableVertical {
    
}

- (void)done {
    NSLog(@"%@", @"Done Buying Items");
    ViewController *viewVC = [[ViewController alloc] init];
    
    // do any setup you need for myNewVC
    [self presentViewController:viewVC animated:YES completion:nil];

}

- (void)buyItem:(UITapGestureRecognizer*)tap {
    NSString *  string = [(ItemImageViewButton *)(tap.view) getItemName];
    NSLog(@"%@", string);
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
