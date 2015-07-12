//
//  RADSimpleViewController.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADSimpleViewController.h"

@interface RADSimpleViewController ()

@end

@implementation RADSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)displayText:(id)sender {
    UIButton *btn = sender;
    self.displayLabel.text=btn.titleLabel.text;
}
@end
