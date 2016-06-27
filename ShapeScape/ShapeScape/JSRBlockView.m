//
//  JSRBlockView.m
//  ShapeScape
//
//  Created by James Raubenheimer on 6/25/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import "JSRBlockView.h"

@implementation JSRBlockView

@synthesize velocity,blockRect,time;

- (id)initWithFrame:(CGRect)frame velocity:(CGPoint) inputVelocity time:(int)blockTime
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.velocity=inputVelocity;
        time=blockTime;
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    float viewWidth,viewHeight;
    viewWidth=self.bounds.size.width;
    viewHeight=self.bounds.size.height;
    
  
    
    blockRect=CGRectMake(0, 0, viewWidth, viewHeight);
    UIBezierPath*path=[UIBezierPath bezierPathWithRect:blockRect];
    
    [[UIColor redColor]setFill];
    [[UIColor redColor]setStroke];
    path.lineWidth=3.0;
    [path stroke];
    
}


@end
