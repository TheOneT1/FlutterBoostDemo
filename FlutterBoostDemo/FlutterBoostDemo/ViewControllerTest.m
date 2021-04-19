//
//  ViewControllerTest.m
//  Runner
//
//  Created by xpn on 2021/4/12.
//  Copyright © 2021 The Chromium Authors. All rights reserved.
//

#import "ViewControllerTest.h"
#import "AppDelegate.h"
@import Flutter;

@interface ViewControllerTest ()

@end

@implementation ViewControllerTest

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//	  [button addTarget:self
//				 action:@selector(showFlutter)
//	   forControlEvents:UIControlEventTouchUpInside];
	  [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
	  button.backgroundColor = UIColor.grayColor;
	  button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
	  [self.view addSubview:button];
    // Do any additional setup after loading the view.
}


- (void)showFlutter {

}
/*
#pragma mark - Navigation/Users/xiaojianhu/Downloads/flutter_boost-master/example/ios/Runner/ViewControllerTest.h

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
