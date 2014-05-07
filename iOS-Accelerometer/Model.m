//
//  Model.m
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize x, y, R;
@synthesize accelerationX, accelerationY, accelerationZ;
@synthesize minAccX, maxAccX, minAccY, maxAccY, minAccZ, maxAccZ;
@synthesize width, height;

// Override superclass implementation of init

- (id) init {
    
    self = [super init];
    
    if (self) {
        
        R = 10.0;
        
        minAccX = 0.0;
        maxAccX = 0.0;
        minAccY = 0.0;
        maxAccY = 0.0;
        minAccZ = 0.0;
        maxAccZ = 0.0;
        
    }
    
    return self;
}

// set the initial location of the two balls
- (void) setInitialBallPosition
{
    x = width / 2.0;
    y = height / 2.0;
}

// move the ball based on the current speed
// and also check for wall collisions

- (void) updateBallPosition
{
    float xCen = width/2.0;
    float yCen = height/2.0;
    float maxR = width/2.0;
    x = xCen + 0.666*maxR*accelerationX;
    y = yCen - 0.666*maxR*accelerationY;
}

- (void) resetValues
{
    minAccX = 0.0;
    maxAccX = 0.0;
    minAccY = 0.0;
    maxAccY = 0.0;
    minAccZ = 0.0;
    maxAccZ = 0.0;
}

@end