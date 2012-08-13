//
//  ViewController.m
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import "ServerBrowserTableViewController.h"
#import "ServerRunningViewController.h"
#import "AppDelegate.h"
@interface ServerBrowserTableViewController()
@property(nonatomic, retain) NSMutableArray *services;

@end

@implementation ServerBrowserTableViewController

@synthesize services = _services;
@synthesize server = _server;

- (void) viewDidLoad {
	
    //This pops up when the user starts the app and tells them to download the MacRemote desktop tool
    
	/*UIAlertView *alertTest = [[UIAlertView alloc]
     initWithTitle:@"Download the mac application!"
     message:@"In order to control your mac, you must download our free tool."
     delegate:self
     cancelButtonTitle:@"Already did"
     otherButtonTitles:nil];
     
     [alertTest addButtonWithTitle:@"Show me!"];
     
     [alertTest show];
     [alertTest autorelease];*/
	
	NSString *type = @"TestingProtocol";
    _server = [[Server alloc] initWithProtocol:type];
    _server.delegate = self;
    NSError *error = nil;
    if(![_server start:&error]) {
        NSLog(@"error = %@", error);
    }
    else{
        NSLog(@"server started");
    }
    self.server = _server;
}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    
    //This is where i put a link telling the user to go and download the desktop end of things.
    //If you are putting this on the app store, I recommend making a forum online that the user can open from their iphone that is formatted
    //specifically for the iphone (to fit the screen). this page should allow them to email themselves a download link.
    
    
	/*if (buttonIndex == 1) {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"put your php url here"]];
     
     }*/
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.title = @"Connection List";
    self.services = nil;
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.services = nil;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    /*
//     When a row is selected, the segue creates the detail view controller as the destination.
//     Set the detail view controller's detail item to the item associated with the selected row.
//     */
//    if ([[segue identifier] isEqualToString:@"ShowSelectedPlay"]) {
//        
////        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
//        serverRunningVC = [segue destinationViewController];
//        
//    }
//}


- (NSMutableArray *)services {
    if(nil == _services) {
        self.services = [NSMutableArray array];
    }
    return _services;
}

- (void)addService:(NSNetService *)service moreComing:(BOOL)more {
    [self.services addObject:service];
    if(!more) {
        [self.tableView reloadData];
    }
}

- (void)removeService:(NSNetService *)service moreComing:(BOOL)more {
    [self.services removeObject:service];
    if(!more) {
        [self.tableView reloadData];
    }
}

#pragma mark Server Delegate Methods

- (void)serverRemoteConnectionComplete:(Server *)server {
    NSLog(@"Server Started");
    // this is called when the remote side finishes joining with the socket as
    // notification that the other side has made its connection with this side
    serverRunningVC.server = server;
    NSLog(@"%@", self.navigationController);
    AppDelegate *appdegate = [[AppDelegate alloc]init];
//    self.navigationController = (UINavigationController *)appdegate.window.rootViewController.navigationController;
//    [self.navigationController pushViewController:serverRunningVC animated:YES];
    [(UINavigationController *)appdegate.window.rootViewController.navigationController pushViewController:serverRunningVC animated:YES];
}

- (void)serverStopped:(Server *)server {
    NSLog(@"Server stopped");
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
    [self addService:service moreComing:more];
}

- (void)serviceRemoved:(NSNetService *)service moreComing:(BOOL)more {
    [self removeService:service moreComing:more];
}

#pragma mark -
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Computers";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.services.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }
    
    cell.text = [[self.services objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.server connectToRemoteService:[self.services objectAtIndex:indexPath.row]];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}



@end
