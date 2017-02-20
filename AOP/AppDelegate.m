//
//  AppDelegate.m
//  AOP
//
//  Created by shendong on 2017/2/20.
//  Copyright © 2017年 shendong. All rights reserved.
//

#import "AppDelegate.h"
#import "AOPConfiguration.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    [AOPConfiguration setup];
    
    return YES;
}



@end
