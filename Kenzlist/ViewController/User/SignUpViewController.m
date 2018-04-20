//
//  SignUpViewController.m
//  GLXY
//
//  Created by Yellowinterface on 11/6/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "SignUpViewController.h"


@implementation SignUpViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSignupClickEvent:(id)sender {
    [self hideKeyboard];
    [self showMainNavigation];
}

- (IBAction)btnLoginClickEvent:(id)sender {
    [self hideKeyboard];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
