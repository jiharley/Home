//
//  DestinationViewController.h
//  Home
//
//  Created by tongji on 1/16/14.
//  Copyright (c) 2014 Peng Ji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeTableViewController.h"

@interface DestinationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

//@property(nonatomic,strong) TimeTableViewController *timeTableViewController;
@property (weak, nonatomic) IBOutlet UITableView *destTableView;

@end
