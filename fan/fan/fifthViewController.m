//
//  fifthViewController.m
//  fan
//
//  Created by qingyun on 15/11/5.
//  Copyright (c) 2015年 fan.com. All rights reserved.
//

#import "fifthViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface fifthViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong)NSArray *images;
@property (nonatomic)NSInteger hardLevel;
@end

@implementation fifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadImages];
    
    _hardLevel = 2;
    
    _label.text=@"";
    
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    
 _label.text =@"";
    
    NSInteger numOfContinous =1;
    NSInteger compareRow = 0;
    
    
    BOOL isWin=NO;
    
    for (int i=0; i<5; i++) {
        NSInteger selectedRow=round(random()%_images.count);
        
        [_pickerView selectRow:selectedRow inComponent:i animated:YES];
        
        if (i==0) {
            compareRow = selectedRow;
            numOfContinous = 1;
        }else{
            if (compareRow == selectedRow) {
                numOfContinous ++;
            }else{
                numOfContinous =1;
            }
            
            compareRow = selectedRow;
        }
        
        if (numOfContinous >= _hardLevel) {
            isWin = YES;
        }
        
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
    [self playSound:path];
    
    if (isWin) {
        _label.text = @"胜利了";
        NSString *path = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"wav"];
        [self playSound:path];
    }
}

- (IBAction)segmentedControl:(UISegmentedControl *)sender {
    
    _hardLevel = sender.selectedSegmentIndex +2;
}

-(void)loadImages
{
    _images = @[@"apple",@"bar",@"cherry",@"crown",@"lemon",@"seven"];
}

-(void)playSound:(NSString *)soundPath
{
    SystemSoundID soundID;
    CFURLRef ref =(__bridge CFURLRef)[NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID(ref, &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}
#pragma mark-UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _images.count;
}

#pragma mark-UIPickerViewDelegate

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:_images[row]]];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 88;
}
@end
