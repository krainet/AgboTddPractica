//
//  RADMoney.h
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RADMoney : NSObject

@property (nonatomic,readonly) NSString* currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(id)initWithAmount:(NSInteger) amount currency:(NSString*) currency;


-(id) times:(NSInteger) multiplier;
@end
