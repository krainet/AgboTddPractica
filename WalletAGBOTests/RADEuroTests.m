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
    RADEuro *euro=[[RADEuro alloc]initWithAmount:5];
    RADEuro *ten=[[RADEuro alloc]initWithAmount:10];
    RADEuro *total=[euro times:2];
    
    //Oclto amount
    //XCTAssertEqual(total.amount, 10,@"5*2 son 10");
    
    XCTAssertEqualObjects(ten, total,@"5*2 should be 10");
}

-(void) testEquality{
    RADEuro *five = [[RADEuro alloc]initWithAmount:5];
    RADEuro *ten = [[RADEuro alloc]initWithAmount:10];
    RADEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,@"Equivalent objects should be equal!");
}



@end
