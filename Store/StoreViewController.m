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

@end


@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ItemImageViewButton *viewButton1 = [[ItemImageViewButton alloc] initWithFrame:({
        CGRect frame = CGRectMake(10.0, 10.0, 200.0, 75.0);
        frame;
    })];
    [self.view addSubview:viewButton1];

    
    UIButton *buyButton = [[UIButton alloc] initWithFrame:({
        CGRect frame = CGRectMake(10.0, 10.0, 100.0, 75.0);
        frame;
    })];
    
    
    // buyButtton
    [buyButton setBackgroundColor:[UIColor blueColor]];
    [buyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buyButton addTarget:self
               action:@selector(buyItems)
     forControlEvents:UIControlEventTouchUpInside];
    [buyButton setTitle:@"Show View" forState:UIControlStateNormal];
    [self.view addSubview:buyButton];
    buyButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *buyButtonWidthConstraint = [NSLayoutConstraint
                                                        constraintWithItem:buyButton
                                                    attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                        attribute:NSLayoutAttributeWidth
                                                        multiplier:2.0f/5.0f
                                                        constant:0];
    NSLayoutConstraint *buyButtonAspectRatioConstraint = [NSLayoutConstraint
                                                    constraintWithItem:buyButton
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:buyButton
                                                    attribute:NSLayoutAttributeWidth
                                                    multiplier:2.0f/5.0f
                                                    constant:0];
    NSLayoutConstraint *buyButtonCentreHorizontallyConstraint = [NSLayoutConstraint
                                                        constraintWithItem:buyButton
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                        attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                        constant:0];
    NSLayoutConstraint *buyButtonBottomConstraint = [NSLayoutConstraint
                                                        constraintWithItem:buyButton
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                        attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                        constant:-20];
    [self.view addConstraints:@[buyButtonWidthConstraint,buyButtonAspectRatioConstraint,buyButtonCentreHorizontallyConstraint,buyButtonBottomConstraint]];
   }

- (void)createViewTableHorizontal {
    
}

- (void)createViewTableVertical {
    
}

- (void)buyItems {
    NSLog(@"%@", @"Buying Items");
    ViewController *viewVC = [[ViewController alloc] init];
    
    // do any setup you need for myNewVC
    [self presentViewController:viewVC animated:YES completion:nil];

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
