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
#import "RADEuro.h"
#import "RADDollar.h"

@implementation RADMoney

+(id) euroWithAmount:(NSInteger) amount{
    return [[RADMoney alloc]initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount{
    return [[RADMoney alloc]initWithAmount:amount currency:@"USD"];
}


- (instancetype)initWithAmount:(NSInteger) amount currency:(NSString*) currency{
    self = [super init];
    if (self) {
        _amount=@(amount);
        _currency=currency;
    }
    return self;
}


-(id) times:(NSInteger) multiplier{
    //Jamas deberia llamarse a esto
    //Se llama desde subclase
    
    //_cmd es un parametro oculto que nos indica cual es el selector actual (mensaje actual)
    //return [self subclassResponsibility:_cmd];
    
    
    RADMoney *money = [[RADMoney alloc]
                       initWithAmount:[self.amount integerValue]*
                       multiplier currency:self.currency];
    return money;
    
    
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
