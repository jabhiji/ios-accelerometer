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

@synthesize accX;
@synthesize accY;
@synthesize accZ;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize motion manager
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 1.0/60.0;

    if ([self.motionManager isAccelerometerAvailable]) {
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        
        [self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.accX.text = [NSString stringWithFormat:@"%.2f",accelerometerData.acceleration.x];
                self.accY.text = [NSString stringWithFormat:@"%.2f",accelerometerData.acceleration.y];
                self.accZ.text = [NSString stringWithFormat:@"%.2f",accelerometerData.acceleration.z];
            });
        }];
        
    } else {
        NSLog(@"No accelerometer is available! You may be running on the iOS simulator...");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
