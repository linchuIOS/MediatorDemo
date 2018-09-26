//
//  LCMediator+DemoMoudleActions.h
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import "LCMediator.h"

@interface LCMediator (DemoMoudleActions)

-(UIViewController *)LCMediator_fetchDemo1ViewController;

-(UIViewController *)LCMediator_fetchDemo2ViewControllerWithUserId:(NSString *)userId;

-(NSArray *)getDemoList;

@end
