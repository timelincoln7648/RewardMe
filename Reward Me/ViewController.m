//
//  ViewController.m
//  Reward Me
//
//  Created by Kody O'Connell on 10/28/15.
//  Copyright © 2015 Kody O'Connell. All rights reserved.
//

#import "ViewController.h"
#import "PeopleGenerator.h"
#import "AppsaholicSDK.h"

NSString *const API_KEY = @"94732d9072210f4e1485f8097f08deff018652f5";
NSString *const POOT_EVENT = @"2d0472482c7223ec38d811f0dd3283f9bcd7ca38";
BOOL custom = true;

@interface ViewController ()

@property (strong, nonatomic) UIViewController *appsaholic_rootViewController;
//Not Required for Track Event call as there is a UIViewController Parameter.




@end

@implementation ViewController {
    
    NSMutableArray *peopleArray;
    
}

- (IBAction)changePersonButton {
    NSLog(@"\nchanging person");
    [self changePerson];
}

- (IBAction)openPortalPressed:(id)sender {
    
    [[AppsaholicSDK sharedManager] showPortal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //APPSAHOLIC
    ((AppsaholicSDK*)[AppsaholicSDK sharedManager]).appsaholic_rootViewController = self;
    
   [[AppsaholicSDK sharedManager] startSession:API_KEY withSuccess:^(BOOL success, NSString* status)
    { if (success) {
       NSLog(@"\nAppsaholic session successfully started!");
   } else {
       NSLog(@"\nAppsaholic session failed to start.");
   }
        NSLog(@"\nStatus is %@", status);
        
    
    
    }];
    
    
    
    [self setup];
    
}

- (void) setup {
    
    //people generator
    
    PeopleGenerator *peopleMaker = [[PeopleGenerator alloc] init];
    
    peopleArray = [peopleMaker getPeopleArray];
    
    NSLog(@"array count is %lu", (unsigned long)peopleArray.count);
    
    for (int j = peopleArray.count-1; j >= 0 ; j--) {
        Person* person = peopleArray[j];
        
        NSLog(@"person is: %@", [[person.firstName stringByAppendingString:@" "] stringByAppendingString:person.lastName]);
    } 
    
}

- (void) changePerson {
    
    Person *newPerson = peopleArray[arc4random_uniform(peopleArray.count)];
    
    birthday.text = newPerson.birthday;
    name.text = [[newPerson.firstName stringByAppendingString:@" "] stringByAppendingString:newPerson.lastName];
   // NSLog(@"\nchanged the person :)");
    
    [self checkIfPoot];
    
    
}

-(void) checkIfPoot {
    
    NSString *currentName = name.text;
    
    if ([currentName containsString:@"Poot"]) {
        NSLog(@"\nCongratulations! You found the mystical Poot!");
        
        
        NSString *uuid = [[NSUUID UUID] UUIDString];
        
        [[AppsaholicSDK sharedManager] trackEvent:POOT_EVENT withSubID:uuid notificationType:custom withController:self withSuccess:^(BOOL success, NSString *notificationText, NSNumber *points) {
            NSLog(@"%d",success );
            if (success) {
                NSLog(@"%@",notificationText);
                NSLog(@"%@",points);
            } }];
        
         
        }
         
         
        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Congratulations!" message:@"You found the mystical Poot!" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"omg I'm so lucky" style:UIAlertActionStyleDefault
//                                                              handler:^(UIAlertAction * action) {NSLog(@"\n\nclicked it");}];
//        
//        [alert addAction:defaultAction];
//        [self presentViewController:alert animated:YES completion:nil];
        
    
}

-(void) rewardPoot {
    
    
    
}




@end
