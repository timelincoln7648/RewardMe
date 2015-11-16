//
//  PeopleGenerator.m
//  Reward Me
//
//  Created by Kody O'Connell on 11/12/15.
//  Copyright © 2015 Kody O'Connell. All rights reserved.
//

#import "PeopleGenerator.h"


@implementation PeopleGenerator {
    
    NSArray *firstNames;
    NSArray *lastNames;
    NSArray *birthdays;
    
}



//methods


-(id) init {
    self = [super init];
    
    if (self) {
        firstNames = [NSArray arrayWithObjects:@"Kody",@"Poot",@"Yoda",@"Chanel",@"Perkeisha",nil];
        lastNames = [NSArray arrayWithObjects:@"O'Connell",@"Lavato",@"Jedi",@"Coco",@"Williams",nil];
        birthdays = [NSArray arrayWithObjects:@"21 Jul 1990",@"13 Nov 1992",@"31 Mar 8657 b.c.",@"4 Apr 1996",@"13 Jun 1993",nil];
        
    }
    NSLog(@"custom init happened");
    return self;
}

-(NSMutableArray*) getPeopleArray {
    
    //todo
    // create array of People type using random selection of names and birthdays and return
    NSMutableArray *thePeople = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        //add random person to array 5 times
        Person *newPerson = [[Person alloc] init];
        newPerson.firstName = firstNames[arc4random_uniform(4)];
        newPerson.lastName = lastNames[arc4random_uniform(4)];
        newPerson.birthday = birthdays[arc4random_uniform(4)];
        
        [thePeople addObject:newPerson];
        NSLog(@"\nadded new person to mutable array");
    }
    NSLog(@"number of people when made is %lu", thePeople.count);
    
    return thePeople;
}



-(Person*) getPerson {
    Person *thePerson;
    thePerson = [[Person alloc] init];
    
    thePerson.firstName = @"peter";
    thePerson.lastName = @"parker";
    thePerson.birthday = @"3 Nov 1982";
    
    return thePerson;
    
}

@end


