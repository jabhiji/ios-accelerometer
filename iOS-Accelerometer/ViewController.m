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
@synthesize model;
@synthesize blackBox;
@synthesize motionManager;
@synthesize ball;
@synthesize ballView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ball image
    ball = [UIImage imageNamed:@"yellowBall.png"];
    
    // initialize model
    model = [[Model alloc] init];
    model.WIDTH  = self.blackBox.frame.size.width;
    model.HEIGHT = self.blackBox.frame.size.height;
    [model setInitialBallPosition];
    
    // display initial condition before animation starts
    [self showBall];
    
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
            model.accelerationX = accelerometerData.acceleration.x;
            model.accelerationY = accelerometerData.acceleration.y;
            self.accX.text = [NSString stringWithFormat:@"%.2f g",accelerometerData.acceleration.x];
            self.accY.text = [NSString stringWithFormat:@"%.2f g",accelerometerData.acceleration.y];
            self.accZ.text = [NSString stringWithFormat:@"%.2f g",accelerometerData.acceleration.z];
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
    // remove earlier image
    [ballView removeFromSuperview];
    
    // update ball position
    [model updateBallPosition];
    
    // draw the ball at the new location
    [self showBall];
}

// draw the balls in the defined view
- (void) showBall
{
    float x = model.x;
    float y = model.y;
    float R = model.R;
    
    ballView = [[UIImageView alloc]
                 initWithFrame:CGRectMake(x-R, y-R, 2*R, 2*R)];
    ballView.image = ball;
    [self.blackBox addSubview:ballView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
