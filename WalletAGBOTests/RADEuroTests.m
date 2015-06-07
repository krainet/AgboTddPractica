//
//  RADEuroTests.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RADEuro.h"
#import "RADMoney.h"

@interface RADEuroTests : XCTestCase

@end

@implementation RADEuroTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


- (void) testMultiplication{
    RADEuro *euro=[RADMoney euroWithAmount:5];
    RADEuro *ten=[RADMoney euroWithAmount:10];
    RADEuro *total=[euro times:2];
    
    //Oclto amount
    //XCTAssertEqual(total.amount, 10,@"5*2 son 10");
    
    XCTAssertEqualObjects(ten, total,@"5*2 should be 10");
}

-(void) testEquality{
    RADEuro *five = [RADMoney euroWithAmount:5];
    RADEuro *ten = [RADMoney euroWithAmount:10];
    RADEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,@"Equivalent objects should be equal!");
}

-(void) testHash{
    RADEuro *a = [RADMoney euroWithAmount:2];
    RADEuro *b = [RADMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have same hash");
}

-(void) testAmountStorage{
    //Ocultar warnings controlados

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    RADEuro *euro = [RADMoney euroWithAmount:2];
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)]integerValue], @"Value stored must be equal that init");
#pragma clang diagnostic pop
}


@end
