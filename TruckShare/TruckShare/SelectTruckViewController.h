//
//  SelectTruckViewController.h
//  TruckShare
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTruckViewController : UIViewController
{
    IBOutlet UIScrollView *scrPhotos;
}

- (IBAction)btnBack:(UIButton *)sender;
- (IBAction)btnPrevious:(UIButton *)sender;
- (IBAction)btnNext:(UIButton *)sender;


@end
