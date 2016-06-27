//
//  JSRShapeModel.m
//  ShapeScape
//
//  Created by James Raubenheimer on 6/25/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import "JSRShapeModel.h"

#define TOP 0
#define LEFT 1
#define RIGHT 2
#define BOTTOM 3

@implementation JSRShapeModel


@synthesize blocks,playerRect,time,blockTime,blockRect,timeDelta, didFire,collide,highScore,screenBounds;

//declares the calls with intiliazed values
-(id) init
{
    self= [super init];
    
    if(self)
    {
        //initilizes the block array
        blocks=[[NSMutableArray alloc] initWithCapacity:10000];
         screenBounds = [[UIScreen mainScreen] bounds];
        
        playerRect=CGRectMake(screenBounds.size.width/2, screenBounds.size.height/2, 45,45);
        
        highScore=0;
        
        //intiliaze last time
        lastTime=0.0;
       
        //the time of the blocks
        time =0;
        
        
        
        didFire=NO;
    }
    return self;
}

-(void) updateModelWithTime:(CFTimeInterval)timestamp
{
    if(lastTime==0.0)
    {
        //first time though initliaze last
        lastTime=timestamp;
    }
    else{
        //calculate time esasped since last call
        timeDelta=timestamp-lastTime;
        
        //update the lasttiem
        lastTime=timestamp;
        
        for(blockView in blocks)
        {
            
            CGRect newBlockRect=blockRect;
            newBlockRect.origin.x+=timeDelta*200;
            newBlockRect.origin.y+=timeDelta*200;
            blockRect=newBlockRect;
     
        
        }
    }

}

-(void) timerTick
{
    time++;
 
  
   
   
    
}

-(void) blockTimerFired
{
    
   
    side=random()%4;
    CGPoint velo;
    
    switch(side)
    {
        case TOP:
        {
            start.y=-20;
            start.x=random()%(int)screenBounds.size.width;
            velo.x=0;
            velo.y=200;
            break;
        }
        case LEFT:
        {
            start.y=random()%(int)screenBounds.size.height;
            start.x=-20;
            velo.x=200;
            velo.y=0;
            break;
        }
        case RIGHT:
        {
            start.y=random()%(int)screenBounds.size.height;
            start.x=screenBounds.size.width+20;
            velo.x=-200;
            velo.y=0;
            break;
        }
        case BOTTOM:
        {
            start.y=screenBounds.size.height+20;
            start.x=random()%(int)screenBounds.size.width;
            velo.x=0;
            velo.y=-200;
            break;
        }
        default:
            break;
    }
    
   
  
    blockRect=CGRectMake(start.x, start.y, 20, 20);
    blockView=[[JSRBlockView alloc] initWithFrame:blockRect velocity:velo time:time];
    
    //add the block to the array
    [blocks addObject:blockView];
   
     
}

-(void) checkCollisionWithPlayer
{
    for(blockView in blocks)
    {
        if(CGRectIntersectsRect(playerRect, blockView.frame))
        {
            collide=YES;
            time=0;
        }
    }
    
    if(playerRect.origin.x<0)
    {
        playerRect.origin.x=0;
       
    }
    
    if(playerRect.origin.x+45>screenBounds.size.width)
    {
        playerRect.origin.x=screenBounds.size.width-45;
    }
    
    if(playerRect.origin.y<0)
    {
        playerRect.origin.y=0;
    }
    
    if(playerRect.origin.y+45>screenBounds.size.height)
    {
        playerRect.origin.y=screenBounds.size.height+-45;
    }
}



-(void) startBlocks
{
    blockTimer=[NSTimer scheduledTimerWithTimeInterval:.25 target:self selector:@selector(blockTimerFired) userInfo:nil repeats:YES];

    
}

-(void)endBlocks
{
    [blockTimer invalidate];
    blockTimer=nil;
    [blocks removeAllObjects];
    for(blockView in blocks)
    {
        blockView=nil;
        
    }
 
    
}



@end
