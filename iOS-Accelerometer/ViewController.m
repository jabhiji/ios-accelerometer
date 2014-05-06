//
//  ViewController.m
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize accelerometerAvailable;
@synthesize currentAccX;
@synthesize currentAccY;
@synthesize currentAccZ;
@synthesize accX;
@synthesize accY;
@synthesize accZ;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self checkForAccelerometer];
    
    currentAccX = 0.0;
    currentAccY = 0.0;
    currentAccZ = 0.0;

    // initialize motion manager
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;

    
}

- (void) checkForAccelerometer
{
    if (accelerometerAvailable) {
        NSLog(@"Yes, this device has an accelerometer");
    } else {
        NSLog(@"No accelerometer is available!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
