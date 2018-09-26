//
//  Target_Demo.m
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import "Target_Demo.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "DemoManager.h"
@implementation Target_Demo

- (UIViewController *)Action_fetchDemo1ViewController
{
    return [[Demo1ViewController alloc] init];
}

- (UIViewController *)Action_fetchDemo2ViewController:(NSDictionary *)params
{
    Demo2ViewController *demo2VC = [[Demo2ViewController alloc] init];
    
    demo2VC.userId = params[@"userId"];
    
    return demo2VC;
}


- (id)Action_getDemoList:(NSDictionary *)params
{
    return [[DemoManager sharedInstance]getDemoList];
}


@end
