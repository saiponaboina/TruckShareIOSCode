//
//  HomeViewController.m
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.
//

#import "HomeViewController.h"
#import "configuration.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    arrMenuItems = [[NSArray alloc] initWithObjects:@"Home",@"Request",@"Credit Info", @"Profile", @"Logout", nil];
    [self prefersStatusBarHidden];
    [self defaultProperties];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}



















#pragma mark ====DELEGATE METHODS====
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrMenuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [arrMenuItems objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==4)
    {
        [kPref setObject:nil forKey:kUserName];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"loginStoryId"];
        [UIApplication sharedApplication].keyWindow.rootViewController = loginController;
    }
}











#pragma mark==ACTIONS==
- (IBAction)btnShowsideBar:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect tempFrame = vwSideBar.frame;
            tempFrame.origin.x = 0.0;
            vwSideBar.frame = tempFrame;

        } completion:nil];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{

            CGRect tempFrame = vwSideBar.frame;
            tempFrame.origin.x = -[UIScreen mainScreen].bounds.size.width;
            vwSideBar.frame = tempFrame;

        } completion:nil];

    }
}



















#pragma mark ====USER DEFINE METHODS====
- (void)defaultProperties
{
    CGRect tempFrame = vwSideBar.frame;
    tempFrame.origin.x = -[UIScreen mainScreen].bounds.size.width;
    vwSideBar.frame = tempFrame;
}

@end
