//
//  SecondViewController.m
//  fan
//
//  Created by qingyun on 15/11/5.
//  Copyright (c) 2015年 fan.com. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property(strong,nonatomic) NSArray *datas;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadDataSource];

    _pickerView.delegate =self;
    _pickerView.dataSource=self;
    
    _label.text = _datas[0];
}

-(void)loadDataSource
{
    _datas = @[@"Luke",@"Leia",@"Han",@"Chewbacca",@"Artoo",@"Threepio",@"Lando"];

}


#pragma mark-UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datas.count;
}

#pragma mark-UIPickerViewDelegate
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return nil;
    }
    return _datas[row];
}

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        NSAttributedString *attributeddString=[[NSAttributedString alloc] initWithString:_datas[0] attributes:@{NSUnderlineStyleAttributeName:@1,NSForegroundColorAttributeName:[UIColor redColor]}];
        
        return attributeddString;
    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _label.text = _datas[row];
}
@end
