//
//  AppDelegate.h
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (BOOL) isTheStringDate: (NSString*) theString dateFormat: (NSString *)formatOfDate;
- (void)showAlert :(NSString *)strMessage viewController: (UIViewController *)presentInController;
@end

