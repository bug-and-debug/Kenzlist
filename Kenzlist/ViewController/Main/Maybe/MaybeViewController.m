//
//  MyItemViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "MaybeViewController.h"


@implementation MaybeViewController{
    int selected_item;
    NSArray* arrayItem;
}

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
    self.lblNoData.text = @"Loading...";
    self.viewItem.hidden = YES;
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

-(void) viewDidAppear:(BOOL)animated{
    [self getItems];
}



-(void) getItems{
    arrayItem = [@[
                   [@{@"itemName" : @"Mac Book Pro", @"itemImg" : @"tmp.jpg"} mutableCopy],
                   [@{@"itemName" : @"Motocycle", @"itemImg" : @"tmp2.jpg"} mutableCopy],
                   [@{@"itemName" : @"Hand Watch", @"itemImg" : @"tmp3.jpg"} mutableCopy],
                   ] mutableCopy];
    selected_item = -1;
    [self performSelector:@selector(showNextItem) withObject:nil afterDelay:0.5];
}

- (IBAction)btnMayBeClick:(id)sender {
    [self hideKeyboard];
    [self mayBeProcess];
    [self showNextItem];
}

- (IBAction)btnDislikeClick:(id)sender {
    [self hideKeyboard];
    [self dislikeDelete];
    [self showNextItem];
}

- (IBAction)btnLikeClick:(id)sender {
    [self hideKeyboard];
    [self showNextItem];
    UIViewController *itemDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ChatDetailViewController"];
    [self.navigationController pushViewController:itemDetailViewController animated:YES];
}

-(void) mayBeProcess{
    // please implement that feature with backend
}

-(void) dislikeDelete{
    // please implement that feature with backend
}

-(void) showNextItem{
    selected_item++;
    if(selected_item==0){
        [self updateData];
        self.viewItem.hidden = NO;
    }
    else{
        CGRect orgframe = self.viewItem.frame;
        [UIView animateWithDuration:0.5 delay:0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             CGRect frame = self.viewItem.frame;
                             frame.origin.x -= frame.origin.x + frame.size.width;
                             frame.origin.y += 50 ;
                             //frame.size.height -= 200;
                             self.viewItem.frame = frame;
                         }
                         completion:^(BOOL finished){
                             
                             if(selected_item >= arrayItem.count){
                                 self.viewItem.hidden = YES;
                                 self.viewItem.frame = orgframe;
                                 self.lblNoData.text = @"No Data";
                             }
                             else{
                                 [self updateData];
                                 CGRect frame = orgframe;
                                 frame.origin.y = self.view.frame.size.height;
                                 self.viewItem.frame = frame;
                                 [UIView animateWithDuration:0.2 delay:0
                                                     options: UIViewAnimationOptionCurveEaseOut
                                                  animations:^{
                                                      self.viewItem.frame = orgframe;
                                                  }
                                                  completion:^(BOOL finished){
                                                      self.viewItem.frame = orgframe;
                                                  }];
                             }
                         }];
    }
    
}
- (void) updateData{
    self.imgItem.image = [UIImage imageNamed:[[arrayItem objectAtIndex:selected_item] valueForKey:@"itemImg"]];
    self.lblItemName.text = [[arrayItem objectAtIndex:selected_item] valueForKey:@"itemName"];
}
@end
