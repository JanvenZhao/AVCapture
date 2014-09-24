//
//  AVCaptureManager.m
//  InterFace
//
//  Created by Janven Zhao on 14-9-22.
//  Copyright (c) 2014年 Janven Zhao. All rights reserved.
//

#import "AVCaptureManager.h"
#import <ImageIO/ImageIO.h>

#import "AVCapturePreview.h"

@implementation AVCaptureManager

+(AVCaptureManager *)sharedInstance{
    static AVCaptureManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[AVCaptureManager alloc] init];
    });
    return manager;
}

/*
 初始化
 **/

-(id)init{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

-(void)initialize{

    NSError *error = nil;
    
    self.session = [[AVCaptureSession     alloc] init];
    self.session.sessionPreset = AVCaptureSessionPreset640x480;
    
    //捕获设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //输入
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput   deviceInputWithDevice:device error:&error];
    
    if (error) {
        NSLog(@"Error happens when you try to get AVCaptureDeviceInput");
    }
    
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
    }
    
    self.captureOutput = [[AVCaptureStillImageOutput alloc] init];
    
    NSDictionary *setting = @{AVVideoCodecKey:AVVideoCodecJPEG};
    
    self.captureOutput.outputSettings = setting;
    
    if ([self.session canAddOutput:self.captureOutput]) {
        [self.session addOutput:self.captureOutput];
    }
    
}

//捕获照片
-(void)captureImage{
    
    //捕获连接
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in self.captureOutput.connections) {
        for (AVCaptureInputPort *port in connection.inputPorts) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
        
        if (videoConnection) {
            break;
        }
    }
    
    //捕获图片
    [self.captureOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageSampleBuffer,NSError *error){
        CFDictionaryRef exifAttachments = CMGetAttachment(imageSampleBuffer, kCGImagePropertyExifDictionary, nil);
        if (exifAttachments) {
            //Do something with the attachments
        }
        
        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
        self.image = [[UIImage alloc] initWithData:imageData];
        
    }];
}

-(void)embedPreviewInView:(UIView *)aView{

    if (!self.session) {
        return;
    }

    CGRect frame = CGRectMake(0, 0, aView.frame.size.width, aView.frame.size.height);
    self.preview= [[AVCapturePreview alloc] initWithFrame:frame];
    [self.preview setSession:self.session];
    [aView addSubview:self.preview];
    
}

#pragma mark
#pragma mark Open InterFace

+(void)startRunning{

    [[[AVCaptureManager sharedInstance] session] startRunning];

}

+(void)stopRunning{
    [[[AVCaptureManager sharedInstance] session] stopRunning];
}

+(void)captureStillImage{

    [[AVCaptureManager   sharedInstance] captureImage];
}

+(UIImage *)image{

    return [[AVCaptureManager sharedInstance] image];
}

+ (void)embedPreviewInView: (UIView *)aView{

    [[AVCaptureManager sharedInstance] embedPreviewInView:aView];
}

+(AVCapturePreview *)preView{
    return [self preView];
}


@end
