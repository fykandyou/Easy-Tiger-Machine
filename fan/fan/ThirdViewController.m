//
//  ThirdViewController.m
//  fan
//
//  Created by qingyun on 15/11/5.
//  Copyright (c) 2015年 fan.com. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;


@property(nonatomic) CGFloat redNum;
@property(nonatomic) CGFloat greenNum;
@property(nonatomic) CGFloat blueNum;

@end

@implementation ThirdViewController
//定义RGB最大值
#define RGBMax 225
//间隔
#define StepValue 5
//行数
#define RowNum RGBMax/StepValue + 1;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerView.delegate =self;
    _pickerView.dataSource=self;
    
    [self initForSubView];
    // Do any additional setup after loading the view.
}

-(void)initForSubView
{
    [self selectPickView:_pickerView forRow:round(random()%52) inCompoent:RGBComponentTypeRed];
    
    [self selectPickView:_pickerView forRow:round(random()%52) inCompoent:RGBComponentTypeGreen];
    
    [self selectPickView:_pickerView forRow:round(random()%52) inCompoent:RGBComponentTypeBlue];
}

//先选择行，再把被选择行的内容传给subView
-(void)selectPickView:(UIPickerView *)pickerView forRow:(NSInteger)row inCompoent:(NSInteger)component
{
    [pickerView selectRow:row inComponent:component animated:YES];
    
    [self pickerView:pickerView didSelectRow:row inComponent:component];
}
#pragma mark-UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return RowNum;
}


#pragma mark-UIPickerViewDlegate

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    CGFloat redNum=0;
    CGFloat greenNum=0;
    CGFloat blueNum=0;
    switch (component) {
        case RGBComponentTypeRed:
            redNum=row *StepValue/255.0;
            break;
        case RGBComponentTypeGreen:
            greenNum=row*StepValue/255.0;
            break;
        case RGBComponentTypeBlue:
            blueNum=row*StepValue/255.0;
            break;
        default:
            break;
    }
    NSAttributedString *attributedString=[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld",row *StepValue] attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:redNum green:greenNum blue:blueNum alpha:1.0]}];
                                                                                                               
                                                                                                               
    return attributedString;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CGFloat value=row * StepValue/255.0;
    
    switch (component) {
        case RGBComponentTypeRed:
            _redNum = value;
            break;
        case RGBComponentTypeGreen:
            _greenNum = value;
            break;
        case RGBComponentTypeBlue:
            _blueNum = value;
            break;
        default:
            break;
    }
    
    _subView.backgroundColor = [UIColor colorWithRed:_redNum green:_greenNum blue:_blueNum alpha:1.0];
    
}
@end

