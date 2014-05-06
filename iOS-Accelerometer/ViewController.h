//
//  ViewController.h
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "Model.h"

@interface ViewController : UIViewController

// labels
@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

// motion manager
@property (strong, nonatomic) CMMotionManager *motionManager;

// rolling ball model
@property (strong, nonatomic) Model *model;

// the view
@property (weak, nonatomic) IBOutlet UIView *blackBox;

// the ball image
@property (nonatomic, strong) UIImage* ball;
@property (nonatomic, strong) UIImageView* ballView;

- (void) showBall;

@end