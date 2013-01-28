//
//  TYViewController.m
//  TYProgressView
//
//  Created by tony on 13-1-28.
//  Copyright (c) 2013年 tony. All rights reserved.
//

#import "TYViewController.h"

@interface TYViewController ()

@end

@implementation TYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.player = [[CEPlayer alloc] init];
    self.player.delegate = self;
    
    UIColor *tintColor = [UIColor orangeColor];
    [[UISlider appearance] setMinimumTrackTintColor:tintColor];
    [[TYProgressView appearance] setTintColor:tintColor];
    
    self.progressView.trackColor = [UIColor colorWithWhite:0.80 alpha:1.0];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)progressSlider:(UISlider *)sender
{
    self.player.position = sender.value;
    self.progressView.progress = sender.value;
}

- (IBAction)playPauseButton:(UIButton *)sender
{
    if(sender.selected) // Shows the Pause symbol
    {
        sender.selected = NO;
        [self.player pause];
    }
    else    // Shows the Play symbol
    {
        sender.selected = YES;
        [self.player play];
    }
}



// MARK: CEPlayerDelegate methods

- (void) player:(CEPlayer *)player didReachPosition:(float)position
{
    self.progressView.progress = position;
    self.progressSlider.value = position;
}

- (void) playerDidStop:(CEPlayer *)player
{
    self.playPauseButton.selected = NO;
    self.progressView.progress = 0.0;
    self.progressSlider.value = 0.0;
}

@end
