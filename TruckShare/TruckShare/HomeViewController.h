//
//  HomeViewController.h
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UIView *vwSideBar;
    
    NSArray *arrMenuItems;
}

- (IBAction)btnShowsideBar:(UIButton *)sender;

- (void)defaultProperties;
@end
