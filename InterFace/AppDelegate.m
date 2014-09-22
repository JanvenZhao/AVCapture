//
//  AppDelegate.m
//  InterFace
//
//  Created by Janven Zhao on 14-8-29.
//  Copyright (c) 2014年 Janven Zhao. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    /*
    NSString *javaString = @"http://mobile-api2011.elong.com/mtools/doLog?req=AKAV8fRcI6KSAXwYFYO1OJBCnCC9UyIpcpNPXP0UUxc%3D&randomId=A07AD2D7-9178-418B-A5DC-72E3B62A157D";
    NSString *dotNetString = @"http://mobile-api2011.elong.com/jsonservice/flight.aspx?randomId=82F5AF3C-9240-4363-8CCE-1FD71E1D8BCC-action=GetInsuranceRule&version=1.2&compress=true&req=%7B%22CityName%22%3A%22%E5%8C%97%E4%BA%AC%22%2C%22Header%22%3A%7B%22Guid%22%3A%22402FCEAB%2D4C1E%2D4A38%2DA83A%2D3F65D81BF130%22%2C%22AuthCode%22%3Anull%2C%22DeviceId%22%3A%2239E69DD9%2D2A0A%2D4957%2D9A10%2D8966E3617C1B%22%2C%22OsVersion%22%3A%22iphone_8.0%22%2C%22Version%22%3A%227.2.0%22%2C%22SessionToken%22%3A%22%22%2C%22ChannelId%22%3A%22ewiphone%22%2C%22ClientType%22%3A%221%22%7D%7D";
    
    NSLog(@"Java URL is  %@",[self getRequestURLWithGivenString:javaString andType:0]);
    NSLog(@"DotNet URL is  %@",[self getRequestURLWithGivenString:dotNetString andType:1]);
    
    //Test Passed
    */
    
    
    RootViewController *root = [[RootViewController alloc] init];
    self.window.rootViewController = root;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSString *)getRequestURLWithGivenString:(NSString *)string andType:(int)type{

    
    NSError *error = nil;

    NSString *java_rge = @"http.*[?]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:java_rge options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        NSLog(@"Error happens");
        return @"";
    }
    NSTextCheckingResult *result = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    NSString *returnString = @"";
    
    if (result) {
        returnString = [string substringWithRange:result.range];
    }
    
    if (type == 1) {
        //DotNet
        NSString *dotNet_rge = @"action.*?[&]";
        
        NSRegularExpression *_regex = [NSRegularExpression regularExpressionWithPattern:dotNet_rge options:NSRegularExpressionCaseInsensitive error:&error];
        
        if (error) {
            NSLog(@"Error happens");
            return @"";
        }
        
        NSTextCheckingResult *result = [_regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
        
        if (result) {
            //
            NSRange range = result.range;
            range.length -= 1;
            returnString = [returnString stringByAppendingString:[string substringWithRange:range]];
        }

    }
    
    return returnString;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
