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


@interface ViewController ()

@end

@implementation ViewController {
    
    NSMutableArray *peopleArray;
    
}

- (IBAction)changePersonButton {
    NSLog(@"\nchanging person");
    [self changePerson];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Appsaholic
    
    
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
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Congratulations!" message:@"You found the mystical Poot!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"omg I'm so lucky" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {NSLog(@"\n\nclicked it");}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}




@end
