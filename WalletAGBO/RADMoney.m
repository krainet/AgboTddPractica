//
//  RADMoney.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "RADMoney-Private.h"

@implementation RADMoney

- (instancetype)initWithAmount:(NSInteger) amount{
    self = [super init];
    if (self) {
        _amount=@(amount);
    }
    return self;
}


-(RADMoney*) times:(NSInteger) multiplier{
    //Jamas deberia llamarse a esto
    //Se llama desde subclase
    
    //_cmd es un parametro oculto que nos indica cual es el selector actual (mensaje actual)
    return [self subclassResponsibility:_cmd];
}

#pragma mark - Ovewritten
-(NSString*) description{
    return [NSString stringWithFormat:@"<%@ %ld", [self class],(long)[self amount]];
}

//Si se implementa isEqual hay que implementar hash
-(BOOL)isEqual:(id)object{
    return [self amount]==[object amount];
}

//Si se implementa isEqual hay que implementar hash
-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}




@end
