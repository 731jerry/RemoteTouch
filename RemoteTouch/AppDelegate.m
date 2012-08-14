//
//  AppDelegate.m
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import "AppDelegate.h"
#import "ServerBrowserTableViewController.h"
#import "ServerRunningViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    serverRunningVC.delegate = self;
    
    [[navigationController navigationBar] setTintColor:[UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f]];
    
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
    
    
    return YES;
}

- (IBAction)refreshServerListButton:(id)sender {
    
    NSString *type = @"TestingProtocol";
    _server = [[Server alloc] initWithProtocol:type];
    _server.delegate = self;
    NSError *error = nil;
    if(![_server start:&error]) {
        NSLog(@"error = %@", error);
        // set to red 
        [[navigationController navigationBar] setTintColor:[UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f]];
        NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
    }
    else {
        // set to green
        [[navigationController navigationBar] setTintColor:[UIColor colorWithRed:90.0f/255.0f green:180.0f/255.0f blue:20.0f/255.0f alpha:0.5f]];
        NSLog(@"successful");
        NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
    }
    
    serverBrowserTVC.server = _server;
}

- (void) navigationBarToRed:(ServerRunningViewController *) sender{
    [[navigationController navigationBar] setTintColor:[UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f]];
    NSLog(@"navigationBarToRed >>> ");
}

#pragma mark Server Delegate Methods

- (void)serverRemoteConnectionComplete:(Server *)server {
    NSLog(@"serverRemoteConnectionComplete >>> Server Started");
    // this is called when the remote side finishes joining with the socket as
    // notification that the other side has made its connection with this side
    serverRunningVC.server = server;
    [self.navigationController pushViewController:serverRunningVC animated:YES];
//    [[navigationController navigationBar] setTintColor:[UIColor colorWithRed:90.0f/255.0f green:180.0f/255.0f blue:20.0f/255.0f alpha:1.0f]];
}

- (void)serverStopped:(Server *)server {
    NSLog(@"serverStopped >>> Server stopped");
    
//    [[navigationController navigationBar] setTintColor:[UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f]];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)server:(Server *)server didNotStart:(NSDictionary *)errorDict {
    NSLog(@"Server did not start %@", errorDict);
}

- (void)server:(Server *)server didAcceptData:(NSData *)data {
    NSLog(@"Server did accept data %@", data);
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if(nil != message || [message length] > 0) {
        serverRunningVC.message = message;
    } else {
        serverRunningVC.message = @"no data received";
    }
}

- (void)server:(Server *)server lostConnection:(NSDictionary *)errorDict {
    NSLog(@"Server lost connection %@", errorDict);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)serviceAdded:(NSNetService *)service moreComing:(BOOL)more {
    [serverBrowserTVC addService:service moreComing:more];
}

- (void)serviceRemoved:(NSNetService *)service moreComing:(BOOL)more {
    [serverBrowserTVC removeService:service moreComing:more];
}

#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
