//
//  BusInformationViewController.h
//  Home
//
//  Created by tongji on 1/16/14.
//  Copyright (c) 2014 Peng Ji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DestinationViewController.h"
#import "ASIHTTPRequest.h"

@interface BusInformationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ASIHTTPRequestDelegate>

@property(nonatomic,strong) DestinationViewController *destinationViewController;

- (IBAction)refreshInfo:(id)sender;

@end
