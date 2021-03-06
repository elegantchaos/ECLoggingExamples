//
//  ECLoggingSampleAppDelegate.m
//  ECLoggingSample
//
//  Created by Sam Deane on 28/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ECLoggingSampleAppDelegate.h"
#import "ECLoggingSampleViewController.h"

@interface ECLoggingSampleAppDelegate()


@end

@implementation ECLoggingSampleAppDelegate

#pragma mark - Properties

@synthesize navigationController;
@synthesize window;
@synthesize viewController;


#pragma mark - Channels

ECDefineDebugChannel(ApplicationChannel);


#pragma mark - App Delegate Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    ECLoggingSampleViewController* view = [[ECLoggingSampleViewController alloc] initWithNibName:@"ECLoggingSampleViewController" bundle:nil];
    
    self.viewController = view;
    [view release];
    
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:view];
    navigation.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController = navigation;
    [navigation release];
    
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    ECDebug(ApplicationChannel, @"will resign active");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    ECDebug(ApplicationChannel, @"did enter background");
    [[ECLogManager sharedInstance] saveChannelSettings];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    ECDebug(ApplicationChannel, @"will enter foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    ECDebug(ApplicationChannel, @"did become active");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    ECDebug(ApplicationChannel, @"will terminate");
    
    [[ECLogManager sharedInstance] shutdown];
}

@end
