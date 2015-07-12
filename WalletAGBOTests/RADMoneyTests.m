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

- (void) testMultiplication{
    RADMoney *euro=[RADMoney euroWithAmount:5];
    RADMoney *ten=[RADMoney euroWithAmount:10];
    RADMoney *total=[euro times:2];
    
    //Oclto amount
    //XCTAssertEqual(total.amount, 10,@"5*2 son 10");
    
    XCTAssertEqualObjects(ten, total,@"5*2 should be 10");
}

-(void) testEquality{
    RADMoney *five = [RADMoney euroWithAmount:5];
    RADMoney *ten = [RADMoney euroWithAmount:10];
    RADMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total,@"Equivalent objects should be equal!");
    XCTAssertEqualObjects([[RADMoney dollarWithAmount:2]times:2],[RADMoney dollarWithAmount:4], @"Equivalent objects should be equals!");
}

-(void) testDifferentCurrencies{
    RADMoney *euro = [RADMoney euroWithAmount:1];
    RADMoney *dollar = [RADMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equals");
}

-(void) testHash{
    RADMoney *a = [RADMoney euroWithAmount:2];
    RADMoney *b = [RADMoney euroWithAmount:2];

    RADMoney *c = [RADMoney dollarWithAmount:2];
    RADMoney *d = [RADMoney dollarWithAmount:2];
    
    
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have same hash");
    XCTAssertEqual([c hash], [d hash],@"Equal objects must have same hash");
}

-(void) testAmountStorage{
    //Ocultar warnings controlados
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    RADMoney *euro = [RADMoney euroWithAmount:2];
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)]integerValue], @"Value stored must be equal that init");
    RADMoney *dollar = [RADMoney dollarWithAmount:2];
    XCTAssertEqual(2,[[dollar performSelector:@selector(amount)]integerValue], @"Value stored must be equal that init");
    
#pragma clang diagnostic pop
}



-(void) testSimpleAddition{
    RADMoney *a = [RADMoney euroWithAmount:5];
    RADMoney *b = [RADMoney euroWithAmount:5];
    RADMoney *c = [RADMoney euroWithAmount:10];

    XCTAssertEqualObjects([a plus:b], c,@"€5 + €5 = €10");
    
}

-(void) testHashIsAmount{
    RADMoney *one = [RADMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1,"Hash must be same as amount");
}

-(void) testDescription{
    RADMoney *one = [RADMoney dollarWithAmount:1];
    NSString *desc = @"<RADMoney: USD 1>";
    XCTAssertEqualObjects(desc,[one description], @"Descriptionmust match template");
}

// Test resta
-(void) testSimpleSubstract{
    XCTAssertEqualObjects([[RADMoney euroWithAmount:5] substract:
                           [RADMoney euroWithAmount:5]],
                          [RADMoney euroWithAmount:0], @"€5 - €5 = €0");
}


//- (void)testThatTimesRaisesException{
//    //Compruebo lanzamiento de exception
//    RADMoney *money = [[RADMoney alloc]initWithAmount:1];
//    XCTAssertThrows([money times:2],@"Should raise an exception");
//}




@end
