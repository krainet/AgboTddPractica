//
//  RADBrokerTests.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "RADMoney.h"
#import "RADBroker.h"

@interface RADBrokerTests : XCTestCase
@property (nonatomic,strong) RADBroker *emptyBroker;
@property (nonatomic,strong) RADMoney *oneDollar;
@end

@implementation RADBrokerTests

- (void)setUp {
    [super setUp];
    self.emptyBroker=[RADBroker new];
    self.oneDollar=[RADMoney dollarWithAmount:1];
    
}

- (void)tearDown {
    [super tearDown];
    self.emptyBroker=nil;
    self.oneDollar=nil;
}

- (void)testSimpleReduction {

    RADMoney *sum = [[RADMoney dollarWithAmount:5]plus:[RADMoney dollarWithAmount:5]];
    
    RADMoney *reduced = [self.emptyBroker reduce: sum toCurrency:@"USD"];
    XCTAssertEqualObjects(sum, reduced,@"Conversion to same currency should be a NOP");
}

//10$ = $5€ -> tasa 2:1
-(void) testReduction{
    RADMoney *dollars = [RADMoney dollarWithAmount:10];
    RADMoney *euros = [RADMoney euroWithAmount:5];
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    RADMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros,@"$10==€5 2:1");
}

-(void) testThatNoRateRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"],@"No rates should calls exception");
}

-(void) testThatNilConversionDoesNotChangeMoney{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"],@"A nil conversion should have no effect");
}


@end
