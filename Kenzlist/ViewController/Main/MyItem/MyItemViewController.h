//
//  MyItemViewController.h
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ItemDetailViewController.h"
@interface MyItemViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *table_view;
- (IBAction)btnAddItemClick:(id)sender;

@end
