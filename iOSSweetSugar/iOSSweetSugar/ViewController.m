//
//  ViewController.m
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/25.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tools.h"
#import "NSDate+Tools.h"

@interface ViewController ()

@end

@implementation ViewController

typedef void(^TestBlock)(int test);


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [UIImage mm_asyncCircleImage:[UIImage imageNamed:@"1.jpeg"] withSize:view.frame.size fillColor:[UIColor blueColor] withComplite:^(UIImage * _Nonnull circle_image) {
        view.image = circle_image;
    }];
    [self.view addSubview:view];
    
    NSString *fileUrl = @"123/45.zip";
//    if ([fileUrl hasSuffix:@".zip"]) {
//        fileUrl = [fileUrl substringToIndex:fileUrl.length - 4];
//    }
    NSArray *finishArr = @[@"1",@"2",@"3",@"4",@"5"];
    NSArray *subDescArr = [finishArr subarrayWithRange:NSMakeRange(3, finishArr.count -3)];
    //45
    NSString *subStr = [fileUrl substringWithRange:NSMakeRange(3, 2)];
    
    NSLog(@"query =%@",subDescArr);
    int testInt = 10;
    
    TestBlock block = ^(int test) {
        int t = test + testInt;
//        testInt = 20;
        NSLog(@"t=%d -> %d",t, testInt);
    };
    NSArray * arr = [view makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset
    }];
    
//    1558676396607,1558676396811
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSTimeInterval ori = 1558676396811 *0.001;
    NSTimeInterval time = [ViewController mm_getIntervalTimeCompareCurrentTime:ori];
    NSLog(@"time =%f",time);
    NSString *str =nil;
    if (time > 0) { //是正确的。
        if (time < 86400) { //小于一天
            str = [NSDate mm_getDateString:ori format:cDateFormatterTypeShortHourMin];
        } else {
            str = [NSDate mm_getDateString:ori format:cDateFormatterTypeShortMD];
        }
    }
    NSDate *date = [NSDate date];
    NSTimeInterval ddd = date.timeIntervalSinceReferenceDate;
    NSTimeInterval b = date.timeIntervalSinceNow;
    NSTimeInterval c = date.timeIntervalSince1970;
    NSLog(@"time =%f",time);
    
}
+ (NSTimeInterval)mm_getIntervalTimeCompareCurrentTime:(NSInteger)timeStamp {
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDate *currentDate = [NSDate date];
    //计算时间差值
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:confromTimesp];
    return timeInterval;
}
@end
