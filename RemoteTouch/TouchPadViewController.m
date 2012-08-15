//
//  TouchPadViewController.m
//  RemoteTouch
//
//  Created by Jerry Zhu on 8/14/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import "TouchPadViewController.h"

@interface TouchPadViewController ()

@end

@implementation TouchPadViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillDisappear:(BOOL)animated{
   
}
- (void) viewDidDisappear:(BOOL)animated{
//    NSString *type = @"TestingProtocol";
//    _server = [[Server alloc] initWithProtocol:type];
//    //_server.delegate = self;
//    //    NSError *error = nil;
//    [_server stop];
    
    NSLog(@"server stoped from touch pad viewcontroller");
    NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
