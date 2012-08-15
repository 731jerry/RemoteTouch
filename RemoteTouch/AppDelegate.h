//
//  AppDelegate.h
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"
#import "ServerRunningViewController.h"
#import "TouchPadViewController.h"
#import "ServerBrowserTableViewController.h"

@class ServerRunningViewController;
@class ServerBrowserTableViewController;
@class TouchPadViewController;
@class ControllingTabBarViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, ServerDelegate, ServerBrowserTableViewControllerDelegate> {
    Server *_server;
    UIWindow *window;
    UINavigationController *navigationController;
    IBOutlet ServerBrowserTableViewController *serverBrowserTVC;
    IBOutlet ServerRunningViewController *serverRunningVC;
    IBOutlet TouchPadViewController *touchpadVC;
    IBOutlet ControllingTabBarViewController *controllingTBVC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (IBAction)refreshServerListButton:(id)sender;

@end
