//
//  AnimalAction.h
//  InterFace
//
//  Created by Janven Zhao on 14-8-29.
//  Copyright (c) 2014年 Janven Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnimalAction <NSObject>

+(void)fly;
+(void)work;
+(void)eat;
+(void)sleep;

@end
