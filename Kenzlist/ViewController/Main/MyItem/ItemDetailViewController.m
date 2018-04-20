//
//  ItemDetailViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "RightMenuViewController.h"

@implementation ItemDetailViewController{
    int itemID;
    NSString* itemPhotoUrl;
    NSString* itemName;
    NSString* itemPrice;
    NSString* itemDescription;
    UIActionSheet *actionsheet_photo;
    UIImagePickerController * img_picker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(itemID==-1){
        self.btnDelete.hidden = YES;
        self.lblTitle.text = @"Add My Item";
    }
    else{
        self.txtItemName.text = itemName;
        self.txtPrice.text = itemPrice;
        self.txtDescription.text = itemDescription;
        //[self.imgItem sd_setImageWithURL:[NSURL URLWithString:itemPhotoUrl]];
        [self.imgItem setImage:[UIImage imageNamed:@"tmp.jpg"]];
        self.lblTitle.text = @"Update My Item";
    }
    img_picker = [[UIImagePickerController alloc] init];
    img_picker.delegate = self;
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


- (IBAction)btnSaveClick:(id)sender {
    [self hideKeyboard];
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)btnDeleteClick:(id)sender {
    [self hideKeyboard];
}

- (IBAction)btnCategoryClick:(id)sender {
    [self hideKeyboard];
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    RightMenuViewController *rightSideMenuViewController = (RightMenuViewController*)window.rootViewController.menuContainerViewController.rightMenuViewController;
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Please select Category" message:nil preferredStyle:UIAlertControllerStyleAlert];
    for(int i=1; i < rightSideMenuViewController.arrayCategories.count; i++){
        UIAlertAction *categoryAction=[UIAlertAction actionWithTitle:[rightSideMenuViewController.arrayCategories objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.btnCategory setTitle:[rightSideMenuViewController.arrayCategories objectAtIndex:i] forState:UIControlStateNormal];
        }];
        [alertController addAction:categoryAction];
    }
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:YES completion:nil];

}


- (IBAction)btnUpdatePhotoClick:(id)sender {
    [self hideKeyboard];
    actionsheet_photo = [[UIActionSheet alloc] initWithTitle:@"Add photo"
                                                    delegate:self
                                           cancelButtonTitle:nil
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"Choose From Library", @"Take Photo",nil];
    
    
    actionsheet_photo.cancelButtonIndex = [actionsheet_photo addButtonWithTitle:@"Cancel"];
    [actionsheet_photo setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [actionsheet_photo showInView:[[UIApplication sharedApplication] keyWindow]];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet == actionsheet_photo)
    {
        switch (buttonIndex) {
            case 0:
                [self on_handle_gallery];
                break;
            case 1:
                [self on_handle_camera ];
                break;
            default:
                break;
        }
    }
}

- (void) on_handle_gallery{
    @try
    {
        img_picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        img_picker.delegate = self;
        img_picker.allowsEditing = YES;
        
        [self presentViewController:img_picker animated:YES completion:nil];
    }
    @catch (NSException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Gallery is not available" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void) on_handle_camera{
    @try
    {
        img_picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        img_picker.delegate = self;
        img_picker.allowsEditing = YES;
        img_picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModePhoto;
        
        [self presentViewController:img_picker animated:YES completion:nil];
    }
    @catch (NSException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Camera is not available" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

# pragma mark Image Picker Delegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.imgItem.image=[info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) initData:(int) _itemID _itemPhotoUrl : (NSString*) _itemPhotoUrl _itemName:(NSString*)_itemName _itemPrice:(NSString*)_itemPrice _itemDescription:(NSString*)_itemDescription{
    itemID = _itemID;
    itemPhotoUrl = _itemPhotoUrl;
    itemName = _itemName;
    itemPrice = _itemPrice;
    itemDescription = _itemDescription;
}
@end
