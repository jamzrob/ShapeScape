//
//  JSRViewController.h
//  ShapeScape
//
//  Created by James Raubenheimer on 6/25/14.
//  Copyright (c) 2014 Raubenblahblah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSRPlayerView.h"
#import "JSRShapeModel.h"
#import "JSRBlockView.h"
#import <iAd/iAd.h>
@interface JSRViewController : UIViewController <ADBannerViewDelegate>
{
    JSRShapeModel* gameModel;
    NSTimer* theTimer;
    CADisplayLink* gameTimer;
    
    JSRPlayerView* player;
    
    //for savinng and getting scores
    NSUserDefaults *defaultsHighScore;
    NSString *SaveHighScore;
    NSString *loadHighScore;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

-(void) updateDisplay:(CADisplayLink*) sender;
-(void) endGame;

- (IBAction)startAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *scape;
@property (weak, nonatomic) IBOutlet UILabel *labelHighScore;
@property (weak, nonatomic) IBOutlet UILabel *numHighScore;
@property (weak, nonatomic) IBOutlet UILabel *shape;

@end
