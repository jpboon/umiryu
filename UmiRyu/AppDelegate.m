//
//  AppDelegate.m
//  UmiRyu
//
//  Created by johan on 12/9/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "AppDelegate.h"
#import "DatabaseManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [DatabaseManager openConnection];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [DatabaseManager closeConnection];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [DatabaseManager openConnection];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [DatabaseManager closeConnection];
}

@end
