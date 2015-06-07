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

-(void) testHash{
    RADDollar *a = [[RADDollar alloc]initWithAmount:2];
    RADDollar *b = [[RADDollar alloc]initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have same hash");
}

-(void) testAmountStorage{
    //Ocultar warnings controlados
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    RADDollar *euro = [[RADDollar alloc]initWithAmount:2];
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)]integerValue], @"Value stored must be equal that init");
#pragma clang diagnostic pop
}



@end
