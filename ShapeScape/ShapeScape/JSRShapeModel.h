//
//  JSRShapeModel.h
//  ShapeScape
//
//  Created by James Raubenheimer on 6/25/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSRBlockView.h"
#import "JSRPlayerView.h"



@interface JSRShapeModel : NSObject
{
   
    CGRect blockRect;
    
    NSMutableArray* blocks;
    CGRect playerRect;
    CGFloat lastTime;
    CGFloat timeDelta;
    
    int time;
    
   
    JSRBlockView *blockView;
    
    NSTimer* blockTimer;
     int blockTime;
    
    CGPoint start;
    CGRect screenBounds;
    int side;
    BOOL collide;
    int highScore;
    int currentTime;
    
}

@property CGRect screenBounds;
@property int highScore;
@property BOOL didFire;
@property BOOL collide;
@property CGFloat timeDelta;
@property CGRect blockRect;
@property int blockTime;
@property int time;
@property NSMutableArray* blocks;
@property CGRect playerRect;

-(void) updateModelWithTime:(CFTimeInterval) timestamp;

-(void) timerTick;

-(void) blockTimerFired;

-(void) checkCollisionWithPlayer;

-(void) startBlocks;

-(void) endBlocks;


@end
