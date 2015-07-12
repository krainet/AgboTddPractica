//
//  RADWalletTableViewController.h
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RADWallet;
@class RADBroker;

@interface RADWalletTableViewController : UITableViewController

- (id) initWithModel: (RADWallet *) wallet
               broker: (RADBroker *) broker;

@end
