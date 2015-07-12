//
//  RADMoney.h
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RADBroker;
@class RADMoney;

@protocol RADMoney <NSObject>

-(id<RADMoney>)initWithAmount:(NSInteger) amount currency:(NSString*) currency;


-(id<RADMoney>) times:(NSInteger) multiplier;
-(id<RADMoney>) plus:(id<RADMoney>) other;
-(id<RADMoney>) reduceToCurrency:(NSString*) currency withBroker:(RADBroker*) broker;
-(id<RADMoney>) substract:(RADMoney *) other;

@end

@interface RADMoney : NSObject<RADMoney>

@property (nonatomic,strong,readonly) NSNumber *amount;
@property (nonatomic,readonly) NSString* currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;



@end
