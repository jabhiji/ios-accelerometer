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
#import "Circles.h"

@interface ViewController : UIViewController

// labels
@property (strong, nonatomic) IBOutlet UILabel *minMag;
@property (strong, nonatomic) IBOutlet UILabel *magnitude;
@property (strong, nonatomic) IBOutlet UILabel *maxMag;
@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;
@property (strong, nonatomic) IBOutlet UILabel *minX;
@property (strong, nonatomic) IBOutlet UILabel *minY;
@property (strong, nonatomic) IBOutlet UILabel *minZ;
@property (strong, nonatomic) IBOutlet UILabel *maxX;
@property (strong, nonatomic) IBOutlet UILabel *maxY;
@property (strong, nonatomic) IBOutlet UILabel *maxZ;

// motion manager
@property (strong, nonatomic) CMMotionManager *motionManager;

// rolling ball model
@property (strong, nonatomic) Model *model;

// the view
@property (strong, nonatomic) IBOutlet Circles *myView;

// the ball images
@property (nonatomic, strong) UIImage* yellowball;
@property (nonatomic, strong) UIImageView* ballView;
- (IBAction)resetValues:(id)sender;

@end