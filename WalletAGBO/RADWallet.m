//
//  RADWallet.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADWallet.h"
#import "RADBroker.h"



@interface RADWallet ()
@property (nonatomic,strong) NSMutableArray *moneys;
@end

@implementation RADWallet

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    self = [super init];
    if (self) {
        RADMoney *money = [[RADMoney alloc] initWithAmount:amount
                                                  currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
        
        _currencies = [NSMutableArray array];
        [_currencies addObject:money.currency];
    }
    return self;
}

-(id<RADMoney>)plus:(RADMoney *)other{
    [self.moneys addObject:other];
    return self;
}

-(id<RADMoney>) substract:(RADMoney *)other{
    [_moneys removeObject:other];
    return self;
}


-(id<RADMoney>) times:(NSInteger)multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (RADMoney *each in self.moneys) {
        RADMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys=newMoneys;
    return self;
}

- (RADMoney *) totalMoneyForCurrency: (NSString *) currency{
    
    RADMoney *total = [[RADMoney alloc] initWithAmount:0
                                              currency:currency];
    for (RADMoney *each in self.moneys) {
        if ([each.currency isEqual:currency]) {
            total = [total plus:each];
        }
    }
    return total;
}


-(id<RADMoney>)reduceToCurrency:(NSString *)currency withBroker:(RADBroker *)broker{
    RADMoney *result = [[RADMoney alloc]initWithAmount:0 currency:currency];
    
    for (RADMoney *each in self.moneys) {
        result=[result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}

#pragma mark - Getters personalizados
-(NSUInteger) count{
    return [self.moneys count];
}

-(NSUInteger) countEuros{
    NSMutableArray *eur = [NSMutableArray array];
    for (RADMoney *each in self.moneys) {
        if ([each.currency isEqualToString:@"EUR"]) {
            [eur addObject:each];
        }
    }
    return eur.count;
}

-(NSUInteger) countDollars{
    NSMutableArray *usd = [NSMutableArray array];
    for (RADMoney *each in self.moneys) {
        if ([each.currency isEqualToString:@"USD"]) {
            [usd addObject:each];
        }
    }
    return usd.count;
}

- (NSString *) currencyForSection: (NSUInteger) section{
    if (section < self.currencies.count) {
        return [self.currencies objectAtIndex:section];
    }
    return @"";
}


- (id<RADMoney>) addMoney: (RADMoney *) other{
    [self.moneys addObject:other];
    if (![self.currencies containsObject:other.currency]) {
        [self.currencies addObject:other.currency];
    }
    return self;
}

- (id<RADMoney>) takeMoney: (RADMoney *) other{
    if (![self.moneys containsObject:other]) {
        [NSException raise:@"TryingToSubstractANonExistingMoneyException"
                    format:@"Imposible to substract %@ %@ form the wallet", other.amount, other.currency];
    }
    [self.moneys removeObject:other];
    return self;
}


- (NSUInteger) numberOfMoneysForCurrency: (NSString *) currency{
    NSUInteger numberOfMoneys = 0;
    for (RADMoney *each in self.moneys) {
        if ([each.currency isEqual:currency]) {
            numberOfMoneys++;
        }
    }
    return numberOfMoneys;
}

- (NSUInteger) numberOfMoneysForSection: (NSUInteger) section{
    
    return [self numberOfMoneysForCurrency:[self currencyForSection:section]];
}

- (RADMoney *) moneyForIndexPath: (NSIndexPath *) indexPath
                toCurrency:(NSString *) currency
                      withBroker:(RADBroker *)broker{
    
    if (indexPath.section < self.currencies.count) {
        // No es la seccion con el total
        if (indexPath.row < [self numberOfMoneysForSection:indexPath.section]) {
            // No es la ultima celda, la del subtotal
            NSString *desiredCurrency = [self.currencies objectAtIndex:indexPath.section];
            NSInteger moneyPlace = indexPath.row;
            NSInteger moneysFoundForDesiredCurrency = 0;
            RADMoney *desiredMoney;
            for (RADMoney *each in self.moneys) {
                if ([each.currency isEqual:desiredCurrency]) {
                    if (moneysFoundForDesiredCurrency == moneyPlace) {
                        desiredMoney = each;
                        break;
                    }
                    moneysFoundForDesiredCurrency++;
                }
            }
            if (!currency) {
                currency = desiredMoney.currency;
            }
            return [desiredMoney reduceToCurrency:currency
                                       withBroker:broker];
        }else{
            // Es la ultima celda, la del subtotal
            NSString *desiredCurrency = [self.currencies objectAtIndex:indexPath.section];
            RADMoney *total = [[RADMoney alloc] initWithAmount:0 currency:desiredCurrency];
            for (RADMoney *each in self.moneys) {
                if ([each.currency isEqual:desiredCurrency]) {
                    total = [total plus:[each reduceToCurrency:desiredCurrency withBroker:broker]];
                }
            }
            return total;
        }
    }else{
        // Es la seccion con el total
        if (!currency) {
            currency = [self.currencies firstObject];
            if (!currency) {
                currency = @"USD";
            }
        }
        RADMoney *total = [[RADMoney alloc] initWithAmount:0 currency:currency];
        for (RADMoney *each in self.moneys) {
            total = [total plus:[each reduceToCurrency:currency withBroker:broker]];
        }
        return total;
    }
}

- (NSUInteger) totalNumberOfCurrencies{
    return self.currencies.count;
}

- (RADMoney *) totalMoneyForSection: (NSUInteger) section{
    
    if (section < self.currencies.count){
        return [self totalMoneyForCurrency:[self.currencies objectAtIndex:section]];
    }else{
        return nil;
    }
}

- (void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
    
}

- (void) dumpToDisk: (NSNotification *) notification{
    // Guarda las cosas en disco cuando la cosa se pknga fea
}






@end
