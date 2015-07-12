//
//  RADMoney.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "RADBroker.h"

@interface RADMoney ()

@end


@implementation RADMoney

+(id) euroWithAmount:(NSInteger) amount{
    return [[RADMoney alloc]initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount{
    return [[RADMoney alloc]initWithAmount:amount currency:@"USD"];
}


- (id<RADMoney>)initWithAmount:(NSInteger) amount currency:(NSString*) currency{
    self = [super init];
    if (self) {
        _amount=@(amount);
        _currency=currency;
    }
    return self;
}


-(id<RADMoney>) times:(NSInteger) multiplier{
    //Jamas deberia llamarse a esto
    //Se llama desde subclase
    
    //_cmd es un parametro oculto que nos indica cual es el selector actual (mensaje actual)
    //return [self subclassResponsibility:_cmd];
    
    
    RADMoney *money = [[RADMoney alloc]
                       initWithAmount:[self.amount integerValue]*
                       multiplier currency:self.currency];
    return money;
    
    
}

-(id<RADMoney>) plus:(RADMoney*) other{
    NSInteger totalAmount = [self.amount integerValue]+[other.amount integerValue];
    
    RADMoney *total = [[RADMoney alloc]initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

// object from object
-(id<RADMoney>) substract:(RADMoney *)other{
    NSInteger totalAmount = [self.amount integerValue] - [other.amount integerValue];
    RADMoney *total = [[RADMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
}


-(id<RADMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(RADBroker*) broker{
    
    RADMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]]doubleValue];
    
    //Comprovamos que divisa 1 y 2 son diferentes
    if([self.currency isEqual:currency]){
        result=self;
    }else if (rate==0){
        //No hay tasa de conversion y la divisa es diferente
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@",self.currency,currency];
    }else{
        
        //Tenemos conversion
        NSInteger newAmount = [self.amount integerValue]*rate;
        result = [[RADMoney alloc]initWithAmount:newAmount currency:currency];
    }
    
    return result;
}


#pragma mark - Ovewritten
-(NSString*) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class],self.currency,self.amount];
}

//Si se implementa isEqual hay que implementar hash
-(BOOL)isEqual:(id)object{
    if([self.currency isEqual:[object currency]]){
        return [self amount]==[object amount];
    }else{
        return NO;
    }
}

//Si se implementa isEqual hay que implementar hash
-(NSUInteger) hash{
    return [self.amount integerValue];
}






@end
