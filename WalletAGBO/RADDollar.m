//
//  RADDollar.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADDollar.h"

@interface RADDollar ()
@property (nonatomic) NSInteger amount;
@end

@implementation RADDollar

- (instancetype)initWithAmount:(NSInteger)amount{
    self = [super init];
    if (self) {
        _amount=amount;
    }
    return self;
}


-(RADDollar*) times:(NSInteger) multiplier{
    RADDollar *newDollar = [[RADDollar alloc]initWithAmount:self.amount*multiplier];
    return newDollar;
}


#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    return [self amount]==[object amount];
}

@end
