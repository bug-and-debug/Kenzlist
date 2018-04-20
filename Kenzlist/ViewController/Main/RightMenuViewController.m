//
//  RightMenuViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "RightMenuViewController.h"
#import "HomeViewController.h"

@implementation RightMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayCategories = [[NSArray alloc] init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayCategories.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"categoryCell"];
    UILabel *lable = [cell viewWithTag:1];
    lable.text = [_arrayCategories objectAtIndex:indexPath.row];
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(0.0) green:(40/255.0) blue:(80/255.0) alpha:0.5];
    cell.selectedBackgroundView = selectionColor;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{    
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed completion:^{}];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    HomeViewController *homeVc = [navigationController.viewControllers objectAtIndex:0];
    homeVc.lblCategory.text = [_arrayCategories objectAtIndex:indexPath.row];
}

@end
