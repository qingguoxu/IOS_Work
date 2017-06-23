//
//  HomeViewController.h
//  SaveME
//
//  Created by qingguo xu on 6/21/17.
//  Copyright © 2017 qingguo xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <CoreLocation/CoreLocation.h>

@interface HomeViewController : UIViewController <MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) UILabel * labUserNameLabel;
@property (strong, nonatomic) UILabel * labUserName;
@property (strong, nonatomic) UILabel * labContactName;

@property (strong, nonatomic) UILabel * labContactNumber;

@property (strong, nonatomic) UIButton * callBtn;
@property (strong, nonatomic) UIButton * logoutBtn;

@property (strong, nonatomic) CLLocationManager * locationManager;

@end
