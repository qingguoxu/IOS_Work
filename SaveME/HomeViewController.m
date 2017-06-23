//
//  HomeViewController.m
//  SaveME
//
//  Created by qingguo xu on 6/21/17.
//  Copyright © 2017 qingguo xu. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"


#define screenWidth   [[UIScreen mainScreen] bounds].size.width
#define screenHeight  [[UIScreen mainScreen] bounds].size.height

@interface HomeViewController ()<CLLocationManagerDelegate>

@end




@implementation HomeViewController

NSString *user_name;
NSString *user_firstname;
NSString *user_lastname;
NSString *contact_firstname;
NSString *contact_lastname;
NSString *contact_number;
double longitude;
double latitude;

NSString * curLocation;

//NSString * country;
//NSString * state;
//NSString * city;
//NSString * street;
//NSString * zipcode;

@synthesize labUserName,labContactName,logoutBtn,callBtn, labContactNumber,locationManager,labUserNameLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    locationManager = [[CLLocationManager alloc] init] ;
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    
    [self getInfo];
    [self initcomponents];
    
}

-(void) initcomponents{
    
    labUserNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.1 * screenWidth, 0.15 * screenHeight, 0.3 * screenWidth, 0.1 * screenHeight)];
    labUserNameLabel.text = @"Welcome ";
    labUserNameLabel.font = [UIFont systemFontOfSize:20];
    
    labUserName = [[UILabel alloc] initWithFrame:CGRectMake(0.4 * screenWidth, 0.15 * screenHeight, 0.3 * screenWidth, 0.1 * screenHeight)];
    labUserName.text = user_firstname;
    labUserName.font = [UIFont systemFontOfSize:24];
    labUserName.textColor = [UIColor whiteColor];
    
    labContactName = [[UILabel alloc] initWithFrame:CGRectMake(0.05 * screenWidth, 0.25 * screenHeight, 0.8 * screenWidth, 0.1 * screenHeight)];
    labContactName.text = @"Your emergency contact is: ";
    labContactName.font = [UIFont systemFontOfSize:20];
    
    labContactNumber = [[UILabel alloc] initWithFrame:CGRectMake(0.4 * screenWidth, 0.3 * screenHeight, 0.35 * screenWidth, 0.1 * screenHeight)];
    labContactNumber.text = contact_firstname;
    labContactNumber.font = [UIFont systemFontOfSize:24];
    labContactNumber.textColor = [UIColor whiteColor];
    
    logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0.02*screenHeight, 80, 50)];
    [logoutBtn setTitle:@"Logout" forState:UIControlStateNormal];
    logoutBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:22.0];
    [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    logoutBtn.backgroundColor = [UIColor clearColor];
    [logoutBtn addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    callBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.28 * screenWidth, 0.5*screenHeight, 0.4 * screenWidth, 0.4 * screenWidth)];
  //  [callBtn setTitle:@"Call Friend" forState:UIControlStateNormal];
  //  callBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:16.0];
  //  [callBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal ];
    callBtn.backgroundColor = [UIColor clearColor];
    UIImage * callFriend = [UIImage imageNamed:@"chat.png"];
    [callBtn setBackgroundImage:callFriend forState:UIControlStateNormal];
    [callBtn addTarget:self action:@selector(callClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:labUserNameLabel];
    [self.view addSubview:labUserName];
    [self.view addSubview:labContactName];
    [self.view addSubview:labContactNumber];
    [self.view addSubview:logoutBtn];
    [self.view addSubview:callBtn];
    
    
}




