//
//  TYProgressLayer.m
//  TYProgressView
//
//  Created by tony on 13-1-28.
//  Copyright (c) 2013年 tony. All rights reserved.
//

#import "TYProgressLayer.h"

@implementation TYProgressLayer

- (id) initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if(self)
    {
        // Typically, the method is called to create the Presentation layer.
        // We must copy the parameters to look the same.
        if([layer isKindOfClass:[TYProgressLayer class]])
        {
            TYProgressLayer *otherLayer = layer;
            
            
            self.progress = otherLayer.progress;
            self.tintColor = otherLayer.tintColor;
            self.trackColor = otherLayer.trackColor;
        }
    }
    
    return self;
}


+ (BOOL) needsDisplayForKey:(NSString *)key
{
    if([key isEqualToString:@"progress"])
        return YES;
    else
        return [super needsDisplayForKey:key];
}

- (void) drawInContext:(CGContextRef)context
{
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2.0;
    CGFloat edge = MAX(self.bounds.size.width, self.bounds.size.height)-MIN(self.bounds.size.width, self.bounds.size.height);
    CGPoint center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    
    // Background playground
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, radius, 0.0);
    CGContextAddLineToPoint(context, radius+edge, 0.0);
    CGContextAddArc(context, radius+edge, radius, radius, - ((float)M_PI / 2.0), (float)M_PI / 2.0, 0);
    CGContextAddLineToPoint(context, radius, 2.0*radius);
    CGContextAddArc(context, radius, radius, radius, (float)M_PI / 2.0, - ((float)M_PI / 2.0), 0);
    CGContextSetFillColorWithColor(context, self.trackColor.CGColor);
    CGContextFillPath(context);
    
    // Elapsed arc
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddLineToPoint(context, radius+edge/2.0, 0);
    BOOL needReturn = NO;
    
    CGFloat oneEighth;
    if (self.progress > 0.125) {
        oneEighth = 0.125;
    } else
    {
        oneEighth = self.progress;
        needReturn = YES;
    }
    CGContextAddLineToPoint(context, radius+edge/2.0*(1+oneEighth/0.125), 0);
    
    if (!needReturn) {
        CGFloat threeEighth;
        if (self.progress > 0.375) {
            threeEighth = 0.25;
        } else
        {
            threeEighth = self.progress - 0.125;
            needReturn = YES;
        }
        CGContextAddArc(context, radius+edge, radius, radius, - ((float)M_PI / 2.0), - ((float)M_PI / 2.0) + M_PI*(threeEighth/0.25), 0);

    }
    
    if (!needReturn) {
        CGFloat fiveEighth;
        if (self.progress > 0.625) {
            fiveEighth = 0.25;
        } else
        {
            fiveEighth = self.progress - 0.375;
            needReturn = YES;
        }
        CGContextAddLineToPoint(context, radius+edge*(1-fiveEighth/0.25),radius*2.0);
    }
    
    if (!needReturn) {
        CGFloat sevenEighth;
        if (self.progress > 0.875) {
            sevenEighth = 0.25;
        } else
        {
            sevenEighth = self.progress - 0.625;
            needReturn = YES;
        }
        CGContextAddArc(context, radius, radius, radius, ((float)M_PI / 2.0), ((float)M_PI / 2.0)+ M_PI*sevenEighth/0.25, 0);
    }
    
    if (!needReturn) {
        CGFloat eightEighth;
        if (self.progress > 1.0) {
            eightEighth = 0.125;
        } else
        {
            eightEighth = self.progress - 0.875;
        }
        CGContextAddLineToPoint(context, radius+edge/2.0*eightEighth/0.125, 0);
    }
    
    
    CGContextAddLineToPoint(context, center.x, center.y);
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    CGContextFillPath(context);
}

@end
