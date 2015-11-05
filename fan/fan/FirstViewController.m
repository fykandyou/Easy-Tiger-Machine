//
//  FirstViewController.m
//  fan
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 fan.com. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDateComponents *compents =[[NSDateComponents alloc] init];
    compents.year = 2015;
    compents.day = 5;
    compents.month = 11;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *miniDate=[calendar dateFromComponents:compents];
    _datePicker.minimumDate = miniDate;
    
    
    NSDate *maxiDate=[NSDate dateWithTimeIntervalSinceNow:3*24*60*60];
    _datePicker.maximumDate = maxiDate;
    
   // [_datePicker addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventValueChanged];
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    NSString *selected=[_datePicker.date descriptionWithLocale:_datePicker.locale];
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"时间是：" message:selected preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action =[UIAlertAction actionWithTitle:@"是：" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
