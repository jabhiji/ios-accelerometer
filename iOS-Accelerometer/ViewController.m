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
    
    // initialize model
    model = [[Model alloc] init];
    model.WIDTH  = self.myView.frame.size.width;
    model.HEIGHT = self.myView.frame.size.height;
    [model setInitialBallPosition];
    
    // display initial condition before animation starts
    [self showYellowBall];
    
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
            model.accelerationZ = accelerometerData.acceleration.z;
            
            if (model.accelerationX < model.minAccX) model.minAccX = model.accelerationX;
            if (model.accelerationY < model.minAccY) model.minAccY = model.accelerationY;
            if (model.accelerationZ < model.minAccZ) model.minAccZ = model.accelerationZ;
            
            if (model.accelerationX > model.maxAccX) model.maxAccX = model.accelerationX;
            if (model.accelerationY > model.maxAccY) model.maxAccY = model.accelerationY;
            if (model.accelerationZ > model.maxAccZ) model.maxAccZ = model.accelerationZ;

            self.minX.text = [NSString stringWithFormat:@"%.1f g",model.minAccX];
            self.minY.text = [NSString stringWithFormat:@"%.1f g",model.minAccY];
            self.minZ.text = [NSString stringWithFormat:@"%.1f g",model.minAccZ];
            
            self.accX.text = [NSString stringWithFormat:@"%.1f g",accelerometerData.acceleration.x];
            self.accY.text = [NSString stringWithFormat:@"%.1f g",accelerometerData.acceleration.y];
            self.accZ.text = [NSString stringWithFormat:@"%.1f g",accelerometerData.acceleration.z];
            
            self.maxX.text = [NSString stringWithFormat:@"%.1f g",model.maxAccX];
            self.maxY.text = [NSString stringWithFormat:@"%.1f g",model.maxAccY];
            self.maxZ.text = [NSString stringWithFormat:@"%.1f g",model.maxAccZ];
        
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
    //[self showBlueBall];
    
    // update ball position
    [model updateBallPosition];
    
    // draw the ball at the new location
    [self showYellowBall];
}

// draw the balls in the defined view
- (void) showYellowBall
{
    float x = model.x;
    float y = model.y;
    float R = model.R;
    
    ballView = [[UIImageView alloc]
                 initWithFrame:CGRectMake(x-R, y-R, 2*R, 2*R)];
    ballView.image = yellowball;
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
