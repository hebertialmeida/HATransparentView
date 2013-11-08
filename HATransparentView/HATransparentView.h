//
//  HATransparentView.h
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HAStyle) {
    HAStyleLight = 0,
    HAStyleBlack,
};

@interface HATransparentView : UIView

@property (nonatomic, assign) HAStyle style;

- (void)open;
- (void)close;

@end
