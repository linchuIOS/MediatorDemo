//
//  LCMediator+DemoMoudleActions.m
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import "LCMediator+DemoMoudleActions.h"

NSString *const kTargeDemo = @"Demo";
NSString *const kActionFetchDemo1ViewController = @"fetchDemo1ViewController";
NSString *const kActionFetchDemo2ViewController = @"fetchDemo2ViewController";
NSString *const kActionGetDemoList              = @"getDemoList";

@implementation LCMediator (DemoMoudleActions)

-(UIViewController *)LCMediator_fetchDemo1ViewController
{
   return  [self performTarget:kTargeDemo action:kActionFetchDemo1ViewController params:nil];
}

-(UIViewController *)LCMediator_fetchDemo2ViewControllerWithUserId:(NSString *)userId
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    params[@"userId"] =userId;
    
    return  [self performTarget:kTargeDemo action:kActionFetchDemo2ViewController params:params];
}

-(NSArray *)getDemoList
{
    return  [self performTarget:kTargeDemo action:kActionGetDemoList params:nil];
}
@end
