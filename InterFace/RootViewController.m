//
//  RootViewController.m
//  InterFace
//
//  Created by Janven Zhao on 14-9-22.
//  Copyright (c) 2014年 Janven Zhao. All rights reserved.
//

#import "RootViewController.h"
#import "AVCaptureManager.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [AVCaptureManager startRunning];
    [AVCaptureManager embedPreviewInView:self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
