//
//  LCMediator.h
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LCMediator : NSObject

+ (instancetype)sharedInstance;

/**
 外部调用入口
 
 @param url        NSURL
 @param completion block回调
 
 @return id
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *resultInfo))completion;

/**
 本地调用入口
 
 @param targetName target名
 @param actionName action名
 @param params     参数
 
 @return id
 */
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end
