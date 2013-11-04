//
//  ViewController.h
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *demoButton;
@property (strong, nonatomic) UITableView *tableView;

- (IBAction)didPressedDemo:(id)sender;
- (IBAction)didPressedDemo2:(id)sender;

@end
