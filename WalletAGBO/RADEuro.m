//
//  RADEuro.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADEuro.h"

@interface RADEuro ()
@property (nonatomic) NSInteger amount;
@end

@implementation RADEuro

- (instancetype)initWithAmount:(NSInteger)amount{
    self = [super init];
    if (self) {
        _amount=amount;
    }
    return self;
}


-(RADEuro*) times:(NSInteger) multiplier{
    RADEuro *newEuro = [[RADEuro alloc]initWithAmount:self.amount*multiplier];
    return newEuro;
}


#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    return [self amount]==[object amount];
}

@end
