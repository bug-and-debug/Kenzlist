//
//  MyItemViewController.m
//  Kenzlist
//
//  Created by Yellowinterface on 12/11/16.
//  Copyright © 2016 Alexsandr Ischenko. All rights reserved.
//

#import "SettingViewController.h"


@implementation SettingViewController{
    UIActionSheet *actionsheet_photo;
    UIImagePickerController * img_picker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    img_picker = [[UIImagePickerController alloc] init];
    img_picker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnUpdatePhotoClick:(id)sender {
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
    self.imgUser.image=[info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
