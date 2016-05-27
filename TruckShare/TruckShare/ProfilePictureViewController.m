//
//  ProfilePictureViewController.m
//  TruckShare
//
//  Created by Apple on 16/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "ProfilePictureViewController.h"
#import "BackgroundCheckInfoViewController.h"
#import "configuration.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface ProfilePictureViewController ()
{
    AppDelegate *appDelegate;
}
@end

@implementation ProfilePictureViewController
@synthesize dictRegisDetails;

- (void)viewDidLoad
{
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    dictRegisDetailsTemp = [[NSMutableDictionary alloc] initWithDictionary:dictRegisDetails];
    [self defaultProperties];
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"dict: %@",dictRegisDetails);
}


- (BOOL)prefersStatusBarHidden
{
    return true;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



















#pragma mark =======DELEGATE METHODS=========

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    imgProfile1.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}



















#pragma mark =======ACTIONS=========

- (IBAction)btnNext: (UIButton *)sender
{
    if (imgProfile1.image != nil)
    {
        NSData *profilePicData = UIImagePNGRepresentation(imgProfile1.image);
        NSString *strEncodedImage = [profilePicData base64EncodedStringWithOptions:0];
        
        NSDictionary *dictTemp = @{kProfileImageBase64String: strEncodedImage,
                                   kProfileImageFormat: @"png"};
        [dictRegisDetailsTemp setObject:dictTemp forKey:@"profilePic"];
        
        BackgroundCheckInfoViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdBackgroundCheckInfo"];
        vwContrller.dictRegisDetails = dictRegisDetailsTemp;
        [self.navigationController pushViewController:vwContrller animated:true];
    }
    else
    {
        [appDelegate showAlert:@"Please select image." viewController:self];
    }
}


- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}


- (IBAction)btnPrevious:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)btnCapture:(UIButton *)sender
{
    UIAlertController *actionsheet = [UIAlertController alertControllerWithTitle:@"Truck Share" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    
    imgPicker.delegate = self;
    
    UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imgPicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imgPicker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [actionsheet addAction:galleryAction];
    [actionsheet addAction:cameraAction];
    [actionsheet addAction:cancelAction];
    
    [self presentViewController:actionsheet animated:YES completion:nil];
}



















#pragma mark =====USER DEFINE METHODS=======
- (void)defaultProperties
{
    imgProfile1.layer.masksToBounds = YES;
    imgProfile1.layer.borderWidth = 1.0;
    imgProfile1.layer.cornerRadius = 5.0;
    imgProfile1.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
}

@end
