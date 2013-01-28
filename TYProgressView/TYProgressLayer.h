//
//  TYProgressLayer.h
//  TYProgressView
//
//  Created by tony on 13-1-28.
//  Copyright (c) 2013年 tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TYProgressLayer : CALayer

@property (nonatomic, assign) float progress;
@property (nonatomic, retain) UIColor *tintColor;
@property (nonatomic, retain) UIColor *trackColor;


@end
