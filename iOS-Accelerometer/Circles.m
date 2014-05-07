//
//  Circles.m
//  iOS-Accelerometer
//
//  Created by Abhijit Joshi on 5/6/14.
//  Copyright (c) 2014 Misha software solutions. All rights reserved.
//

#import "Circles.h"

@implementation Circles

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCircles];
}

// polar grid on which the instantaneous acceleration is displayed in real time
- (void) drawCircles
{
    // get the current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // context size in pixels
    size_t WIDTH = CGBitmapContextGetWidth(context);
    size_t HEIGHT = CGBitmapContextGetHeight(context);
    
    // for retina display, 1 point = 2 pixels
    // context size in screen points
    float width = WIDTH/2.0;
    float height = HEIGHT/2.0;
    
    // center coordinates
    float xCen = width/2.0;
    float yCen = height/2.0;
    float maxR = width/2.0;     // WIDTH = HEIGHT in this app
    float ONEGEE = 0.666*maxR;
    
    // outermost red circle (2g)
    CGContextBeginPath(context);
    CGContextAddArc(context, xCen, yCen, 2*ONEGEE, 0, 2*M_PI, YES);
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // blue circle (1g)
    CGContextBeginPath(context);
    CGContextAddArc(context, xCen, yCen, ONEGEE, 0, 2*M_PI, YES);
    [[UIColor blueColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // unfilled circles (0.5g)
    CGContextBeginPath(context);
    CGContextAddArc(context, xCen, yCen, 0.5*ONEGEE, 0, 2*M_PI, YES);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
    // unfilled circles (1.5g)
    CGContextBeginPath(context);
    CGContextAddArc(context, xCen, yCen, 1.5*ONEGEE, 0, 2*M_PI, YES);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
    // horizontal centerline
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, height/2);
    CGContextAddLineToPoint(context, width, height/2);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
    // vertical centerline
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, width/2, 0);
    CGContextAddLineToPoint(context, width/2, height);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
    // diagonal 1
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, width, height);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);

    // diagonal 2
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, width, 0);
    CGContextAddLineToPoint(context, 0, height);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
}

@end
