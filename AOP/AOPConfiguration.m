//
//  AOPConfiguration.m
//  AOP
//
//  Created by shendong on 2017/2/20.
//  Copyright © 2017年 shendong. All rights reserved.
//

#import "AOPConfiguration.h"
#import <UIKit/UIKit.h>
#import <Aspects/Aspects.h>

#import "SubscribeModel.h"


@implementation AOPConfiguration

+ (instancetype)instance{
    static AOPConfiguration *configuration;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configuration = [[AOPConfiguration alloc] init];
    });
    return  configuration;
}

+ (void)setup{
    [[self instance] hook_ViewconotrollerDealloc];
    [[self instance] analytics];
    [[self instance] exchangeImplention];
}


/**
  关于ViewController的举例
 */
- (void)hook_ViewconotrollerDealloc{
    //1 . 监控是否有内存泄漏，
    NSError *error;
    [UIViewController aspect_hookSelector:NSSelectorFromString(@"dealloc") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info){
        NSLog(@"ViewController called dealloc");
    }error:&error];
    //2.  push,show 的时候hide bottom bar
    NSError *error2;
    [UINavigationController aspect_hookSelector:@selector(showViewController:sender:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>info,UIViewController *viewcontroller){
        viewcontroller.hidesBottomBarWhenPushed = YES;
    }error:&error2];
}

/**
    统计，打点等
 */
- (void)analytics{
    // 记录某次操作的过程
    NSError *error;
    [SubscribeModel aspect_hookSelector:@selector(subscribeChannel:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>info){
        NSArray *argus = [info arguments];
        NSLog(@"argus = %@",argus);
    }error:&error];
}

/**
   切换实现方法
 */
- (void)exchangeImplention{
    NSError *error;
    [SubscribeModel aspect_hookSelector:@selector(excuteTestOne) withOptions:AspectPositionInstead usingBlock:^(id<AspectInfo> info){
        SubscribeModel *model = [info instance];
        [model excuteTestTwo];
    }error:&error];
}
@end
