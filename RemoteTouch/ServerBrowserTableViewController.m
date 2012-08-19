//
//  ViewController.m
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//



#import "ServerBrowserTableViewController.h"

@interface ServerBrowserTableViewController(){
    BOOL openedConnectedView;
}
@property(nonatomic, retain) NSMutableArray *services;
@end

@implementation ServerBrowserTableViewController

@synthesize services = _services;
@synthesize server = _server;
@synthesize delegate = _delegate;
@synthesize selectedTableViewName = _selectedTableViewName;

- (void) viewDidLoad {
	
    //This pops up when the user starts the app and tells them to download the MacRemote desktop tool
    
//     UIAlertView *alertTest = [[UIAlertView alloc]
//     initWithTitle:@"Hello"
//     message:@"No you can control your mac"
//     delegate:self
//     cancelButtonTitle:@"dismiss"
//     otherButtonTitles:nil];
//     [alertTest addButtonWithTitle:@"Okey"];
//     [alertTest show];
   
    
//    NSString *type = @"TestingProtocol";
//    _server = [[Server alloc] initWithProtocol:type];
//    //_server.delegate = self;
//    NSError *error = nil;
//    if(![_server start:&error]) {
//        NSLog(@"error = %@", error);
//    }
//    else{
//        NSLog(@"server start in 1 view");
//    }
	openedConnectedView = NO;
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
    self.title = [[UIDevice currentDevice] name];
    self.services = nil;
    [self.tableView reloadData];
    [_server stop];
}

- (void) viewDidAppear:(BOOL)animated{
    
//    if (_server.isConnectSuccessfully == YES) {
//        
//        NSLog(@"_server.isConnectSuccessfully");
//        NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
//    }
//    else {
//        NSLog(@"!_server.isConnectSuccessfully");
//        [self.delegate navigationBarToBeDisconnected:self];
//        NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
//    }
//    if (self.services == nil) {
//        [self.delegate navigationBarToBeDisconnected:self];
//        NSLog(@"services == nil");
//    }
//    else {
//        [self.delegate navigationBarToBeReadyToConnceted:self];
//        NSLog(@"services != nil");
//    }
    openedConnectedView = NO;
    [self manageServers:nil];
}

- (void)manageServers:(NSString *)name {
//	if (_ownName != name) {
//		_ownName = [name copy];
//		
//		if (self.ownEntry)
//			[self.services addObject:self.ownEntry];
//		
//		NSNetService* service;
//		
//		for (service in self.services) {
//			if ([service.name isEqual:name]) {
//				self.ownEntry = service;
//				[_services removeObject:service];
//				break;
//			}
//		}
//		
//		[self.tableView reloadData];
//	}
    
    if (_server.isConnectSuccessfully == YES) {
        
        NSLog(@"_server.isConnectSuccessfully");
        NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
    }
    else {
        NSLog(@"!_server.isConnectSuccessfully");
        [self.delegate navigationBarToBeDisconnected:self];
        NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
    }
//    if (self.services == nil) {
//        [self.delegate navigationBarToBeDisconnected:self];
//        NSLog(@"services == nil");
//    }
//    else {
//        [self.delegate navigationBarToBeReadyToConnceted:self];
//        NSLog(@"services != nil");
//    }
    
//    if ([self.services count] == 0) {
//        [self.delegate navigationBarToBeDisconnected:self];
//        NSLog(@"services == nil");
//    }
//    if (self.services == nil) {
//        [self.delegate navigationBarToBeReadyToConnceted:self];
//        NSLog(@"services = nil");
//    }
//    if (self.services != nil) {
//        <#statements#>
//    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.services = nil;
    
//    NSString *type = @"TestingProtocol";
//    _server = [[Server alloc] initWithProtocol:type];
    //_server.delegate = self;
    //    NSError *error = nil;
//    [_server stop];
    openedConnectedView = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
//    openedConnectedView = NO;
}

- (NSMutableArray *)services {
    if(nil == _services) {
        self.services = [NSMutableArray array];
    }
    return _services;
}

- (void)addService:(NSNetService *)service moreComing:(BOOL)more {
    if (![service.name isEqualToString:[[UIDevice currentDevice] name]]) {
        [self.delegate navigationBarToBeReadyToConnceted:self];
        [self.services addObject:service];
        if(!more) {
            [self.tableView reloadData];
        }
        
//        [self manageServers:[[UIDevice currentDevice] name]];
    }
}

- (void)removeService:(NSNetService *)service moreComing:(BOOL)more {
    if ([self.services count] > 0){
        [self.delegate navigationBarToBeReadyToConnceted:self];
        NSLog(@"servers count = %d",self.services.count);
        [self.services removeObject:service];
        NSLog(@"servers count = %d",self.services.count);
        if(!more) {
            [self.tableView reloadData];
        }
    }
    if ([self.services count] == 0){
        if (!openedConnectedView) {
            [self.delegate navigationBarToBeDisconnected:self];
            NSLog(@"servers count == 0");
        }
    }
//    [self manageServers:[[UIDevice currentDevice] name]];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Mac Computer list";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.services.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] ;
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.services objectAtIndex:indexPath.row] name];
    
//    NSLog(@"cell text: %@",cell.textLabel.text);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.server connectToRemoteService:[self.services objectAtIndex:indexPath.row]];
    NSLog(@"didSelectRowAtIndexPath self.services >>> %@", [self.services objectAtIndex:indexPath.row]);
    NSLog(@"selected");
//    self.services = nil;
    self.selectedTableViewName = (NSString *)[[self.services objectAtIndex:indexPath.row] name];
    openedConnectedView = YES;
    [self.delegate navigationBarToBeConnected:self];
    
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}



@end
