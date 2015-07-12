//
//  RADWalletTests.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "RADMoney.h"
#import "RADBroker.h"
#import "RADWallet.h"

@interface RADWalletTests : XCTestCase

@end

@implementation RADWalletTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    RADBroker *broker = [RADBroker new];
    
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    RADWallet *wallet= [[RADWallet alloc]initWithAmount:40 currency:@"EUR"];
    [wallet plus: [RADMoney dollarWithAmount:20]];
    
    RADMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [RADMoney dollarWithAmount:100],@"€40 + $20 = $100 2:1");
    
}

// 1€+1€ equals 2€
-(void)testcountEuros{
    RADWallet *wallet = [[RADWallet alloc] initWithAmount:1 currency:@"EUR"];
    [wallet plus:[RADMoney euroWithAmount:1]];
    NSInteger iEuros = wallet.countEuros;
    XCTAssertEqual(iEuros, 2, @"€2");
}

// 1usd + 1usd equals 2$
-(void)testcountDollars{
    RADWallet *wallet = [[RADWallet alloc] initWithAmount:1 currency:@"USD"];
    [wallet plus:[RADMoney dollarWithAmount:1]];
    NSInteger iDollars = wallet.countDollars;
    //NSLog(@"Dollar vale :: %@",@(iDollars));
    XCTAssertEqual(iDollars, 2, @"$2");
}


@end
