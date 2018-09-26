//
//  Target_Demo.h
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTarget.h"
@interface Target_Demo : BaseTarget

// 获取控制器
- (UIViewController *)Action_fetchDemo1ViewController;

// 获取控制器 需要传参的 如果远程调用 参数格式需要设定
- (UIViewController *)Action_fetchDemo2ViewController:(NSDictionary *)params;


// 获取Demo模块的数据 例如列表
- (id)Action_getDemoList:(NSDictionary *)params;


@end
