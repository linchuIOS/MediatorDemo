//
//  LCMediator.m
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import "LCMediator.h"

@implementation LCMediator

+ (instancetype)sharedInstance
{
    static LCMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[LCMediator alloc]init];
    });
    return mediator;
}


/*
 URL[scheme://host/path?query]  外部URL的格式
 这里host就对应target
 path对应action
 query对应params
 */

- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *resultInfo))completion
{
    //防止远程去调用app模块
    if(![[url scheme] isEqualToString:@"scheme"])
    {
        return @(NO);
    }
    
    
    //提取对应的params
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    
    NSString *paramStr = [url query];
    
    for(NSString *param in [paramStr componentsSeparatedByString:@"&"])
    {
        NSArray *paramKeyValue = [param componentsSeparatedByString:@"="];
        
        if([paramKeyValue count]<2)
        {
            continue;
        }
        
        [params setObject:[paramKeyValue lastObject] forKey:[paramKeyValue firstObject]];
    }
    
    //提取target
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    //开始进行本地调用
    id result = [self performTarget:url.host action:actionName params:params];
    
    if(completion)
    {
        if(result)
        {
            completion(@{@"result":result});
        }
        else
        {
            completion(nil);
        }
    }
    
    return result;
}




/*
 Target_name
 target类中方法名Action_name
 */

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params
{
    //获取到target类名
    NSString *targetClassStr = [NSString stringWithFormat:@"Target_%@",targetName];
    
    //获取到target中的方法名
    NSString *actionStr = [NSString stringWithFormat:@"Action_%@:",actionName];
    
    //获取targetClass
    Class targetClass = NSClassFromString(targetClassStr);
    
    //生成target对下那个
    id target = [[targetClass alloc]init];
    
    //根据方法查找器去查找
    SEL action = NSSelectorFromString(actionStr);
    
    // 如果target不存在 直接return
    if(target == nil)
    {
        return nil;
    }
    
    
    //如果target中实现了此方法
    if([target respondsToSelector:action])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        return [target performSelector:action withObject:params];
        
#pragma clang diagnostic pop
    }else
    {
        //无响应请求时，调用默认notFound方法
        SEL action = NSSelectorFromString(@"notFound:");
        if([target respondsToSelector:action])
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            return [target performSelector:action withObject:params];
            
#pragma clang diagnostic pop
        }else
        {
            //notFound方法也无响应时，可以做一些弹窗操作
            return nil;
        }
    }
}
@end
