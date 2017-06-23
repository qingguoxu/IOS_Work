//
//  RegisterViewController.m
//  SaveME
//
//  Created by qingguo xu on 6/21/17.
//  Copyright © 2017 qingguo xu. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"

#define screenWidth   [[UIScreen mainScreen] bounds].size.width
#define screenHeight  [[UIScreen mainScreen] bounds].size.height

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize labPassword,labUsername,labLastName,labFirstName,labPassword2,labPhoneNumber,labContactLastName,labContactFirstName,txtPassword,txtUsername,txtLastName,txtFirstName,txtPassword2,txtPhoneNumber,txtContactLastName,txtContactFirstName,backBtn,doneBtn,registerBtn,myScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initComponents];
    
}

-(void)initComponents{
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    // self.automaticallyAdjustsScrollViewInsets = NO;
    
    myScrollView.delegate = self;
    myScrollView.pagingEnabled = NO;
    myScrollView.showsVerticalScrollIndicator = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.contentSize = CGSizeMake(myScrollView.frame.size.width, 1.8 * myScrollView.frame.size.height);
    
    labUsername = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.1 * screenHeight, 0.3 * screenWidth, 0.06 * screenHeight)];
    labPassword = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.185 * screenHeight, 0.3 * screenWidth, 0.06 * screenHeight)];
    labPassword2 = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.275 * screenHeight, 0.3 * screenWidth, 0.06 * screenHeight)];
    labFirstName = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.362 * screenHeight, 0.3 * screenWidth, 0.06 * screenHeight)];
    labLastName = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.44 * screenHeight, 0.8 * screenWidth, 0.06 * screenHeight)];
    labContactFirstName = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.57 * screenHeight, 0.7 * screenWidth, 0.06 * screenHeight)];
    labContactLastName = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.73 * screenHeight, 0.7 * screenWidth, 0.06 * screenHeight)];
    labPhoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(0.02 * screenWidth, 0.88 * screenHeight, 0.2 * screenWidth, 0.06 * screenHeight)];
    
    
    labUsername.text = @"Username";
    labPassword.text = @"Password";
    labPassword2.text = @"Password";
    labFirstName.text = @"First Name";
    labLastName.text = @"Last Name";
    labContactFirstName.text = @"Contact first name";
    labContactLastName.text = @"Contact last name";
    labPhoneNumber.text = @"Phone #";


    txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.1 * screenHeight,0.5*screenWidth, 0.06 * screenHeight)];
    txtUsername.borderStyle = UITextBorderStyleRoundedRect;
    txtUsername.font = [UIFont systemFontOfSize:15];
    txtUsername.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtUsername.autocorrectionType = UITextAutocorrectionTypeNo;
    txtUsername.keyboardType = UIKeyboardTypeDefault;
    txtUsername.returnKeyType = UIReturnKeyDone;
    txtUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtUsername.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtUsername.delegate = self;
    
    txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.18 * screenHeight,0.5*screenWidth, 0.06 * screenHeight)];
    txtPassword.secureTextEntry = YES;
    txtPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtPassword.font = [UIFont systemFontOfSize:15];
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPassword.keyboardType = UIKeyboardTypeDefault;
    txtPassword.returnKeyType = UIReturnKeyDone;
    txtPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassword.delegate = self;
    
    txtPassword2 = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.27 * screenHeight,0.5*screenWidth, 0.06 * screenHeight)];
    txtPassword2.secureTextEntry = YES;
    txtPassword2.borderStyle = UITextBorderStyleRoundedRect;
    txtPassword2.font = [UIFont systemFontOfSize:15];
    txtPassword2.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPassword2.keyboardType = UIKeyboardTypeDefault;
    txtPassword2.returnKeyType = UIReturnKeyDone;
    txtPassword2.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassword2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassword2.delegate = self;
    
    txtFirstName = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.36 * screenHeight,0.5*screenWidth, 0.06 * screenHeight)];
    txtFirstName.borderStyle = UITextBorderStyleRoundedRect;
    txtFirstName.font = [UIFont systemFontOfSize:15];
    txtFirstName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtFirstName.keyboardType = UIKeyboardTypeDefault;
    txtFirstName.returnKeyType = UIReturnKeyDone;
    txtFirstName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtFirstName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtFirstName.delegate = self;
    
    txtLastName = [[UITextField alloc] initWithFrame:CGRectMake(0.35 * screenWidth, 0.45 * screenHeight,0.5*screenWidth, 0.06 * screenHeight)];
    txtLastName.borderStyle = UITextBorderStyleRoundedRect;
    txtLastName.font = [UIFont systemFontOfSize:15];
    txtLastName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtLastName.keyboardType = UIKeyboardTypeDefault;
    txtLastName.returnKeyType = UIReturnKeyDone;
    txtLastName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtLastName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtLastName.delegate = self;
    
    
    txtContactFirstName = [[UITextField alloc] initWithFrame:CGRectMake(0.1 * screenWidth, 0.64 * screenHeight,0.75*screenWidth, 0.06 * screenHeight)];
    txtContactFirstName.borderStyle = UITextBorderStyleRoundedRect;
    txtContactFirstName.font = [UIFont systemFontOfSize:15];
    txtContactFirstName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtContactFirstName.keyboardType = UIKeyboardTypeDefault;
    txtContactFirstName.returnKeyType = UIReturnKeyDone;
    txtContactFirstName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtContactFirstName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtContactFirstName.delegate = self;
    
    txtContactLastName = [[UITextField alloc] initWithFrame:CGRectMake(0.1 * screenWidth, 0.80 * screenHeight,0.75*screenWidth, 0.06 * screenHeight)];
    txtContactLastName.borderStyle = UITextBorderStyleRoundedRect;
    txtContactLastName.font = [UIFont systemFontOfSize:15];
    txtContactLastName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtContactLastName.keyboardType = UIKeyboardTypeDefault;
    txtContactLastName.returnKeyType = UIReturnKeyDone;
    txtContactLastName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtContactLastName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtContactLastName.delegate = self;
    
    txtPhoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(0.1 * screenWidth, 0.95 * screenHeight,0.75*screenWidth, 0.05 * screenHeight)];
    txtPhoneNumber.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtPhoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    txtPhoneNumber.font = [UIFont systemFontOfSize:15];
    txtPhoneNumber.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPhoneNumber.keyboardType = UIKeyboardTypeDefault;
    txtPhoneNumber.returnKeyType = UIReturnKeyDone;
    txtPhoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPhoneNumber.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPhoneNumber.delegate = self;
    
    txtUsername.placeholder = @"username";
    txtPassword.placeholder = @"password";
    txtPassword2.placeholder = @"password confirm";
    txtFirstName.placeholder = @"first name";
    txtLastName.placeholder = @"last name";
    txtContactFirstName.placeholder = @"Contact first name";
    txtContactLastName.placeholder = @"Contact last name";
    txtPhoneNumber.placeholder = @"phone number";
    
    backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.02*screenWidth, 0.02*screenHeight, 60, 40)];
    doneBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-70, 0.02*screenHeight, 60, 40)];
    registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.3*screenWidth, 1.0*screenHeight, 120, 40)];
    
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:20.0];
    [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal ];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(cancelRegister:) forControlEvents:UIControlEventTouchUpInside];
    
    [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    doneBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:20.0];
    [doneBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal ];
    doneBtn.backgroundColor = [UIColor clearColor];
    [doneBtn addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:20.0];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    registerBtn.backgroundColor = [UIColor blueColor];
    [registerBtn addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [myScrollView addSubview:labUsername];
    [myScrollView addSubview:labPassword];
    [myScrollView addSubview:labPassword2];
    [myScrollView addSubview:labFirstName];
    [myScrollView addSubview:labLastName];
    [myScrollView addSubview:labContactFirstName];
    [myScrollView addSubview:labContactLastName];
    [myScrollView addSubview:labPhoneNumber];
    
    [myScrollView addSubview:txtUsername];
    [myScrollView addSubview:txtPassword];
    [myScrollView addSubview:txtPassword2];
    [myScrollView addSubview:txtFirstName];
    [myScrollView addSubview:txtLastName];
    [myScrollView addSubview:txtContactFirstName];
    [myScrollView addSubview:txtContactLastName];
    [myScrollView addSubview:txtPhoneNumber];
    
    [myScrollView addSubview:backBtn];
    [myScrollView addSubview:doneBtn];
    [myScrollView addSubview:registerBtn];
    
    [self.view addSubview:myScrollView];

    
}


