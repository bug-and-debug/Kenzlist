//
//  BaseViewController.h
//  GLXY
//
//  Created by Yellowinterface on 11/5/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "MFSideMenu.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

- (IBAction)btnLeftMenuClick:(id)sender;
- (IBAction)btnRightMenuClick:(id)sender;
- (IBAction)btnMainBackClick:(id)sender;
- (IBAction)btnMenuBackClick:(id)sender;
- (void) gotoMainViewController;
- (void) gotoBackViewController;
- (void) showMainNavigation;

@end
