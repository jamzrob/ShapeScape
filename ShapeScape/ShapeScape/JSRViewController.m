//
//  JSRViewController.m
//  ShapeScape
//
//  Created by James Raubenheimer on 6/25/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import "JSRViewController.h"


@interface JSRViewController ()

@end

@implementation JSRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //initialize the game model
    gameModel=[[JSRShapeModel alloc] init];
    
   
  
    //get high score
    defaultsHighScore = [NSUserDefaults standardUserDefaults];
    loadHighScore = [defaultsHighScore objectForKey:@"savedHighScore"];
    [self.numHighScore setText :loadHighScore];
    
    
    player=[[JSRPlayerView alloc]
            initWithFrame:gameModel.playerRect];
    
    [self.view addSubview:player];
    
    
    
  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) timerFired:(NSTimer *)theTimer
{
    [gameModel timerTick];
    
    if([self.numHighScore.text integerValue]<gameModel.time)
    {
        self.numHighScore.text=[NSString stringWithFormat:@"%i",gameModel.time];
        //saves high score
        SaveHighScore = self.numHighScore.text;
        defaultsHighScore = [NSUserDefaults standardUserDefaults];
        [defaultsHighScore setObject:SaveHighScore forKey:@"savedHighScore"];
        [defaultsHighScore synchronize];
        
    }
    self.timeLabel.text=[NSString stringWithFormat:@"%i",gameModel.time];
    
}

-(void) updateDisplay:(CADisplayLink *)sender
{
    
    //update the model
    [gameModel updateModelWithTime:sender.timestamp];
    
    
        [gameModel checkCollisionWithPlayer];
        
        if(gameModel.collide==YES)
        {
            [self endGame];
            gameModel.collide=NO;
           
        }
        
        
      for(JSRBlockView* blockView in gameModel.blocks)
      {
          CGRect newBlockRect=blockView.frame;
          newBlockRect.origin.x+=gameModel.timeDelta*blockView.velocity.x;
          newBlockRect.origin.y+=gameModel.timeDelta*blockView.velocity.y;
          [blockView setFrame:newBlockRect];
          [self.view addSubview:blockView];
      }
    
   


}


-(void) endGame
{
    
    
    
    self.scape.hidden=NO;
    self.shape.hidden=NO;
    self.labelHighScore.hidden=NO;
    self.numHighScore.hidden=NO;
    self.startLabel.hidden=NO;
    
  
    
    //end the timer
    [theTimer invalidate];
    theTimer=nil;
    
    
    
    for(JSRBlockView* blockView in gameModel.blocks)
    {
        [blockView removeFromSuperview];
        
        
    }

   [gameModel endBlocks];
   
    //get high score
    defaultsHighScore = [NSUserDefaults standardUserDefaults];
     loadHighScore = [defaultsHighScore objectForKey:@"savedHighScore"];
    [self.numHighScore setText :loadHighScore];
}

- (IBAction)startAction:(id)sender
{
    
    
    self.scape.hidden=YES;
    self.shape.hidden=YES;
    self.labelHighScore.hidden=YES;
    self.numHighScore.hidden=YES;
    self.startLabel.hidden=YES;
    
    //start the blocks
    [gameModel startBlocks];
    
    //start the timer
    theTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    
    //start the CADisplayLink
    gameTimer=[CADisplayLink displayLinkWithTarget:self
                                          selector:@selector(updateDisplay:)];
    
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}





-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Iterate over all the touches
    for(UITouch* t in touches)
    {
        CGPoint delta;
        
         delta.x=[t locationInView:self.view].x-
        [t previousLocationInView:self.view].x;
        
        delta.y=[t locationInView:self.view].y-
        [t previousLocationInView:self.view].y;
        
        CGRect newPlayerRect=gameModel.playerRect;
        newPlayerRect.origin.x+=delta.x;
        newPlayerRect.origin.y+=delta.y;
        
   
        
        gameModel.playerRect=newPlayerRect;
        [player setFrame:newPlayerRect];
        
        
        
    }
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    
}






//method used to save high score
-(void) viewDidUnload
{
    //saves high score
    SaveHighScore = self.numHighScore.text;
    defaultsHighScore = [NSUserDefaults standardUserDefaults];
    [defaultsHighScore setObject:SaveHighScore forKey:@"savedHighScore"];
    [defaultsHighScore synchronize];
}

#pragma mark IAD DELAGATE METHODS

-(void) bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
}

-(void) bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
}


@end
