//
//  ViewController.h
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"
@class ServerRunningViewController;
@class ServerBrowserTableViewController;

@interface ServerBrowserTableViewController : UITableViewController {
    Server *_server;
	NSMutableArray *_services;
    IBOutlet ServerRunningViewController *serverRunningVC;
}

@property(nonatomic, retain) Server *server;

- (void)addService:(NSNetService *)service moreComing:(BOOL)moreComing;
- (void)removeService:(NSNetService *)service moreComing:(BOOL)moreComing;@end
