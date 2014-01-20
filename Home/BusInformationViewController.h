//
//  BusInformationViewController.h
//  Home
//
//  Created by tongji on 1/16/14.
//  Copyright (c) 2014 Peng Ji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DestinationViewController.h"

@interface BusInformationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) DestinationViewController *destinationViewController;

@end
