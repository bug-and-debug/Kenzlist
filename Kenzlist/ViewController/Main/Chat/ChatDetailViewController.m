//
//  ChatDetailViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/13/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "ChatDetailViewController.h"
#import "IncomingTableViewCell.h"
#import "OutComingTableViewCell.h"

@implementation ChatDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    singleTap.delegate=self;
    [self.view addGestureRecognizer:singleTap];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
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
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    self.view.frame = frame;
    [UIView commitAnimations];
    [self.view endEditing:YES];
}
/////////////KeyBoard////////////
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self deregisterForKeyboardNotifications];
}

- (void)dealloc {
    [self deregisterForKeyboardNotifications];
}

- (void)deregisterForKeyboardNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)notif{
    int keyboard_height = [[notif.userInfo objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    CGRect frame = self.view.frame;
    frame.origin.y = -keyboard_height;
    self.view.frame = frame;
    [UIView commitAnimations];
}
/////////////////////

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row%2 ==1){
        IncomingTableViewCell *cell = (IncomingTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"IncomingTableViewCell"];
        return cell;
    }
    else{
        OutComingTableViewCell *cell = (OutComingTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"OutComingTableViewCell"];
        return cell;
    }
}

- (IBAction)btnGotoItemDetail:(id)sender {
    [self hideKeyboard];
    UIViewController *itemDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LikeItemDetailViewController"];
    [self.navigationController pushViewController:itemDetailViewController animated:YES];
}

- (IBAction)btnSendMsgClick:(id)sender {
}
@end
