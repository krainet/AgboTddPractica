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
    RADDollar *dolar=[[RADDollar alloc]initWithAmount:5];
    RADDollar *ten=[[RADDollar alloc]initWithAmount:10];
    RADDollar *total=[dolar times:2];
    
    XCTAssertEqualObjects(ten, total,@"5*2 should be 10");
}

-(void) testEquality{
    RADDollar *five = [[RADDollar alloc]initWithAmount:5];
    RADDollar *ten = [[RADDollar alloc]initWithAmount:10];
    RADDollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,@"Equivalent objects should be equal!");
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects");
}


@end
