//
//  ProfilePictureViewController.h
//  TruckShare
//
//  Created by Apple on 16/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfilePictureViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView *imgProfile1;
    NSMutableDictionary *dictRegisDetailsTemp;
}

@property (nonatomic, retain) NSMutableDictionary *dictRegisDetails;

@end
