//
//  HATransparentView.h
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HATransparentView : UIView

@property (strong, nonatomic) UIColor *color;
@property (nonatomic) CGFloat *alpha;

- (void)open;
- (void)close;

@end
