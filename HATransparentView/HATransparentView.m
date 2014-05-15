//
//  HATransparentView.m
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import "HATransparentView.h"

#define kDefaultBackground [UIColor colorWithWhite:0.0 alpha:0.9];

@interface HATransparentView ()

@property (nonatomic, assign) NSInteger statusBarStyle;

@end


@implementation HATransparentView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.opaque = NO;
        self.backgroundColor = kDefaultBackground;
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
    
    // Get current statusBarStyle
    self.statusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
    
    // Close button
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(self.frame.size.width - 60, 26, 60, 30);
    [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:close];
    
    switch (self.style) {
        case HAStyleLight: {
            [close setImage:[UIImage imageNamed:@"btn-close"] forState:UIControlStateNormal];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            break;
        }
        case HAStyleBlack: {
            [close setImage:[UIImage imageNamed:@"btn-close-black"] forState:UIControlStateNormal];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
            break;
        }
    }
    
    // Animation
    CATransition *viewIn = [CATransition animation];
    [viewIn setDuration:0.4];
    [viewIn setType:kCATransitionReveal];
    [viewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[self layer] addAnimation:viewIn forKey:kCATransitionReveal];
    
    [[[window subviews] objectAtIndex:0] addSubview:self];
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
    
    [[UIApplication sharedApplication] setStatusBarStyle:self.statusBarStyle];
    [self removeFromSuperview];
    
    [self.delegate HATransparentViewDidClosed];
}

@end