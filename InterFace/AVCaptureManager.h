//
//  AVCaptureManager.h
//  InterFace
//
//  Created by Janven Zhao on 14-9-22.
//  Copyright (c) 2014年 Janven Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AVCaptureManager : NSObject

@property (nonatomic,strong) AVCaptureSession *session;
@property (nonatomic,strong) AVCaptureStillImageOutput *captureOutput;
@property (nonatomic,strong) UIImage *image;

+(void)startRunning;

+(void)stopRunning;

+(void)captureStillImage;

+(UIImage *)image;

/*
 插入预览视图到主视图中
 **/
+ (void)embedPreviewInView: (UIView *)aView;

@end
