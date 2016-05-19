//
//  SelectTruckViewController.m
//  TruckShare
//  Created by Indrajeet on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "SelectTruckViewController.h"

@interface SelectTruckViewController ()

@end

@implementation SelectTruckViewController

- (void)viewDidLoad
{
    scrPhotos.contentSize = CGSizeMake(scrPhotos.contentSize.width, 673.0);
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
    return true;
}




















#pragma mark ====ACTIONS====
- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (IBAction)btnPrevious:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)btnNext:(UIButton *)sender
{
    UIViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdTruckSizeController"];
    [self.navigationController pushViewController:vwContrller animated:true];
}



















- (void) defaultProperties
{
    for (int i=101; i<=106; i++)
    {
        UIImageView *imgTemp = (UIImageView *)[self.view viewWithTag:i];
        
        imgTemp.layer.masksToBounds = YES;
        imgTemp.layer.borderWidth = 1.0;
        imgTemp.layer.cornerRadius = 5.0;
        imgTemp.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    }
}


@end
