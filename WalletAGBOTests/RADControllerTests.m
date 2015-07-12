//
//  RADControllerTests.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RADSimpleViewController.h"
#import "RADWalletTableViewController.h"
#import "RADWallet.h"

@interface RADControllerTests : XCTestCase
@property (nonatomic,strong) RADSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) RADWalletTableViewController *walletVC;
@property (nonatomic,strong) RADWallet *walletModel;
@end

@implementation RADControllerTests

- (void)setUp {
    [super setUp];
    self.simpleVC=[[RADSimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.walletModel = [[RADWallet alloc]initWithAmount:1 currency:@"USD"];
    [self.walletModel plus:[[RADWallet alloc]initWithAmount:1 currency:@"EUR"]];
    self.walletVC = [[RADWalletTableViewController alloc]initWithModel:self.walletModel broker:nil];
    
}

- (void)tearDown {
    [super tearDown];
    self.simpleVC=nil;
}

-(void) testThatTextOnLabelIsEqualToTextOnButton{
    //mandamos mensaje
    [self.simpleVC displayText:self.button];
    
    //Comprobamos que label y button tienen mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Button & Label should have the same text");
}

//-(void) testThatTableHasOneSection{
//    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
//    XCTAssertEqual(sections, 1,@"There can only be one");
//}
//
//-(void) testThatNumberOfCellsIsNumberofMoneysPlusOne{
//    
//    [self.walletModel addMoney:[RADMoney dollarWithAmount:20]];
//    [self.walletModel addMoney:[RADMoney euroWithAmount:5]];
//    [self.walletModel addMoney:[RADMoney euroWithAmount:10]];
//    
//    NSUInteger numberOfSections = [self.walletVC numberOfSectionsInTableView:nil];
//    NSUInteger numberOfCurrencies = [self.walletModel totalNumberOfCurrencies];
//    
//    for (int i=0; i < numberOfSections; i++) {
//        NSUInteger numberOfRowsForSection = [self.walletModel numberOfMoneysForSection:i] + 1;
//        if (i < numberOfCurrencies) {
//            XCTAssertEqual(numberOfRowsForSection, [self.walletVC tableView:nil numberOfRowsInSection:i], @"testThatNumberOfCellsIsNumberofMoneysPlusOne");
//        }else{
//            XCTAssertEqual(numberOfRowsForSection, 1, @"testThatNumberOfCellsIsNumberofMoneysPlusOne");
//        }
//    }
//    
//}

@end
