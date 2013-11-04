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
@property (strong, nonatomic) NSArray *menu;
@property (nonatomic) NSInteger selected;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menu = @[@"Your Stations", @"People", @"Alternative", @"Blues", @"Christian/Gospel", @"Classical", @"Country", @"Dance", @"Eletronic", @"Hip Hop", @"Indie", @"Jazz", @"Latin", @"Pop", @"R&B", @"Reggae", @"Rock", @"Songwriters/Folk", @"World", @"More"];
}

- (IBAction)didPressedDemo:(UIButton *)sender
{
    _transparentView = [[HATransparentView alloc] init];
    _transparentView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.9];
    [_transparentView open];

    // Add a tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, _transparentView.frame.size.width, _transparentView.frame.size.height - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_transparentView addSubview:_tableView];
    
}

- (IBAction)didPressedDemo2:(id)sender
{
    _transparentView = [[HATransparentView alloc] init];
    _transparentView.backgroundColor = [UIColor colorWithRed:242/255.0 green:46/255.0 blue:50/255.0 alpha:0.8];
    [_transparentView open];
    
    
    // Add a textView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 64, _transparentView.frame.size.width - 40, _transparentView.frame.size.height - 64)];
    textView.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat fermentum diam, et facilisis nisl consectetur eu. Praesent quis blandit felis. Aliquam non vehicula dolor, scelerisque elementum orci. Mauris auctor convallis mauris, sit amet vulputate enim commodo sit amet. Nulla eget diam mollis, lobortis enim eu, egestas ipsum. Nulla et orci nulla. Nunc malesuada turpis vel nisi semper, in sodales ligula venenatis. Fusce quis enim sagittis, ullamcorper quam sed, scelerisque turpis. Pellentesque metus odio, ornare et porttitor a, feugiat nec urna. \n\nSuspendisse luctus, arcu quis placerat volutpat, ligula felis pellentesque lacus, in mattis nunc nibh sed ipsum. Aliquam aliquam elit placerat, porttitor ipsum ut, accumsan massa. Aliquam ut mi vitae elit vulputate consectetur. Ut ac vestibulum massa. Quisque ullamcorper blandit lobortis. In aliquet arcu id odio tempus mollis. Suspendisse quis rhoncus sem, non vulputate urna. Duis porta dui sed auctor porttitor. \n\nEtiam eget orci ultrices, aliquet ligula sed, aliquet felis. Cras nulla purus, volutpat nec leo aliquet, imperdiet lacinia sem. Curabitur lobortis fringilla lacus, elementum pharetra elit dapibus in. Praesent eget eros ut tortor dictum tincidunt. Donec feugiat tellus lectus, id egestas turpis semper vitae. Donec scelerisque magna quis pulvinar congue. Donec eu nisi nulla. Maecenas ornare volutpat orci, ut elementum libero euismod ut. Maecenas condimentum tellus at cursus lobortis. Fusce sapien lorem, hendrerit dapibus sapien eget, tempor laoreet purus. Vivamus quis blandit lacus. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat fermentum diam, et facilisis nisl consectetur eu. Praesent quis blandit felis. Aliquam non vehicula dolor, scelerisque elementum orci. Mauris auctor convallis mauris, sit amet vulputate enim commodo sit amet. Nulla eget diam mollis, lobortis enim eu, egestas ipsum. Nulla et orci nulla. Nunc malesuada turpis vel nisi semper, in sodales ligula venenatis. Fusce quis enim sagittis, ullamcorper quam sed, scelerisque turpis. Pellentesque metus odio, ornare et porttitor a, feugiat nec urna. \n\nSuspendisse luctus, arcu quis placerat volutpat, ligula felis pellentesque lacus, in mattis nunc nibh sed ipsum. Aliquam aliquam elit placerat, porttitor ipsum ut, accumsan massa. Aliquam ut mi vitae elit vulputate consectetur. Ut ac vestibulum massa. Quisque ullamcorper blandit lobortis. In aliquet arcu id odio tempus mollis. Suspendisse quis rhoncus sem, non vulputate urna. Duis porta dui sed auctor porttitor. \n\nEtiam eget orci ultrices, aliquet ligula sed, aliquet felis. Cras nulla purus, volutpat nec leo aliquet, imperdiet lacinia sem. Curabitur lobortis fringilla lacus, elementum pharetra elit dapibus in. Praesent eget eros ut tortor dictum tincidunt. Donec feugiat tellus lectus, id egestas turpis semper vitae. Donec scelerisque magna quis pulvinar congue. Donec eu nisi nulla. Maecenas ornare volutpat orci, ut elementum libero euismod ut. Maecenas condimentum tellus at cursus lobortis. Fusce sapien lorem, hendrerit dapibus sapien eget, tempor laoreet purus. Vivamus quis blandit lacus.";
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor whiteColor];
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:15];
    
    
    [_transparentView addSubview:textView];
}


#pragma mark - TableView Datasource
#
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menu.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *cellId = @"cellId";
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = _menu[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.0 green:143/255.0 blue:213/255.0 alpha:1.0];
    
    if (_selected == indexPath.row) {
        UIImageView *check = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
        cell.accessoryView = check;
    } else {
        cell.accessoryView = nil;
    }
    
    return cell;
}


#pragma mark - TableView Delegate
#
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_transparentView close];
    
    _selected = indexPath.row;
    
    NSLog(@"Selected: %i", _selected);
}

@end
