//
//  ViewController.m
//  DateTool
//
//  Created by ldnjun on 16/6/2.
//  Copyright © 2016年 ldnjun. All rights reserved.
//

#import "ViewController.h"
#import "DJTimePickerView.h"
#import "TestViewController.h"
@interface ViewController ()
@property (nonatomic,strong)UIButton *timeBtn;
@end

#define kScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight  ([UIScreen mainScreen].bounds.size.height)
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth - 150) / 2, 50, 150, 50)];
    [btn setTitle:@"点击弹出" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.timeBtn = btn;
    [self.view addSubview:btn];
    //[self.view addSubview:time];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)click{
    __weak typeof(self)weakSelf = self;
    DJTimePickerView *picker = [[DJTimePickerView alloc]init];
    picker.block = ^(NSString *str){
        [weakSelf.timeBtn setTitle:str forState:UIControlStateNormal];
    };
    [picker show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
