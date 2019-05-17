//
//  AppDelegate.m
//  FiveIosDemo
//
//  Created by 张荣 on 2019/5/17.
//  Copyright © 2019 张荣. All rights reserved.
//

#import "AppDelegate.h"

#import "UIViewControllerDemo.h"
#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
   
    //tab 一页面
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
    
     //tab 二页面
    FLBFlutterViewContainer *fvc = FLBFlutterViewContainer.new;
    [fvc setName:@"tab" params:@{}];
    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];
    
    //UITab
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
    
    //配置 路由
    DemoRouter *router = [DemoRouter sharedRouter];
    router.navigationController = rvc;
    
    tabVC.viewControllers = @[vc,fvc]; //添加两个子tab页面到UITab
    
    //初始化FlutterBoost
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
                                                        onStart:^(FlutterViewController *fvc) {
                                                            
                                                        }];
    
    
    self.window.rootViewController = rvc;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
 
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
  
}

@end
