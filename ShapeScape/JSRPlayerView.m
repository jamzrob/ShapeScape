//
//  JSRPlayerView.m
//  ShapeScape
//
//  Created by James Raubenheimer on 6/25/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import "JSRPlayerView.h"

@implementation JSRPlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Drawing code
    float viewWidth,viewHeight;
    viewWidth=self.bounds.size.width;
    viewHeight=self.bounds.size.height;
    
   
    CGRect playerRect=CGRectMake(self.bounds.origin.x, self.bounds.origin.y, viewWidth, viewHeight);
    UIBezierPath*path=[UIBezierPath bezierPathWithRect:playerRect];
    
    [[UIColor whiteColor]setFill];
    [[UIColor whiteColor]setStroke];
    path.lineWidth=6.0;
    [path stroke];
    
}


@end
