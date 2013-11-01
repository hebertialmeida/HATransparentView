//
//  HATransparentView.m
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import "HATransparentView.h"

@implementation HATransparentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma Show Transparent Modal View
#
- (void)open
{
    // Get main window reference
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    if (!mainWindow) mainWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];

    self.frame = [[UIScreen mainScreen] bounds];
    self.opaque = NO;
    
    
    // Close
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(mainWindow.frame.size.width - 60, 26, 60, 30);
    [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [close setImage:[UIImage imageNamed:@"btn-close"] forState:UIControlStateNormal];
    [self addSubview:close];
    
    // Animation
    CATransition *viewIn = [CATransition animation];
    [viewIn setDuration:0.4];
    [viewIn setType:kCATransitionReveal];
    [viewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[self layer] addAnimation:viewIn forKey:kCATransitionReveal];
    
    [mainWindow addSubview:self];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)close
{
    // Animation
    CATransition *viewOut = [CATransition animation];
    [viewOut setDuration:0.3];
    [viewOut setType:kCATransitionFade];
    [viewOut setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[self.superview layer] addAnimation:viewOut forKey:kCATransitionFade];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self removeFromSuperview];
}

@end
