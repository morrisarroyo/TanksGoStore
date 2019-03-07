//
//  ViewController.m
//  Store
//
//  Created by Student on 2019-03-06.
//  Copyright © 2019 Student. All rights reserved.
//

#import "ViewController.h"
#import "StoreViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressStoreButton:(id)sender {
    StoreViewController *storeVC = [[StoreViewController alloc] init];
    
    // do any setup you need for myNewVC
    [self presentViewController:storeVC animated:YES completion:nil];
    
}


@end
