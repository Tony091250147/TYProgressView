//
//  TYViewController.h
//  TYProgressView
//
//  Created by tony on 13-1-28.
//  Copyright (c) 2013年 tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYProgressView.h"
#import "CEPlayer.h"

@interface TYViewController : UIViewController <CEPlayerDelegate>

@property (retain, nonatomic) IBOutlet TYProgressView *progressView;
@property (retain, nonatomic) IBOutlet UISlider *progressSlider;
- (IBAction)progressSlider:(UISlider *)sender;
- (IBAction)playPauseButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIButton *playPauseButton;

@property (retain, nonatomic) CEPlayer *player;


@end
