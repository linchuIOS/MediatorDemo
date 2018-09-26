//
//  DemoManager.h
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoManager : NSObject

+ (instancetype)sharedInstance;

- (id)getDemoList;

@end
