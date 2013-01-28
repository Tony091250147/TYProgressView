//
//  TYProgressView.h
//  TYProgressView
//
//  Created by tony on 13-1-28.
//  Copyright (c) 2013年 tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYProgressView : UIView <UIAppearanceContainer>

@property (nonatomic, assign) float progress;   // 0 .. 1
- (void) setProgress:(float)progress animated:(BOOL)animated;

@property (nonatomic, retain) UIColor *tintColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *trackColor UI_APPEARANCE_SELECTOR;

@end
