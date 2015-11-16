//
//  Car.m
//  Reward Me
//
//  Created by Kody O'Connell on 11/12/15.
//  Copyright © 2015 Kody O'Connell. All rights reserved.
//

#import "Car.h"

@implementation Car {
    //private instance variables
    
    double odometer;
}

//methods

-(void) drive {
    
    NSLog(@"Driving a %@. weeee!", self.model);
}

@end
