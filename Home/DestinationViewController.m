//
//  DestinationViewController.m
//  Home
//
//  Created by tongji on 1/16/14.
//  Copyright (c) 2014 Peng Ji. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()

@end

@implementation DestinationViewController

//@synthesize timeTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView methods
/**
 1、返回 UITableView 的区段数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/**
 2、返回 UITableView 的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

/**
 3、设置行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    // 实例化单元格对象
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

/**
 5、点击单元格时的处理
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"timeTable" sender:self];
    //初始化appViewController
//    timeTableViewController = [[TimeTableViewController alloc]initWithNibName:@"TimeTableViewController" bundle:nil];
    //传递参数
    //    destinationViewController.appName = appName;
    //    destinationViewController.appIconName = imageName;
    //跳转
//    [self.navigationController pushViewController:timeTableViewController animated:YES];
}


@end
