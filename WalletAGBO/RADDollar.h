//
//  RADDollar.h
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 3/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RADDollar : NSObject

-(id) initWithAmount:(NSInteger) amount;
-(RADDollar*) times:(NSInteger) multiplier;


@end
