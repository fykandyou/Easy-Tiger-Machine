//
//  FourthViewController.m
//  fan
//
//  Created by qingyun on 15/11/5.
//  Copyright (c) 2015年 fan.com. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong) UIPickerView *pickerView;
@property(nonatomic,strong) NSDictionary *dicts;
@property(nonatomic,strong) NSArray *keys;
@property(nonatomic,strong) NSArray *values;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatas];
    
    [self loadSubViews];


}

-(void)loadDatas
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"statedictionary" ofType:@"plist"];
   _dicts=[NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *array =_dicts.allKeys;
    _keys=[array sortedArrayUsingSelector:@selector(compare:)];
    
    _values=_dicts[_keys.firstObject];
}

-(void)loadSubViews
{
    UIPickerView *pickerView=[[UIPickerView alloc] initWithFrame:CGRectMake(0, 20, 375, 160)];
    [self.view addSubview:pickerView];
    
    pickerView.delegate =self;
    pickerView.dataSource=self;
    
    _pickerView=pickerView;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    
    button.frame=CGRectMake(100, 450, 100, 40);
    [button setTitle:@"select" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick:(UIButton *)button
{
    //取出每一列选中的行
    NSInteger leftRow = [_pickerView selectedRowInComponent:0];
    NSInteger rightRow = [_pickerView selectedRowInComponent:1];
    
    NSString *leftString = _keys[leftRow];
    NSString *rightString = _values[rightRow];
    
    NSString *msg = [NSString stringWithFormat:@"%@中的%@",leftString,rightString];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你选择的是：" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark-UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _keys.count;
    }
    
    return _values.count;
}

#pragma mark-UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return _keys[row];
    }
    
    return _values[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *key=_keys[row];
        _values = _dicts[key];
        
        
        [pickerView reloadComponent:1];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 100;
    }
    
    return 200;
}


@end
