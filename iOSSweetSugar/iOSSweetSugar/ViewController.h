//
//  ViewController.h
//  iOSSweetSugar
//
//  Created by mumu on 2019/3/25.
//  Copyright © 2019年 Mumu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMCustomProtocol <NSObject>

@property (nonatomic, copy) NSString *testStr;

@end

@interface ViewController : UIViewController <MMCustomProtocol>


@end

