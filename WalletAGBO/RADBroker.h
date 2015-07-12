//
//  RADBroker.h
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RADMoney.h"
@class RADMoney;

@interface RADBroker : NSObject

@property (nonatomic,strong) NSMutableDictionary *rates;

-(RADMoney*)reduce:(id<RADMoney>) money toCurrency:(NSString*) currency;
-(void) addRate:(NSInteger) rate fromCurrency:(NSString*) fromCurrency toCurrency:(NSString*) toCurrency;
-(NSString*) keyFromCurrency:(NSString*) fromCurrency toCurrency:(NSString*) toCurrency;
@end
