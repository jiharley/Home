//
//  BusInformationViewController.m
//  Home
//
//  Created by tongji on 1/16/14.
//  Copyright (c) 2014 Peng Ji. All rights reserved.
//

#import "BusInformationViewController.h"
#import "Constant.h"

@interface BusInformationViewController ()
{
    NSInteger stationCount;
}

@end

@implementation BusInformationViewController
@synthesize destinationViewController;

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
	// Do any additional setup after loading the view.
    stationCount = 10;
}

- (IBAction)refreshInfo:(id)sender {
    NSString *urlString = [NSString stringWithFormat:@"%@/busInfo/station", serverURL];
//    NSString *urlString = @"http://www.baidu.com/";
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setDelegate:self];
//    request.defaultResponseEncoding = NSASCIIStringEncoding;
    [request setRequestMethod:@"POST"];
    [request setShouldAttemptPersistentConnection:NO];
    [request startAsynchronous];
}

- (void) requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSData *responseData = [request responseData];
    NSLog(@"%@", responseString);
    NSLog(@"%@", responseData);
    NSError *error;
    NSArray *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
    NSDictionary *aaa = [responseDic objectAtIndex:1];
    NSLog(@"%@", [aaa objectForKey:@"name"]);
    //NSString *text = [NSString stringWithFormat:@"%@",[responseDic objectForKey:@"id"]];
    stationCount = [responseDic count];
}

- (void) requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"%@", request.responseString);
}

#pragma mark - UITableView methods
/**
 1、返回 UITableView 的区段数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *string;
    if (section==0) {
        string = @"常用车站";
    } else {
        string = @"所有车站";
    }
    return string;
}

/**
 2、返回 UITableView 的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
         return 1;
    } else {
         return stationCount;
    }
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
    //初始化appViewController
//    destinationViewController = [[DestinationViewController alloc]initWithNibName:@"DestinationViewController" bundle:nil];
    //传递参数
//    destinationViewController.appName = appName;
//    destinationViewController.appIconName = imageName;
    //跳转
    [self performSegueWithIdentifier:@"destination" sender:self];
//    [self.navigationController pushViewController:destinationViewController animated:YES];
}

- (IBAction)backToHome:(id)sender {
    
}
    
    
- (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

@end
