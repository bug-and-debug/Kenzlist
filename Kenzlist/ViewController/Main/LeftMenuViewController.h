//
//  LeftMenuViewController.h
//  GLXY
//
//  Created by Yellowinterface on 11/5/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"

@interface LeftMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgUserPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblUserCountry;
- (IBAction)btnSubItemClick:(id)sender;

@end
