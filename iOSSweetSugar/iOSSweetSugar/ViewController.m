//
//  ViewController.m
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/25.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [UIImage mm_asyncCircleImage:[UIImage imageNamed:@"1.jpeg"] withSize:view.frame.size fillColor:[UIColor blueColor] withComplite:^(UIImage * _Nonnull circle_image) {
        view.image = circle_image;
    }];
    [self.view addSubview:view];
}


@end
