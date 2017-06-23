//
//  RegisterViewController.h
//  SaveME
//
//  Created by qingguo xu on 6/21/17.
//  Copyright © 2017 qingguo xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (strong, nonatomic)  UITextField *txtUsername;
@property (strong, nonatomic)  UITextField *txtPassword;
@property (strong, nonatomic)  UITextField *txtPassword2;
@property (strong, nonatomic)  UITextField *txtFirstName;
@property (strong, nonatomic)  UITextField *txtLastName;
@property (strong, nonatomic)  UITextField *txtContactFirstName;
@property (strong, nonatomic)  UITextField *txtContactLastName;
@property (strong, nonatomic)  UITextField *txtPhoneNumber;


@property (strong, nonatomic) UILabel * labUsername;
@property (strong, nonatomic) UILabel * labPassword;
@property (strong, nonatomic) UILabel * labPassword2;
@property (strong, nonatomic) UILabel * labFirstName;
@property (strong, nonatomic) UILabel * labLastName;
@property (strong, nonatomic) UILabel * labContactFirstName;
@property (strong, nonatomic) UILabel * labContactLastName;
@property (strong, nonatomic) UILabel * labPhoneNumber;

@property (strong, nonatomic) UIButton * backBtn;
@property (strong, nonatomic) UIButton * doneBtn;
@property (strong, nonatomic) UIButton * registerBtn;

@property (strong, nonatomic) UIScrollView *myScrollView;


@end
