//
//  RADBroker.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADBroker.h"
#import "RADMoney.h"

@interface RADBroker ()

@end

@implementation RADBroker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rates=[@{} mutableCopy];
    }
    return self;
}

-(RADMoney*)reduce:(RADMoney*) money toCurrency:(NSString*) currency{

    //Double dispatch
    return [money reduceToCurrency:currency withBroker:self];
    
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*) fromCurrency
     toCurrency:(NSString*) toCurrency{
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:invRate forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - Utils
-(NSString*) keyFromCurrency:(NSString*) fromCurrency toCurrency:(NSString*) toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}

@end
