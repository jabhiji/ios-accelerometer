//
//  ViewController.h
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

// acceleration values
@property double currentAccX;
@property double currentAccY;
@property double currentAccZ;

// labels
@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

// check if accelerometer is available
@property(readonly, nonatomic, getter=isAccelerometerAvailable) BOOL accelerometerAvailable;

// motion manager
@property (strong, nonatomic) CMMotionManager *motionManager;


- (void) checkForAccelerometer;

@end