- (IBAction)backgroundTapped:(id)sender {

    [self.view endEditing:YES];
    
}


//back btn
-(void)cancelRegister:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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

//done & register btn
-(void)registerClicked:(id)sender{
    
    @try {
        
        if ( [[txtUsername text] isEqualToString:@""] || [[txtPassword text] isEqualToString:@""] || [[txtPassword2 text] isEqualToString:@""] || [[txtFirstName text] isEqualToString:@""] || [[txtLastName text] isEqualToString:@""] || [[txtContactFirstName text] isEqualToString:@""] || [[txtContactLastName text] isEqualToString:@""] ||[[txtPhoneNumber text] isEqualToString:@""]
            )
        {
            [self alertStatus:@"Only middle name is optional. " :@"Register failed!" :0];
        }
        
        else if( ![[txtPassword text] isEqualToString: [txtPassword2 text]] )
        {
            [self alertStatus:@"Passwords are not consistent. " :@"Register failed!" :0];
        }
        
        else { // check all the fields
            
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
                
                NSManagedObject * userEnity = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext: myContext];
                
                [userEnity setValue:txtUsername.text forKey:@"user_name"];
                [userEnity setValue:txtPassword.text forKey:@"user_password"];
                [userEnity setValue:@"1" forKey:@"isLogged"];
                [userEnity setValue:txtFirstName.text forKey:@"user_firstname"];
                [userEnity setValue:txtLastName.text forKey:@"user_lastname"];
                [userEnity setValue:txtContactFirstName.text forKey:@"contact_firstname"];
                [userEnity setValue:txtContactLastName.text forKey:@"contact_lastname"];
                [userEnity setValue:txtPhoneNumber.text forKey:@"contact_number"];
                
                
                if (![myContext save:&error]) {
                    NSLog(@"Save failed");
                }
                
            }
            else
            {
                
                [self alertStatus:@"User name already exists, try again." :@"Register failed!" :0];
                
//                NSManagedObject *matches = nil;
//                matches = fetchedObjects[0];
//                [matches setValue:@"1" forKey:@"isLogged"];
//                if (![myContext save:&error]) {
//                    NSLog(@"Save failed");
//                }
                
            }
            
            
            [self performSegueWithIdentifier:@"register_success" sender:self];

            
            
        }
        
        
    }
    @catch (NSException * e)
    {
        
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Register Failed." :@"Error!" :0];
        
    }

    
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
