//
//  ViewController.m
//  HATransparentView
//
//  Created by Heberti Almeida on 13/09/13.
//  Copyright (c) 2013 Heberti Almeida. All rights reserved.
//

#import "ViewController.h"
#import "HATransparentView.h"

@interface ViewController ()

@property (strong, nonatomic) HATransparentView *transparentView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressedDemo:(UIButton *)sender {
    
    _transparentView = [[HATransparentView alloc] init];
    [_transparentView open];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, _transparentView.frame.size.width, _transparentView.frame.size.height - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_transparentView addSubview:self.tableView];
    
}


#pragma TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    static NSString *cellId = @"cellId";
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = @"Menu";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.0 green:143/255.0 blue:213/255.0 alpha:1.0];
    
    return cell;
}

#pragma TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_transparentView close];
    NSLog(@"Selected: %i", indexPath.row);
}

@end
