//
//  ChatDetailViewController.h
//  Kenzlist
//
//  Created by Yellowinterface on 12/13/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ChatDetailViewController : BaseViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgSeller;
@property (weak, nonatomic) IBOutlet UILabel *lblSellerName;
@property (weak, nonatomic) IBOutlet UIImageView *imgItem;
@property (weak, nonatomic) IBOutlet UILabel *lblItemName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblMyProposal;
@property (weak, nonatomic) IBOutlet UITextView *lblItemDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtChat;
@property (weak, nonatomic) IBOutlet UITableView *table_view;

- (IBAction)btnGotoItemDetail:(id)sender;
- (IBAction)btnSendMsgClick:(id)sender;
@end
