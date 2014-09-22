//
//  AVCapturePreview.m
//  InterFace
//
//  Created by Janven Zhao on 14-9-22.
//  Copyright (c) 2014年 Janven Zhao. All rights reserved.
//

#import "AVCapturePreview.h"
#import <AVFoundation/AVFoundation.h>

@implementation AVCapturePreview
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)init{

    if (self = [super init]) {
        NSLog(@"PreView init");
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        NSLog(@"PreView init");
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"DOne" forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(10, 10, 100, 100)];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        
    }
    return self;
}

+ (Class)layerClass
{
    return [AVCaptureVideoPreviewLayer class];
}

- (AVCaptureSession *)session
{
    return [(AVCaptureVideoPreviewLayer *)[self layer] session];
}

- (void)setSession:(AVCaptureSession *)session
{
    [(AVCaptureVideoPreviewLayer *)[self layer] setSession:session];
}


@end
