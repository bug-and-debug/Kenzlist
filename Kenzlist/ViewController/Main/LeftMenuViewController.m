//
//  LeftMenuViewController.m
//  GLXY
//
//  Created by Yellowinterface on 11/5/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "LeftMenuViewController.h"

@implementation LeftMenuViewController{
    int selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    selected = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)btnSubItemClick:(id)sender {
//    int last_select = selected;
    selected = (int)[sender tag] - 100;
//    if(last_select == selected)
//        return;
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    switch (selected) {
        case 0:
            [navigationController popToRootViewControllerAnimated:YES];
            break;
        case 1:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ChatNav"] animated:NO completion:nil];
            break;
        case 2:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"MyItemNavigation"] animated:NO completion:nil];
            break;
        case 3:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LikeNav"] animated:NO completion:nil];
            break;
        case 4:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"MaybeNav"] animated:NO completion:nil];
            break;
        case 5:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"] animated:NO completion:nil];
            break;
        case 6:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ContactViewController"] animated:NO completion:nil];
            break;
        case 7:
            [self.menuContainerViewController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"] animated:NO completion:nil];
            break;
        case 8:
            [self Logout];
            break;
    }
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed completion:^{}];
}

-(void) Logout{
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstNav"];
}

@end
