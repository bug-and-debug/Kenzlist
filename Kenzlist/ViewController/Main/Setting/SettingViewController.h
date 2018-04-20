//
//  MyItemViewController.h
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface SettingViewController : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;

- (IBAction)btnUpdatePhotoClick:(id)sender;
@end
