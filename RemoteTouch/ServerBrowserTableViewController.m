//
//  ViewController.m
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//



#import "ServerBrowserTableViewController.h"

@interface ServerBrowserTableViewController()
@property(nonatomic, retain) NSMutableArray *services;
@end

@implementation ServerBrowserTableViewController

@synthesize services = _services;
@synthesize server = _server;

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
//        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] ;
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.services objectAtIndex:indexPath.row] name];
    
    NSLog(@"cell text: %@",cell.textLabel.text);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.server connectToRemoteService:[self.services objectAtIndex:indexPath.row]];
    NSLog(@"selected");
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}



@end
