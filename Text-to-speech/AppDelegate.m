//
//  AppDelegate.m
//  Text-to-speech
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "DisCoverViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    HomePageViewController *homeVC = [[HomePageViewController alloc]init];
    UINavigationController *homeNavi = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeVC.tabBarItem.title = @"主页";
    homeVC.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    DisCoverViewController *disVC = [[DisCoverViewController alloc]init];
    disVC.tabBarItem.title = @"发现";
    disVC.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_discover_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    disVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_discover_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *disNavi = [[UINavigationController alloc]initWithRootViewController:disVC];
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    [tabBar setViewControllers:@[homeNavi,disNavi]];
    
    self.window.rootViewController = tabBar;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
