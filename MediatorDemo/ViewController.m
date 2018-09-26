//
//  ViewController.m
//  MediatorDemo
//
//  Created by linchu on 2018/9/26.
//  Copyright © 2018年 while. All rights reserved.
//

#import "ViewController.h"
#import "LCMediator+DemoMoudleActions.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    UIViewController *v1 = [[LCMediator sharedInstance] LCMediator_fetchDemo1ViewController];
    
    UIViewController *v2 =[[LCMediator sharedInstance] LCMediator_fetchDemo2ViewControllerWithUserId:@"11111"];
    
//    NSArray *listArray = [[LCMediator sharedInstance] getDemoList];
    
    [self presentViewController:v2 animated:nil completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
