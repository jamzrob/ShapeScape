//
//  JSRBlockView.h
//  Blocker
//
//  Created by James Raubenheimer on 6/22/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RED_COLOR 0;
#define GREEN_COLOR 1;
#define BLUE_COLOR 2;

@interface JSRBlockView : UIView
{
    int color;
    int time;
    CGPoint velocity;
    CGRect blockRect;
}

- (id)initWithFrame:(CGRect)frame velocity:(CGPoint) inputVelocity time:(int)blockTime;
@property int time;
@property int color;
@property CGPoint velocity;
@property CGRect blockRect; 
@end
