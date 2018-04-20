//
//  SignUpViewController.h
//  GLXY
//
//  Created by Yellowinterface on 11/6/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SignUpViewController : BaseViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)btnSignupClickEvent:(id)sender;
- (IBAction)btnLoginClickEvent:(id)sender;

@end
