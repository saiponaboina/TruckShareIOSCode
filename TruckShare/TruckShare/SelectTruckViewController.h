//
//  SelectTruckViewController.h
//  TruckShare
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTruckViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIScrollView *scrPhotos;
    IBOutlet UIButton *btnNextOutlet;
    UIImagePickerController *imgPicker;

    NSMutableDictionary *dictRegisDetailsTemp;
    int selectedSource;
}

@property (nonatomic, retain) NSMutableDictionary *dictRegisDetails;

- (IBAction)btnBack:(UIButton *)sender;
- (IBAction)btnPrevious:(UIButton *)sender;
- (IBAction)btnNext:(UIButton *)sender;
- (IBAction)btnCapture:(UIButton *)sender;
- (IBAction)btnUpload:(UIButton *)sender;


@end
