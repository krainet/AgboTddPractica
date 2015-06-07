//
//  RADMoneyTests.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RADMoney.h"

@interface RADMoneyTests : XCTestCase

@end

@implementation RADMoneyTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[RADMoney euroWithAmount:1] currency], @"Currency should be euro");
    XCTAssertEqualObjects(@"USD", [[RADMoney dollarWithAmount:1] currency], @"Currency should be dollar");
}


//- (void)testThatTimesRaisesException{
//    //Compruebo lanzamiento de exception
//    RADMoney *money = [[RADMoney alloc]initWithAmount:1];
//    XCTAssertThrows([money times:2],@"Should raise an exception");
//}


@end
