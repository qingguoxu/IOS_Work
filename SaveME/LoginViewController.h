//
//  LoginViewController.h
//  SaveME
//
//  Created by qingguo xu on 6/21/17.
//  Copyright © 2017 qingguo xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) UILabel * labUsername;
@property (strong, nonatomic) UILabel * labPassword;

@property (strong, nonatomic) UITextField *txtUsername;
@property (strong, nonatomic) UITextField *txtPassword;

@property (strong, nonatomic) UIButton * loginBtn;
@property (strong, nonatomic) UIButton * registerBtn;

@property (strong, nonatomic) UIScrollView *myScrollView;


@end
