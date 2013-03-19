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

@property (strong, nonatomic) UIPopoverController* popover;

@end

@implementation ECLoggingSampleViewController

#pragma mark - Channels

ECDefineDebugChannel(LoggingSampleViewControllerChannel);

#pragma mark - Properties

- (void)dealloc
{
    [_popover release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL* url = [[NSBundle mainBundle] URLForResource:@"ECLogging" withExtension:@"bundle"];
    NSBundle* bundle = [NSBundle bundleWithURL:url];
    ECLoggingViewController* loggingViewController = [[ECLoggingViewController alloc] initWithNibName:@"ECLoggingViewController" bundle:bundle];
    UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:loggingViewController];

    CGRect frame = self.view.frame;
    const CGFloat kInset = 10.0;
    frame.origin.x += kInset;
    frame.origin.y += kInset;
    frame.size.width -= kInset * 2.0;
    frame.size.height -= kInset * 2.0;
    loggingViewController.view.frame = frame;
    
    self.popover = popover;
    [popover release];
    [loggingViewController release];
}

- (void)viewDidUnload
{
    self.popover = nil;
    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[ECLogManager sharedInstance] saveChannelSettings];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)tappedShowDebugView:(id)sender
{
    UIButton* button = sender;
    [self.popover presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)tappedTestOutput:(id)sender
{
    ECDebug(LoggingSampleViewControllerChannel, @"some test output");
    ECDebug(LoggingSampleViewControllerChannel, @"some more output this should spill over many lines hopefully at least it will if I really keep wittering on and on for a really long time");
}

@end
