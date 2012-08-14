//
//  AppDelegate.h
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"

@class ServerRunningViewController;
@class ServerBrowserTableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, ServerDelegate> {
    Server *_server;
    UIWindow *window;
    UINavigationController *navigationController;
    IBOutlet ServerBrowserTableViewController *serverBrowserTVC;
    IBOutlet ServerRunningViewController *serverRunningVC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (void) navigationBarToRed;

- (IBAction)refreshServerList:(id)sender;

@end
