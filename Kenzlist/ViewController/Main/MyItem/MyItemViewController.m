//
//  MyItemViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "MyItemViewController.h"

@implementation MyItemViewController{
    int selected_item;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{    
    [self.table_view deselectRowAtIndexPath:indexPath animated:NO];
    selected_item = (int)indexPath.row;
    [self performSegueWithIdentifier:@"showDetailItem" sender:self];
}

- (IBAction)btnAddItemClick:(id)sender {
    selected_item = -1;
    [self performSegueWithIdentifier:@"showDetailItem" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetailItem"]) {
        if(selected_item == -1)
            [[segue destinationViewController] initData:-1 _itemPhotoUrl : @"" _itemName:@"" _itemPrice:@"" _itemDescription:@""];
        else
            [[segue destinationViewController] initData:selected_item _itemPhotoUrl : @"" _itemName:@"Mac Book Pro" _itemPrice:@"1500" _itemDescription:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."];
    }
}
@end
