//
//  TimeTableViewController.h
//  Home
//
//  Created by tongji on 1/16/14.
//  Copyright (c) 2014 Peng Ji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *timeTableView;
@end
