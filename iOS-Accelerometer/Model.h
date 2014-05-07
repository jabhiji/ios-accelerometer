//
//  Model.h
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// center of the yellow ball
@property float x, y, R;

// acceleration values
@property float accelerationX, minAccX, maxAccX;
@property float accelerationY, minAccY, maxAccY;
@property float accelerationZ, minAccZ, maxAccZ;

// view size in points
@property float width;
@property float height;

// methods
- (void) setInitialBallPosition;
- (void) updateBallPosition;
- (void) resetValues;

@end
