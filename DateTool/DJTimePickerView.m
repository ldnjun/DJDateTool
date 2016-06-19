//
//  DJTimePickerView.m
//  DateTool
//
//  Created by ldnjun on 16/6/2.
//  Copyright © 2016年 ldnjun. All rights reserved.
//

#import "DJTimePickerView.h"
@interface DJTimePickerView()
@property (nonatomic,strong)UIView *backgroundView;
@property (nonatomic,strong)UIView *timePickerView;
@property (nonatomic,strong)UIDatePicker *piker;
@end


#define kScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight  ([UIScreen mainScreen].bounds.size.height)
@implementation DJTimePickerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self setupUI];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{

    NSInteger width = kScreenWidth * 0.8;
    NSInteger height = 200;
    self.frame = CGRectMake((kScreenWidth -width) / 2, kScreenHeight, width, height);
    self.backgroundColor = [UIColor whiteColor];
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 3;
    
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, width / 2, 50);
    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:leftBtn];
    
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(CGRectGetMaxX(leftBtn.frame), 0, width / 2, 50);
    [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:rightBtn];
    
    
    UIDatePicker *picker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(leftBtn.frame), width, height - 50)];
    [picker setDatePickerMode:UIDatePickerModeDate];
    [picker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    self.piker = picker;
    [self addSubview:picker];
   
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundView];
    [window addSubview:self];
}

- (void)sure{
    NSString *pickerDate = [NSString stringWithFormat:@"%@",self.piker.date];
    if (self.block) {
        self.block(pickerDate);
    }
    self.hidden = YES;
    self.backgroundView.hidden = YES;
}
- (void)cancel{
    self.hidden = YES;
    self.backgroundView.hidden = YES;
}
#pragma mark - publishMethod

- (void)show{
    [self endEditing:YES];
    
    [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        NSInteger width = kScreenWidth * 0.8;
        NSInteger height = 200;
        CGRect frame = self.frame;
        frame = CGRectMake((kScreenWidth - width) / 2, (kScreenHeight - height) / 2, width, height);
        self.frame = frame;
        self.hidden = NO;
        self.backgroundView.hidden = NO;
    } completion:nil];
}

- (void)hide{
    self.hidden = YES;
    self.backgroundView.hidden = YES;
}
#pragma mark - 懒加载

- (UIView *)backgroundView{
    if(!_backgroundView){
        _backgroundView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        _backgroundView.userInteractionEnabled = YES;
        _backgroundView.hidden = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [_backgroundView addGestureRecognizer:tap];
    }
    return _backgroundView;
}

- (void)tap{
    self.hidden = YES;
    self.backgroundView.hidden = YES;
}
@end
