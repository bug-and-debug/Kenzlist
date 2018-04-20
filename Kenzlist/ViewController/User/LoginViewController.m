//
//  LoginViewController.m
//  GLXY
//
//  Created by Yellowinterface on 11/5/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    singleTap.delegate=self;
    [self.view addGestureRecognizer:singleTap];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ( [gestureRecognizer class] != [UIPanGestureRecognizer class] ) {
    }
    return YES;
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    [self hideKeyboard];
}



- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self hideKeyboard];
    return YES;
}

-(void)hideKeyboard{
    [self.view endEditing:YES];
}

- (IBAction)btnLoginClickEvent:(id)sender {
    [self hideKeyboard];
    [self showMainNavigation];
}
@end
