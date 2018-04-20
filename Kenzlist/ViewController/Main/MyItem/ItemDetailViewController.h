//
//  ItemDetailViewController.h
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ItemDetailViewController : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIActionSheetDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgItem;
@property (weak, nonatomic) IBOutlet UITextField *txtItemName;
@property (weak, nonatomic) IBOutlet UITextField *txtPrice;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
@property (weak, nonatomic) IBOutlet UIButton *btnCategory;

- (IBAction)btnSaveClick:(id)sender;
- (IBAction)btnUpdatePhotoClick:(id)sender;
- (IBAction)btnDeleteClick:(id)sender;
- (IBAction)btnCategoryClick:(id)sender;
- (void) initData:(int) _itemID _itemPhotoUrl : (NSString*) _itemPhotoUrl _itemName:(NSString*)_itemName _itemPrice:(NSString*)_itemPrice _itemDescription:(NSString*)_itemDescription;
@end
