//
//  ViewController.m
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.


#import "ViewController.h"
#import "HomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prefersStatusBarHidden];
}


- (void)viewWillAppear:(BOOL)animated
{
    txtUsername.text = @"";
    txtPassword.text = @"";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}











#pragma mark==ACTIONS==
- (IBAction)btnLogin:(UIButton *)sender
{
    if ([self validation])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController *homeController = [storyboard instantiateViewControllerWithIdentifier:@"homeStoryId"];
        [self.navigationController pushViewController:homeController animated:YES];
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


- (void)alertMethod : (NSString *)strMessage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    
}
@end
