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
@property (weak, nonatomic) IBOutlet UIView *blackBox;

// the ball images
@property (nonatomic, strong) UIImage* yellowball;
@property (nonatomic, strong) UIImage* blueball;
@property (nonatomic, strong) UIImageView* ballView;

@end