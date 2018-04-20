//
//  RightMenuViewController.h
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"

@interface RightMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@property (nonatomic) NSArray* arrayCategories;

@end
