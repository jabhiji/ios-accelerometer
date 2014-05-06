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
@synthesize speedX, speedY, COR;
@synthesize accelerationX, accelerationY, accelerationZ;
@synthesize minAccX, maxAccX, minAccY, maxAccY, minAccZ, maxAccZ;
@synthesize WIDTH, HEIGHT;

// Override superclass implementation of init

- (id) init {
    
    self = [super init];
    
    if (self) {
        
        R = 10.0;
        speedX = 0.0;
        speedY = 0.0;
        COR = 0.5;
        
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
    x = WIDTH / 2.0;
    y = HEIGHT / 2.0;
}

// move the ball based on the current speed
// and also check for wall collisions

- (void) updateBallPosition
{
    /*
    // update ball velocity
    speedX += 0.3*accelerationX;
    speedY += -0.3*accelerationY;
    
    // update ball coordinates in the model
    x += speedX;
    y += speedY;
    
    // check for collisions with walls
    if (x > WIDTH - R) {
        x = WIDTH - R;// - 1;
        speedX = -COR*fabsf(speedX);
    }
    if (y > HEIGHT - R) {
        y = HEIGHT - R;// - 1;
        speedY = -COR*fabsf(speedY);
    }
    if (x < R) {
        x = R;// + 1;
        speedX = COR*fabsf(speedX);
    }
    if (y < R) {
        y = R;// + 1;
        speedY = COR*fabsf(speedY);
    }
    */
    
    x = WIDTH/2 + (1.0/2.0)*(WIDTH/2)*accelerationX;
    y = HEIGHT/2 - (1.0/2.0)*(HEIGHT/2)*accelerationY;
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