//
//  TestViewController.m
//  DateTool
//
//  Created by ldnjun on 16/6/4.
//  Copyright © 2016年 ldnjun. All rights reserved.
//

#import "TestViewController.h"
#import "DJTimePickerView.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DJTimePickerView *time = [[DJTimePickerView alloc]init];
    [time show];
    // Do any additional setup after loading the view.
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
