//
//  RADWallet.h
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "RADMoney.h"

@interface RADWallet : NSObject<RADMoney>

@property (nonatomic,readonly) NSUInteger count;
@property (nonatomic, readonly) NSMutableArray *currencies;
-(NSUInteger) countEuros;
-(NSUInteger) countDollars;


- (NSUInteger) totalNumberOfCurrencies;
- (NSString *) currencyForSection: (NSUInteger) section;
- (NSUInteger) numberOfMoneysForSection: (NSUInteger) section;
- (void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;


- (RADMoney *) moneyForIndexPath: (NSIndexPath *) indexPath
                      toCurrency:(NSString *) currency
                      withBroker:(RADBroker *)broker;

- (RADMoney *) totalMoneyForCurrency: (NSString *) currency;
- (RADMoney *) totalMoneyForSection: (NSUInteger) section;

- (id<RADMoney>) addMoney: (RADMoney *) other;
- (id<RADMoney>) takeMoney: (RADMoney *) other;


@end
