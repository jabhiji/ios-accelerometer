//
//  Model.h
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property float x, y, R;

@property float speedX, speedY, COR;

@property float accelerationX;
@property float accelerationY;

@property float WIDTH;
@property float HEIGHT;

- (void) setInitialBallPosition;
- (void) updateBallPosition;

@end