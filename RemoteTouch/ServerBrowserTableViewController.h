//
//  ViewController.h
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"

@class ServerBrowserTableViewController;
@protocol ServerBrowserTableViewControllerDelegate <NSObject>

- (void) navigationBarToRed:(ServerBrowserTableViewController *) sender;

@end

@interface ServerBrowserTableViewController : UITableViewController {
    Server *_server;
	NSMutableArray *_services;
}

@property(nonatomic, retain) Server *server;

- (void)addService:(NSNetService *)service moreComing:(BOOL)moreComing;
- (void)removeService:(NSNetService *)service moreComing:(BOOL)moreComing;

@property (nonatomic, weak) id <ServerBrowserTableViewControllerDelegate> delegate;

@end
