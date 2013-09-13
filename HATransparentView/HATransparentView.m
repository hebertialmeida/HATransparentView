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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark Transparent Modal View
#
- (void)show
{
    // Get main window reference
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    if (!mainWindow) mainWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
//    [[[mainWindow subviews] objectAtIndex:0] addSubview:myView];
    
//    UIWindow *mainWindow = (((AppDelegate *)[UIApplication sharedApplication].delegate).window);
    
//    self = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.frame = [[UIScreen mainScreen] bounds];
    self.opaque = NO;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.9];
    
    
    // Button close
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(mainWindow.frame.size.width - 52, 30, 51, 26);
    [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [close setBackgroundImage:[UIImage imageNamed:@"btn-close"] forState:UIControlStateNormal];
    [self addSubview:close];
    
    /*
    // icon
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-complete"]];
    CGRect iconFrame = icon.frame;
    iconFrame.origin.x = mainWindow.frame.size.width/2 - iconFrame.size.width/2;
    iconFrame.origin.y = mainWindow.frame.size.height/2 - 100;
    icon.frame = iconFrame;
    [_transparentModalView addSubview:icon];
    
    
    // Create label with section title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, icon.frame.origin.y + icon.frame.size.height + 8,
                                                               CGRectGetWidth(mainWindow.frame), 30)];
    title.font = [UIFont fontWithName:@"ProximaNova-Bold" size:28];
    title.text = @"Lição concluída!";
    title.textColor = [UIColor colorWithRed:65/255.0 green:183/255.0 blue:222/255.0 alpha:1.0];
    title.lineBreakMode = UILineBreakModeWordWrap;
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = UITextAlignmentCenter;
    title.numberOfLines = 0;
    [_transparentModalView addSubview:title];
    
    // Subtitle
    UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, title.frame.origin.y + title.frame.size.height + 15,
                                                                  CGRectGetWidth(mainWindow.frame), 50)];
    subTitle.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:18];
    subTitle.text = [NSString stringWithFormat:@"%i- %@", index+1, [[self.allLessons objectAtIndex:index] objectForKey:@"title"]];
    subTitle.textColor = [UIColor whiteColor];
    subTitle.lineBreakMode = UILineBreakModeWordWrap;
    subTitle.backgroundColor = [UIColor clearColor];
    subTitle.textAlignment = UITextAlignmentCenter;
    subTitle.numberOfLines = 0;
    [subTitle sizeToFit];
    CGRect myFrame = subTitle.frame;
    myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y, CGRectGetWidth(mainWindow.frame)-20, myFrame.size.height);
    subTitle.frame = myFrame;
    [_transparentModalView addSubview:subTitle];
    
    
    // Button share
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(10, CGRectGetHeight(mainWindow.frame) - 70, 300, 44);
    shareButton.titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:18];
    [shareButton addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"btn-course-download"] forState:UIControlStateNormal];
    [shareButton setTitle:@"Compartilhar" forState:UIControlStateNormal];
    [_transparentModalView addSubview:shareButton];
    */
    
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
