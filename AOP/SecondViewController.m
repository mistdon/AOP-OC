
//
//  SecondViewController.m
//  AOP
//
//  Created by shendong on 2017/2/20.
//  Copyright © 2017年 shendong. All rights reserved.
//

#import "SecondViewController.h"
#import "SubscribeModel.h"

@interface SecondViewController ()
@property (nonatomic, strong) SubscribeModel *model;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.model = [[SubscribeModel alloc] init];
}


- (IBAction)subscribeAction:(id)sender {
    [self.model subscribeChannel:@"CCAV"];
}
- (IBAction)testOne:(id)sender {
    [self.model excuteTestOne];
}


@end
