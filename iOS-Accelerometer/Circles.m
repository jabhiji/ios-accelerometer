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
    // get the current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // outermost red circle (2g)
    CGContextBeginPath(context);
    CGContextAddArc(context, 120, 120, 120, 0, 2*M_PI, YES);
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);

    // blue circle (1g)
    CGContextBeginPath(context);
    CGContextAddArc(context, 120, 120, 60, 0, 2*M_PI, YES);
    [[UIColor blueColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);

    /*
    // Drawing code
    
    CGRect quad;
    UIBezierPath* path;
    UIColor* fillColor;
    UIColor* strokeColor;

    // green circle with white border
    quad = CGRectMake(0, 0, 240, 240);
    path = [UIBezierPath bezierPathWithOvalInRect:quad];
    fillColor = [UIColor greenColor];
    [path fill];
    strokeColor = [UIColor whiteColor];
    [path stroke];
    */
    
}

@end
