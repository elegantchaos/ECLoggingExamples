//
//  ECLoggingSampleAppDelegate.h
//  ECLoggingSample
//
//  Created by Sam Deane on 28/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ECLoggingSampleViewController;

@interface ECLoggingSampleAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;
@property (strong, nonatomic) ECLoggingSampleViewController* viewController;
@property (strong, nonatomic) UINavigationController* navigationController;

@end
