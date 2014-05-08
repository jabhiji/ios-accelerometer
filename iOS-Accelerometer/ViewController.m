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

@synthesize minMag, magnitude, maxMag;
@synthesize minX, minY, minZ;
@synthesize accX, accY, accZ;
@synthesize maxX, maxY, maxZ;
@synthesize model;
@synthesize myView;
@synthesize motionManager;
@synthesize yellowball;
@synthesize ballView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ball image
    yellowball = [UIImage imageNamed:@"yellowBall.png"];
    
    // draw custom drawing inside the view (as background)
    [myView setNeedsDisplay];
    
    // crop anything that is outside the view
    myView.clipsToBounds = YES;
    
    // initialize model
    model = [[Model alloc] init];
    model.width  = self.myView.frame.size.width;
    model.height = self.myView.frame.size.height;
    [model setInitialBallPosition];
    
    // initialize UIIMageView object
    ballView = [[UIImageView alloc] init];
    ballView.image = yellowball;
    
    // initialize motion manager
    motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = 1.0/60.0;

    if ([motionManager isAccelerometerAvailable]) {
        
        [self startGameLoop];
        
    } else {
        
        NSLog(@"No accelerometer! You may be running on the iOS simulator...");
    }

}

// get acceleration data and animate ball motion based on current acceleration
- (void) startGameLoop
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
          
            // acceleration components (X, Y and Z)
            model.accelerationX = accelerometerData.acceleration.x;
            model.accelerationY = accelerometerData.acceleration.y;
            model.accelerationZ = accelerometerData.acceleration.z;
            
            // calculate acceleration magnitude
            float acceleration = [model accelerationMagnitude];
            
            // store min and max values
            if (acceleration < model.accMin) model.accMin = acceleration;
            if (acceleration > model.accMax) model.accMax = acceleration;
            
            if (model.accelerationX < model.minAccX) model.minAccX = model.accelerationX;
            if (model.accelerationY < model.minAccY) model.minAccY = model.accelerationY;
            if (model.accelerationZ < model.minAccZ) model.minAccZ = model.accelerationZ;
            
            if (model.accelerationX > model.maxAccX) model.maxAccX = model.accelerationX;
            if (model.accelerationY > model.maxAccY) model.maxAccY = model.accelerationY;
            if (model.accelerationZ > model.maxAccZ) model.maxAccZ = model.accelerationZ;

            self.minMag.text    = [NSString stringWithFormat:@"%.1f",model.accMin];
            self.magnitude.text = [NSString stringWithFormat:@"%.1f",acceleration];
            self.maxMag.text    = [NSString stringWithFormat:@"%.1f",model.accMax];
            
            self.minX.text = [NSString stringWithFormat:@"%.1f",model.minAccX];
            self.minY.text = [NSString stringWithFormat:@"%.1f",model.minAccY];
            self.minZ.text = [NSString stringWithFormat:@"%.1f",model.minAccZ];
            
            self.accX.text = [NSString stringWithFormat:@"%.1f",accelerometerData.acceleration.x];
            self.accY.text = [NSString stringWithFormat:@"%.1f",accelerometerData.acceleration.y];
            self.accZ.text = [NSString stringWithFormat:@"%.1f",accelerometerData.acceleration.z];
            
            self.maxX.text = [NSString stringWithFormat:@"%.1f",model.maxAccX];
            self.maxY.text = [NSString stringWithFormat:@"%.1f",model.maxAccY];
            self.maxZ.text = [NSString stringWithFormat:@"%.1f",model.maxAccZ];
        
        });
    }];
    
    // begin animation
    NSTimer* timer = [NSTimer timerWithTimeInterval:1.0/60.0
                                             target:self
                                           selector:@selector(update)
                                           userInfo:nil
                                            repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

// update model parameters and plot the ball using the view
- (void) update
{
    // update ball position
    [model updateBallPosition];
    
    // draw the ball at the new location
    float x = model.x;
    float y = model.y;
    float R = model.R;
    
    ballView.frame = CGRectMake(x-R, y-R, 2*R, 2*R);
    [self.myView addSubview:ballView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetValues:(id)sender {
    [model resetValues];
}

@end
