//
//  SplashViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self performSelector:@selector(splash_disappear_animation) withObject:nil afterDelay:2];
}

- (void) splash_disappear_animation{
    [self performSegueWithIdentifier:@"show_next" sender:self];
}

@end
