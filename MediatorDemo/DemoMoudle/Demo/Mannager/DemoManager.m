//
//  DemoManager.m
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import "DemoManager.h"

@implementation DemoManager

+ (instancetype)sharedInstance
{
    static DemoManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DemoManager alloc]init];
    });
    return manager;
}

- (id)getDemoList
{
    return nil;
}
@end
