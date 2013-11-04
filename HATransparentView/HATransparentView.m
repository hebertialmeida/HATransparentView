//
//  HATransparentView.m
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import "HATransparentView.h"


#define kDefaultBackground [UIColor colorWithWhite:0.0 alpha:0.9];

@implementation HATransparentView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.opaque = NO;
        self.backgroundColor = kDefaultBackground;
        
        // Close button
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        close.frame = CGRectMake(self.frame.size.width - 60, 26, 60, 30);
        [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [close setImage:[UIImage imageNamed:@"btn-close"] forState:UIControlStateNormal];
        [self addSubview:close];
    }
    return self;
}

#pragma mark - Open Transparent View

- (void)open
{
    // Get main window reference
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window)
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    // Animation
    CATransition *viewIn = [CATransition animation];
    [viewIn setDuration:0.4];
    [viewIn setType:kCATransitionReveal];
    [viewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[self layer] addAnimation:viewIn forKey:kCATransitionReveal];
    
    [[[window subviews] objectAtIndex:0] addSubview:self];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


#pragma mark - Close Transparent View

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
