//
//  RootViewController.m
//  testPainting
//
//  Created by wupeng on 2017/1/29.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "RootViewController.h"
#import "testUIBezierPathView.h"

@interface RootViewController ()

@property (nonatomic, strong) testUIBezierPathView *wraper;
    
    
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    _wraper = [[testUIBezierPathView alloc] initWithFrame:CGRectMake(14 * kDeviceScaleFactor, 200, kScreenWidth - 28 * kDeviceScaleFactor, [Theme paddingWithSize:268])];
    _wraper.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_wraper];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
