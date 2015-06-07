//
//  RADEuro.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADEuro.h"
#import "RADMoney-Private.h"


@implementation RADEuro

-(RADEuro*) times:(NSInteger) multiplier{
    RADEuro *newEuro = [[RADEuro alloc]initWithAmount:[self.amount integerValue]*multiplier];
    return newEuro;
}


#pragma mark - Overwritten



@end
