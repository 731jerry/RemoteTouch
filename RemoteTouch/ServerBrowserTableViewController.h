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

- (void) navigationBarToBeDisconnected:(ServerBrowserTableViewController *) sender;
- (void) navigationBarToBeReadyToConnceted:(ServerBrowserTableViewController *) sender;
- (void) navigationBarToBeConnected:(ServerBrowserTableViewController *) sender;
@end

@interface ServerBrowserTableViewController : UITableViewController {
    Server *_server;
	NSMutableArray *_services;
}

@property(nonatomic, retain) Server *server;
@property (nonatomic, weak) NSString *selectedTableViewName;

- (void)addService:(NSNetService *)service moreComing:(BOOL)moreComing;
- (void)removeService:(NSNetService *)service moreComing:(BOOL)moreComing;

@property (nonatomic, weak) id <ServerBrowserTableViewControllerDelegate> delegate;

@end
