//
//  RADWalletTableViewController.m
//  WalletAGBO
//
//  Created by RAMON ALBERTI DANES on 7/6/15.
//  Copyright (c) 2015 Krainet. All rights reserved.
//

#import "RADWalletTableViewController.h"
#import "RADWallet.h"
#import "RADBroker.h"

@interface RADWalletTableViewController ()
@property (strong,nonatomic) RADWallet *model;
@property (nonatomic, strong) RADBroker *broker;

@end

@implementation RADWalletTableViewController

- (id) initWithModel: (RADWallet *) wallet
               broker: (RADBroker *) broker{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _model = wallet;
        _broker = broker;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    NSLog(@"RESSSSS::: %@",self.model);
    return [self.model totalNumberOfCurrencies] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.model numberOfMoneysForSection:section] + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section < [self.model totalNumberOfCurrencies]) {
        return [self.model currencyForSection:section];
    }else{
        return @"TOTAL";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"moneyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:identifier];
    }
    
    RADMoney *money = [self.model moneyForIndexPath:indexPath
                                    toCurrency:nil
                                          withBroker:self.broker];
    
    if (indexPath.row < [self.model numberOfMoneysForSection:indexPath.section]) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", money.amount];
    }else{
        if (indexPath.section < [self.model totalNumberOfCurrencies]) {
            cell.textLabel.text = [NSString stringWithFormat:@"Total Divisa: %@", money.amount];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@", money.amount];
        }
    }
    cell.detailTextLabel.text = money.currency;
    
    return cell;
}

// Edit
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [self.model numberOfMoneysForSection:indexPath.section]) {
        return YES;
    }else{
        return NO;
    }
}



// ACTIVAMOS delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model takeMoney:[self.model moneyForIndexPath:indexPath
                                             toCurrency:nil
                                                   withBroker:self.broker]];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
