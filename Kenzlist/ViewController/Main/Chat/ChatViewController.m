//
//  MyItemViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCell.h"

@implementation ChatViewController{
    NSArray *arrayChat;
    int selected_item;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayChat = [@[
                   [@{@"sellerImg" : @"tmpuser1.jpeg", @"itemName" : @"Mac Book Pro", @"itemImg" : @"tmp.jpg", @"sellerName" : @"Smith Linda"} mutableCopy],
                   [@{@"sellerImg" : @"tmpuser2.jpg", @"itemName" : @"Motocycle", @"itemImg" : @"tmp2.jpg", @"sellerName" : @"Alex Ischenko"} mutableCopy],
                   [@{@"sellerImg" : @"tmpuser3.jpg", @"itemName" : @"Hand Watch", @"itemImg" : @"tmp3.jpg", @"sellerName" : @"Washyl Yeluk"} mutableCopy],
                     ] mutableCopy];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayChat.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatTableViewCell *cell = (ChatTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ChatTableViewCell"];
    cell.imgCover.image = [UIImage imageNamed:[[arrayChat objectAtIndex:indexPath.row] valueForKey:@"sellerImg"]];
    cell.imgUser.image = [UIImage imageNamed:[[arrayChat objectAtIndex:indexPath.row] valueForKey:@"sellerImg"]];
    cell.imgItem.image = [UIImage imageNamed:[[arrayChat objectAtIndex:indexPath.row] valueForKey:@"itemImg"]];
    cell.lblItemName.text = [[arrayChat objectAtIndex:indexPath.row] valueForKey:@"itemName"];
    cell.lblSellerName.text = [[arrayChat objectAtIndex:indexPath.row] valueForKey:@"sellerName"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.table_view deselectRowAtIndexPath:indexPath animated:NO];
    selected_item = (int)indexPath.row;
    [self performSegueWithIdentifier:@"show_next" sender:self];
}


@end
