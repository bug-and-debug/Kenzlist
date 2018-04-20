//
//  HomeViewController.h
//  GLXY
//
//  Created by Yellowinterface on 11/5/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface HomeViewController : BaseViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblCategory;
@property (weak, nonatomic) IBOutlet UIView *viewItem;
@property (weak, nonatomic) IBOutlet UILabel *lblItemName;
@property (weak, nonatomic) IBOutlet UIImageView *imgItem;
@property (weak, nonatomic) IBOutlet UIButton *btnPrice;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtYourProposal;
@property (weak, nonatomic) IBOutlet UILabel *lblNoData;

- (IBAction)btnMayBeClick:(id)sender;
- (IBAction)btnDislikeClick:(id)sender;
- (IBAction)btnLikeClick:(id)sender;
@end
