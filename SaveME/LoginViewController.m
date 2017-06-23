//
//  LoginViewController.m
//  SaveME
//
//  Created by qingguo xu on 6/21/17.
//  Copyright © 2017 qingguo xu. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

#define screenWidth   [[UIScreen mainScreen] bounds].size.width
#define screenHeight  [[UIScreen mainScreen] bounds].size.height

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize labPassword,labUsername,loginBtn,registerBtn,txtPassword,txtUsername,myScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initComponents];
    
    
}

-(void) initComponents{
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    // self.automaticallyAdjustsScrollViewInsets = NO;
    
    myScrollView.delegate = self;
    myScrollView.pagingEnabled = NO;
    myScrollView.showsVerticalScrollIndicator = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.contentSize = CGSizeMake(myScrollView.frame.size.width, 1.8 * myScrollView.frame.size.height);
    
    labUsername = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.15 * screenHeight, 0.3 * screenWidth, 0.06 * screenHeight)];
    labPassword = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.3 * screenHeight, 0.35 * screenWidth, 0.06 * screenHeight)];
    
    labUsername.text = @"Username";
    labUsername.font = [UIFont systemFontOfSize:17];
    
    labPassword.text = @"Password";
    labPassword.font = [UIFont systemFontOfSize:17];
    
    
    txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.15 * screenHeight,0.6*screenWidth, 0.06 * screenHeight)];
    txtUsername.borderStyle = UITextBorderStyleRoundedRect;
    txtUsername.font = [UIFont systemFontOfSize:15];
    txtUsername.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtUsername.autocorrectionType = UITextAutocorrectionTypeNo;
    txtUsername.keyboardType = UIKeyboardTypeDefault;
    txtUsername.returnKeyType = UIReturnKeyDone;
    txtUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtUsername.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtUsername.delegate = self;
    
    txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.3 * screenHeight,0.6*screenWidth, 0.06 * screenHeight)];
    txtPassword.secureTextEntry = YES;
    txtPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtPassword.font = [UIFont systemFontOfSize:15];
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPassword.keyboardType = UIKeyboardTypeDefault;
    txtPassword.returnKeyType = UIReturnKeyDone;
    txtPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassword.delegate = self;
    
    txtUsername.placeholder = @"Username";
    txtPassword.placeholder = @"Password";
    
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.3*screenWidth, 0.5*screenHeight, 0.4*screenWidth, 40)];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:17.0];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.3*screenWidth, 0.6*screenHeight, 0.4*screenWidth, 40)];
    [registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:17.0];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    registerBtn.backgroundColor = [UIColor orangeColor];
    [registerBtn addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [myScrollView addSubview:labUsername];
    [myScrollView addSubview:labPassword];
    [myScrollView addSubview:txtUsername];
    [myScrollView addSubview:txtPassword];
    [myScrollView addSubview:loginBtn];
    [myScrollView addSubview:registerBtn];
    
    [self.view addSubview:myScrollView];
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (IBAction)backgroundTapped:(id)sender {
    //NSLog(@"Background tapped.");
    [self.view endEditing:YES];

}


//login
- (void)loginClicked:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext * myContext = [appDelegate managedObjectContext];
    NSError * error;
    
    // Cache the logged in user's all the information to core data
    NSFetchRequest * myRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:myContext];
    [myRequest setEntity:entity];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(user_name == %@)",txtUsername.text];
    [myRequest setPredicate:pred];
    
    
    NSArray * fetchedObjects = [myContext executeFetchRequest:myRequest error:&error];
    if (!fetchedObjects) {
        NSLog(@"Error fetching Instagram objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    // check before insert
    if ([fetchedObjects count] == 0  ) { // no matches
        [self alertStatus:@"There is no this user name record." :@"Login failed!" :0];
    }
    else{
        
        NSManagedObject *matches = nil;
        matches = fetchedObjects[0];
        
        if ([[matches valueForKey:@"user_password"] isEqualToString: txtPassword.text]) {
            
            [matches setValue:@"1" forKey:@"isLogged"];
            if (![myContext save:&error]) {
                NSLog(@"Save failed");
            }
            
            [self performSegueWithIdentifier:@"toHome" sender:self];
            
        }
        else{
            [self alertStatus:@"The password is wrong." :@"Login failed!" :0];
        }
        
        
    }
    
}

//register
- (void)registerClicked:(id)sender {
    
    [self performSegueWithIdentifier:@"toRegister" sender:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
