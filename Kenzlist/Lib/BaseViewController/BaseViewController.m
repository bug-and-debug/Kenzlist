//
//  BaseViewController.m
//  GLXY
//
//  Created by Yellowinterface on 11/5/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "BaseViewController.h"
#import "RightMenuViewController.h"

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btnLeftMenu = [self.view viewWithTag:1000];
    [btnLeftMenu addTarget:self action:@selector(btnLeftMenuClick:) forControlEvents:UIControlEventTouchUpInside];
    _lblTitle = [self.view viewWithTag:1001];
    UIButton *btnRightMenu = [self.view viewWithTag:1002];
    [btnRightMenu addTarget:self action:@selector(btnRightMenuClick:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *btnBack = [self.view viewWithTag:2000];
    [btnBack addTarget:self action:@selector(btnMenuBackClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btnMainBack = [self.view viewWithTag:3000];
    [btnMainBack addTarget:self action:@selector(btnMainBackClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (IBAction)btnMainBackClick:(id)sender{
    [self gotoMainViewController];
}

- (IBAction)btnMenuBackClick:(id)sender{
    [self gotoBackViewController];
}

- (IBAction)btnLeftMenuClick:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}

- (IBAction)btnRightMenuClick:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:^{}];
}

- (void) showMainNavigation{
    MFSideMenuContainerViewController * container = (MFSideMenuContainerViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
    
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavigation"];
    
    UIViewController *leftSideMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftSideMenuViewController"];
    RightMenuViewController *rightSideMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuViewController"];
    
    
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setLeftMenuWidth:self.view.frame.size.width*0.72];
    [container setRightMenuViewController:rightSideMenuViewController];
    [container setRightMenuWidth:180];
    [container setCenterViewController:navigationController];
    
    
    [container.shadow setRadius:5.0f];
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = container;
}

- (void) gotoMainViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void) gotoBackViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
