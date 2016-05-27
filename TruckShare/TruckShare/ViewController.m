//
//  ViewController.m
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.


#import "ViewController.h"
#import "HomeViewController.h"
#import "configuration.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface ViewController ()
{
    AppDelegate *appDelegate;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [super viewDidLoad];
    [self prefersStatusBarHidden];
}


- (void)viewWillAppear:(BOOL)animated
{
//    txtUsername.text = @"";
//    txtPassword.text = @"";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}











#pragma mark ==DELEGATE METHODS==
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}














#pragma mark==ACTIONS==
- (IBAction)btnLogin:(UIButton *)sender
{
    if ([self validation])
    {
        [self loginUser];
    }
    else
    {
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:@"Username and password should not be blank." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}


- (IBAction)btnForgotPassword:(UIButton *)sender;
{
    
}


- (IBAction)btnRegister:(UIButton *)sender
{
    
}










#pragma mark==USER DEFINE METHODS==
- (BOOL)validation
{
    if (txtUsername.text.length == 0)
    {
        return NO;
    }
    else if (txtPassword.text.length == 0)
    {
        return NO;
    }
    
    return YES;
}


- (void)loginUser
{
    NSString *strUrl = [NSString stringWithFormat:@"%@appUser/IsValidUser",kBaseUrl];
    NSDictionary *dictPara = @{kUserName: txtUsername.text,
                               kPassword: txtPassword.text};
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
    [manager POST:strUrl parameters:dictPara progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        NSLog(@"%@",responseObject);

        if ([[responseObject valueForKey:@"result"] boolValue])
        {
            [kPref setObject:txtUsername.text forKey:kUserName];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HomeViewController *homeController = [storyboard instantiateViewControllerWithIdentifier:@"homeStoryId"];
            [UIApplication sharedApplication].keyWindow.rootViewController = homeController;
        }
        else
        {
            [appDelegate showAlert:@"Invalid username or password." viewController:self];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        NSLog(@"Error: %@",error);
    }];
    

}



@end
