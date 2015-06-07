//
//  RADDollarTests.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RADDollar.h"
#import "RADMoney.h"

@interface RADDollarTests : XCTestCase

@end

@implementation RADDollarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMultiplication{
    RADDollar *dolar=[RADMoney dollarWithAmount:5];
    RADDollar *ten=[RADMoney dollarWithAmount:10];
    RADDollar *total=[dolar times:2];
    
    XCTAssertEqualObjects(ten, total,@"5*2 should be 10");
}

-(void) testEquality{
    RADDollar *five = [RADMoney dollarWithAmount:5];
    RADDollar *ten = [RADMoney dollarWithAmount:10];
    RADDollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,@"Equivalent objects should be equal!");
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects");
}

-(void) testHash{
    RADDollar *a = [RADMoney dollarWithAmount:2];
    RADDollar *b = [RADMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have same hash");
}

-(void) testAmountStorage{
    //Ocultar warnings controlados
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    RADDollar *dollar = [RADMoney dollarWithAmount:2];
    XCTAssertEqual(2,[[dollar performSelector:@selector(amount)]integerValue], @"Value stored must be equal that init");
#pragma clang diagnostic pop
}



@end