//logout
-(void)logoutClicked:(id)sender{
    NSLog(@"Logging out...");
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext * myContext = [appDelegate managedObjectContext];
    NSError * error;
    
    // Cache the logged in user's all the information to core data
    NSFetchRequest * myRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:myContext];
    [myRequest setEntity:entity];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(user_name == %@)",user_name];
    [myRequest setPredicate:pred];
    
    NSArray * fetchedObjects = [myContext executeFetchRequest:myRequest error:&error];
    if (!fetchedObjects) {
        NSLog(@"Error fetching Instagram objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    // check before insert
    if ([fetchedObjects count] == 0  ) { // no matches
        NSLog(@"Something is wrong, isLogged is not set correctly.");
    }
    else{
        NSManagedObject *matches = nil;
        matches = fetchedObjects[0];
        
        [matches setValue:@"0" forKey:@"isLogged"];
        if (![myContext save:&error]) {
            NSLog(@"Save failed");
        }

        
    }
    
    [self performSegueWithIdentifier:@"logout_success" sender:self];
    NSLog(@"Logout success.");
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


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
 //   NSLog(@"latitude=>%@",[NSString stringWithFormat:@"%.8f",crnLoc.coordinate.latitude]);
 //   NSLog(@"longitude=>%@",[NSString stringWithFormat:@"%.8f",crnLoc.coordinate.longitude]);

    latitude = crnLoc.coordinate.latitude;
    longitude = crnLoc.coordinate.longitude;
}




//call friend
-(void)callClicked:(id)sender{
    
    
    
   // [self alertStatus: [NSString stringWithFormat:@"Calling %@", contact_number ] :@"Calling friend" :0];
    
    NSLog(@"latitude=>%@",[NSString stringWithFormat:@"%.8f",latitude]);
    NSLog(@"longitude=>%@",[NSString stringWithFormat:@"%.8f",longitude]);
    
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
//    CLLocation *loc = [[CLLocation alloc]initWithLatitude:26.93611 longitude:26.93611];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    
    [ceo reverseGeocodeLocation: loc completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
//         NSLog(@"placemark %@",placemark);
         //String to hold address
         curLocation = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
         
//         NSLog(@"addressDictionary %@", placemark.addressDictionary);
//         NSLog(@"placemark %@",placemark.region);
//         NSLog(@"placemark %@",placemark.country);  // Give Country Name
//         NSLog(@"placemark %@",placemark.locality); // Extract the city name
//         NSLog(@"location %@",placemark.name);
//         NSLog(@"location %@",placemark.ocean);
//         NSLog(@"location %@",placemark.postalCode);
//         NSLog(@"location %@",placemark.subLocality);
//         NSLog(@"location %@",placemark.location);
//         //Print the location to console
//         NSLog(@"I am currently at %@",curLocation);
     }];
    
    NSString * msg = [[NSString alloc] initWithFormat:@"Hi %@, I am %@ and I need help. I am currently at %@", contact_firstname,user_firstname, curLocation];
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = msg;
        controller.recipients = [NSArray arrayWithObjects:contact_number, nil];
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }
    
    NSLog(@"Calling %@",contact_number);
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MessageComposeResultFailed:
        {
            NSLog(@"faild");
            UIAlertController *alrt=[UIAlertController alertControllerWithTitle:@"my apps" message:@"unknown error" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                //do something when click button
            }];
            [alrt addAction:okAction];
            break;
        }
        case MessageComposeResultSent:
            break;
        default:
            break;
    }
    
    [self dismissModalViewControllerAnimated:YES];
}



-(void)getInfo{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext * myContext = [appDelegate managedObjectContext];
    NSError * error;
    
    // Cache the logged in user's all the information to core data
    NSFetchRequest * myRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:myContext];
    [myRequest setEntity:entity];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(isLogged == %@)",@"1"];
    [myRequest setPredicate:pred];
    
    NSArray * fetchedObjects = [myContext executeFetchRequest:myRequest error:&error];
    if (!fetchedObjects) {
        NSLog(@"Error fetching Instagram objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    // check before insert
    if ([fetchedObjects count] == 0  ) { // no matches
        NSLog(@"Something is wrong, isLogged is not set correctly.");
    }
    else{
        NSManagedObject *matches = nil;
        matches = fetchedObjects[0];
        
        user_name = [matches valueForKey:@"user_name"];
        user_firstname = [matches valueForKey:@"user_firstname"];
        user_lastname = [matches valueForKey:@"user_lastname"];
        contact_firstname = [matches valueForKey:@"contact_firstname"];
        contact_lastname = [matches valueForKey:@"contact_lastname"];
        contact_number = [matches valueForKey:@"contact_number"];
        
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
