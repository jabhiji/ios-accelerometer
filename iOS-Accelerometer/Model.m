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
@synthesize accelerationX, accelerationY;
@synthesize WIDTH, HEIGHT;

// Override superclass implementation of init

- (id) init {
    
    self = [super init];
    
    if (self) {
        
        R = 15.0;
        speedX = 0.0;
        speedY = 0.0;
        COR = 0.8;
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
    // update ball velocity
    speedX += 0.1*accelerationX;
    speedY += -0.1*accelerationY;
    
    // update ball coordinates in the model
    x += speedX;
    y += speedY;
    
    // check for collisions with walls
    if (x > WIDTH - R) {
        x = WIDTH - R - 1;
        speedX = -COR*fabsf(speedX);
    }
    if (y > HEIGHT - R) {
        y = HEIGHT - R - 1;
        speedY = -COR*fabsf(speedY);
    }
    if (x < R) {
        x = R + 1;
        speedX = COR*fabsf(speedX);
    }
    if (y < R) {
        y = R + 1;
        speedY = COR*fabsf(speedY);
    }
    
}

@end