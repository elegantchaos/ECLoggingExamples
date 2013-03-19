//
//  ECLoggingSampleViewController.m
//  ECLoggingSample
//
//  Created by Sam Deane on 28/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ECLoggingSampleViewController.h"

#import <ECLogging/ECLogging.h>

@interface ECLoggingSampleViewController()

@end

@implementation ECLoggingSampleViewController

#pragma mark - Channels

ECDefineDebugChannel(LoggingSampleViewControllerChannel);


#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[ECLogManager sharedInstance] saveChannelSettings];
}

- (IBAction)tappedShowDebugView:(id)sender
{
    [[ECLogManager sharedInstance] showUI];
}

- (IBAction)tappedTestOutput:(id)sender
{
    ECDebug(LoggingSampleViewControllerChannel, @"some test output");
    ECDebug(LoggingSampleViewControllerChannel, @"some more output this should spill over many lines hopefully at least it will if I really keep wittering on and on for a really long time");
}

@end
