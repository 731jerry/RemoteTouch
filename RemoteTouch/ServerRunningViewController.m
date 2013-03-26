//
//  ServerRunningViewController.m
//  NetworkingTesting
//
//  Created by Jerry Zhu on 8/13/12.
//  Copyright (c) 2012 Jerry Zhu. All rights reserved.
//

#import "ServerRunningViewController.h"
#import "Server.h"

@interface ServerRunningViewController()

@property (nonatomic) CGPoint touchLastLocation;
@property (nonatomic) CGFloat accumulatedDistanceForX;
@property (nonatomic) CGFloat accumulatedDistanceForY;
@end
@implementation ServerRunningViewController{

}

@synthesize message = _message;
@synthesize server = _server;
@synthesize serverRunningView = _serverRunningView;
@synthesize accumulatedDistanceForX = _accumulatedDistanceForX;
@synthesize accumulatedDistanceForY = _accumulatedDistanceForY;

@synthesize touchLastLocation = _touchLastLocation;

//@synthesize keyboardToolbar = _keyboardToolbar;

#pragma mark -
#pragma mark view
- (void) viewDidLoad{
    
    keyboardField.hidden = YES;
    hiddenKeyboard = YES;
    hiddenAdditionalKeyToolBar = YES;
    hiddenOtherKeyToolBar = YES;
    
    keyboardField.delegate = self;
//    [keyboardField becomeFirstResponder];
//    [self.serverRunningView addSubview:touchView];
//    self.serverRunningView.exclusiveTouch = NO;
    
    self.title = self.message;
}

- (void) viewDidAppear:(BOOL)animated{

    [self switchAction:self];
    keyboardField.hidden = YES;
    hiddenKeyboard = YES;
    keyboardField.delegate = self;
    
    hiddenAdditionalKeyToolBar = YES;
    hiddenOtherKeyToolBar = YES;
    
    [shortcutToolbarForTouchpad1 removeFromSuperview];
    [shortcutToolbarForTouchpad2 removeFromSuperview];
    hiddenshortcutToolbar = YES;
    
    touchView.exclusiveTouch = NO;
//    [self respondToHideShortcutToolbar];
    [showKeyboardButton setTitle:@"Show Shortcuts" forState:UIControlStateNormal];
    
    NSString * messageFinal = [@"Connection To: " stringByAppendingString:[[UIDevice currentDevice] name]];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}

- (void) viewWillAppear:(BOOL)animated{
//    segments.selectedSegmentIndex = 0;
//    touchView.hidden = YES;
    [keyboardField resignFirstResponder];
    [self addKeyboardToolBar];
    segments.selectedSegmentIndex = 0;
    [self hiddenAll];
    [self switchAction:self];
}

- (void) viewWillDisappear:(BOOL)animated{

        
        //This pops up when the user starts the app and tells them to download the MacRemote desktop tool
        
//        UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"exit" message:@"Are you sure to disconnect the server" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
//        
//        [alertTest addButtonWithTitle:@"Okey"];
//        
//        [alertTest show];
   
}

- (void) viewDidDisappear:(BOOL)animated{
    
//    [[ad.navigationController navigationBar] setTintColor:[UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f]];
    
//    [self.delegate navigationBarToRed:self];
//    NSLog(@"bar to red");
    
//    NSString *type = @"TestingProtocol";
//    _server = [[Server alloc] initWithProtocol:type];
//    //_server.delegate = self;
//    //    NSError *error = nil;
//    [_server stop];
    
    [_server stop];//
    NSLog(@"server stoped from server running viewcontroller");
    NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
}


#pragma mark -
#pragma mark only for touch pad

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
if (touchView.exclusiveTouch) {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    self.touchLastLocation = [touch locationInView:touchView];

    [touchView setMultipleTouchEnabled:YES];
    self.accumulatedDistanceForX = 0;
    self.accumulatedDistanceForY = 0;
    
    NSUInteger numTaps = [touch tapCount];
    
    float delay = 0.1;
        
    if ([touches count] < 2){
        NSLog(@">>> 1 touch");
        if (numTaps < 2)
        {
            NSLog(@">>> 1 tap");
            [self performSelector:@selector(handleOneFingerSingleTap) withObject:nil afterDelay:delay ];
            // [self.nextResponder touchesEnded:touches withEvent:event];
        }
        else if(numTaps == 2)
        {
            NSLog(@">>> 2 tap");
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
            [self performSelector:@selector(handleOneFingerDoubleTap) withObject:nil afterDelay:delay ];
        }
    } else if ([touches count] == 2){
        NSLog(@">>> 2 touch");
        if (numTaps < 2)
        {
            NSLog(@">>> 1 tap");
//            [self performSelector:@selector(handleTwoFingerSingleTap) withObject:nil afterDelay:delay ];
        }
    }
}
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
if (touchView.exclusiveTouch) {
	// get touch event
    // touch.tapCount means how many taps
    // [touch count] means how many fingers
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
	CGPoint touchLocation = [touch locationInView:touchView];
    CGPoint prevTouchLocation = [touch previousLocationInView:touchView];
    
    if (touchLocation.x < 0.0f) {
        touchLocation.x = 0.0f;
    } else if (touchLocation.x > touchView.bounds.size.width){
        touchLocation.x = touchView.bounds.size.width;
    }
    if (touchLocation.y <0.0f){
        touchLocation.y = 0.0f;
    } else if (touchLocation.y > touchView.bounds.size.height){
        touchLocation.y = touchView.bounds.size.height;
    }
    
    if ([touches count] < 2) {
        NSLog(@"touch count == 1");
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleOneFingerSingleTap) object:nil];
        [self handleOneFingerMoveWithCoordinateOffset:(touchLocation.x - prevTouchLocation.x) :(touchLocation.y - prevTouchLocation.y)];
    }
    else if ([touches count] == 2){
        NSLog(@"touch count == 2");
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleTwoFingerSingleTap) object:nil];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleOneFingerSingleTap) object:nil];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleOneFingerMove:) object:nil];
        
        CGFloat verticalDistance = touchLocation.y - prevTouchLocation.y;
        NSLog(@"verticalrunning:%f",touchLocation.y - prevTouchLocation.y);
        CGFloat horizontalDistance = touchLocation.x - prevTouchLocation.x;
        NSLog(@"horizontalrunning:%f",touchLocation.x - prevTouchLocation.x);
        if (fabs(verticalDistance) > fabs(horizontalDistance)) {
            NSLog(@"verticalDistance running:%f",verticalDistance);
            [self handleTwoFingerMoveVertical:verticalDistance];
        } else {
            NSLog(@"horizontalDistance running:%f",horizontalDistance);
            [self handleTwoFingerMoveHorizontal:horizontalDistance];
        }
//        [self handleTwoFingerScrolling:horizontalDistance with:verticalDistance];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleTwoFingerSingleTap) object:nil];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleOneFingerSingleTap) object:nil];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleOneFingerMove:) object:nil];
    }
   
    self.touchLastLocation = touchLocation;
}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (touchView.exclusiveTouch) {
        [super touchesEnded:touches withEvent:event];
        NSLog(@"touches ended");
    }
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

// move
- (void) handleOneFingerMove:(CGPoint) touchLocation{
    NSLog(@"handleOneFingerMove");
    [self sendTouchLocation:touchLocation];
}
- (void) handleOneFingerMoveWithCoordinateOffset:(CGFloat) offsetX :(CGFloat) offsetY{
    NSLog(@"handleOneFingerMove with offset");
    [self sendTouchLocationCoordinateOffset:offsetX :offsetY];
}

- (void) handleOneFingerMoveWithOffsetDistance:(CGFloat) distance{
    NSLog(@"handleOneFingerMove With Offset Distance");
    [self sendTouchLocationOffsetDistance:distance];
}

// scrolling
- (void) handleTwoFingerScrolling:(CGFloat) x with:(CGFloat) y{
    [self sendWheelScrolling:x with:y];
}

- (void) handleTwoFingerMoveVertical:(CGFloat) verticalDistance{
    NSLog(@"handleTwoFingerMove -- scrolling");
    [self sendScrollVerticalDistance:verticalDistance];
    
}

- (void) handleTwoFingerMoveHorizontal:(CGFloat) horizontalDistance{
    NSLog(@"handleTwoFingerMove -- scrolling");
    [self sendScrollHorizontalDistance:horizontalDistance];
    
}
- (void) sendWheelScrolling:(CGFloat)x with:(CGFloat) y{
    NSString * messageFinal = [NSString stringWithFormat:@"Scroll:%f+%f",x,y];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}

- (void) sendScrollVerticalDistance:(CGFloat) verticalDistance{
    NSString *messageText = [NSString stringWithFormat:@"%f",verticalDistance];
    NSString * messageFinal = [@"VerticalDistance:" stringByAppendingString:messageText];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}
- (void) sendScrollHorizontalDistance:(CGFloat) horizontalDistance{
    NSString *messageText = [NSString stringWithFormat:@"%f",horizontalDistance];
    NSString * messageFinal = [@"HorizontalDistance:" stringByAppendingString:messageText];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}
- (void) sendTouchLocation:(CGPoint) touchLocation{
    NSString *locationXString = [NSString stringWithFormat:@"%f", touchLocation.x];
    NSString *locationYString = [NSString stringWithFormat:@"%f", touchLocation.y];
    NSString *location = [[locationXString stringByAppendingString:@"+"] stringByAppendingString:locationYString];
    
    NSString *messageText = location;
    NSString * messageFinal = [@"Location:" stringByAppendingString:messageText];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}

- (void) sendTouchLocationCoordinateOffset:(CGFloat) offsetX :(CGFloat) offsetY{
    NSString *locationXString = [NSString stringWithFormat:@"%f", offsetX];
    NSString *locationYString = [NSString stringWithFormat:@"%f", offsetY];
    NSString *location = [[locationXString stringByAppendingString:@"+"] stringByAppendingString:locationYString];
    
    NSString *messageText = location;
    NSString * messageFinal = [@"LocCoorOffset:" stringByAppendingString:messageText];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}

- (void) sendTouchLocationOffsetDistance:(CGFloat) distance{
    NSString *messageText = [NSString stringWithFormat:@"%f",distance];
    NSString * messageFinal = [@"LocOffsetDis:" stringByAppendingString:messageText];
	NSData *data = [messageFinal dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
    NSLog(@"%@",data);
	[self.server sendData:data error:&error];
}

// left click
-(void)handleOneFingerSingleTap
{
    NSLog(@"handleOneFingerSingleTap");
    [self sendComparableDataWithString:@"OneFingerSingleTap"];
}

// double click
-(void)handleOneFingerDoubleTap
{
    NSLog(@"handleOneFingerDoubleTap");
    [self sendComparableDataWithString:@"OneFingerDoubleTap"];
}

// right click
- (void) handleTwoFingerSingleTap{
    NSLog(@"handleTwoFingerSingleTap");
    [self sendComparableDataWithString:@"TwoFingerSingleTap"];
}


#pragma mark -
#pragma mark actions 

- (void) hiddenAll{
    touchView.exclusiveTouch = NO;
    touchView.hidden = YES;
    touchViewLeftClick.hidden = YES;
    touchViewRightClick.hidden = YES;
    touchViewShowKeyboardButton.hidden = YES;
    
    iTunesPlay.hidden = YES;
    iTunesPause.hidden = YES;
    iTunesNext.hidden = YES;
    iTunesPrevious.hidden = YES;
    iTunesVolumeUp.hidden = YES;
    iTunesVolumeDown.hidden = YES;
    iTunesSearch.hidden = YES;
    
    vol1.hidden = YES;
    vol2.hidden = YES;
    vol3.hidden = YES;
    vol4.hidden = YES;
    
    gamePlayAButton.hidden = YES;
    gamePlayBButton.hidden = YES;
    gamePlayCButton.hidden = YES;
    gamePlayDButton.hidden = YES;
    gamePlayUpButton.hidden = YES;
    gamePlayDownButton.hidden = YES;
    gamePlayLeftButton.hidden = YES;
    gamePlayRightButton.hidden = YES;
    
    showKeyboardButton.hidden = YES;
    appleScriptLabel1.hidden = YES;
    appleScriptLabel2.hidden = YES;
    sendAppleScriptButton.hidden = YES;
    appleScriptInputText.hidden = YES;
    
    KeynoteBack.hidden = YES;
    KeynoteNext.hidden= YES;
    KeynoteBeginFromCurrentPage.hidden = YES;
    KeynoteBeginFromFirstPage.hidden = YES;
    KeynoteExitPresentation.hidden = YES;
    
    [keyboardField resignFirstResponder];
    [appleScriptInputText resignFirstResponder];
    [keyboardAdditionalKeyToolBar removeFromSuperview];
    [keyboardOtherKeyToolBar removeFromSuperview];
    hiddenAdditionalKeyToolBar = YES;
    hiddenOtherKeyToolBar = YES;
    hiddenKeyboard = YES;
}

- (IBAction)switchAction:(id)sender{
    switch (segments.selectedSegmentIndex) {
        case 1:
            [self hiddenAll];
            touchView.exclusiveTouch = YES;
            touchView.hidden = NO;
            touchViewLeftClick.hidden = NO;
            touchViewRightClick.hidden = NO;
            touchViewShowKeyboardButton.hidden = NO;
            
            [shortcutToolbarForTouchpad1 removeFromSuperview];
            [shortcutToolbarForTouchpad2 removeFromSuperview];
            hiddenshortcutToolbar = YES;
            break;
        case 4:
            [self hiddenAll];
            touchView.exclusiveTouch = NO;
            showKeyboardButton.hidden = NO;
            sendAppleScriptButton.hidden = NO;
            appleScriptLabel1.hidden = NO;
            appleScriptLabel2.hidden = NO;
            appleScriptInputText.hidden = NO;
            
            [keyboardField becomeFirstResponder]; // show keyboard
            [self.view addSubview:keyboardAdditionalKeyToolBar];
            [self.view addSubview:keyboardOtherKeyToolBar];
            hiddenAdditionalKeyToolBar = NO;
            hiddenOtherKeyToolBar = NO;
            hiddenKeyboard = NO;
            
            break;
        case 3:
            [self hiddenAll];
            touchView.exclusiveTouch = NO;
            
            gamePlayAButton.hidden = NO;
            gamePlayBButton.hidden = NO;
            gamePlayCButton.hidden = NO;
            gamePlayDButton.hidden = NO;
            gamePlayUpButton.hidden = NO;
            gamePlayDownButton.hidden = NO;
            gamePlayLeftButton.hidden = NO;
            gamePlayRightButton.hidden = NO;
            
            [shortcutToolbarForTouchpad1 removeFromSuperview];
            [shortcutToolbarForTouchpad2 removeFromSuperview];
            hiddenshortcutToolbar = YES;
            break;
        case 2:
            [self hiddenAll];
            touchView.exclusiveTouch = NO;
            
            KeynoteBack.hidden = NO;
            KeynoteNext.hidden=NO;
            KeynoteBeginFromCurrentPage.hidden = NO;
            KeynoteBeginFromFirstPage.hidden = NO;
            KeynoteExitPresentation.hidden = NO;
            
            [shortcutToolbarForTouchpad1 removeFromSuperview];
            [shortcutToolbarForTouchpad2 removeFromSuperview];
            hiddenshortcutToolbar = YES;
            break;
        default:
            [self hiddenAll];
            touchView.exclusiveTouch = NO;
            iTunesPlay.hidden = NO;
            iTunesPause.hidden = NO;
            iTunesNext.hidden = NO;
            iTunesPrevious.hidden = NO;
            iTunesVolumeUp.hidden = NO;
            iTunesVolumeDown.hidden = NO;
            iTunesSearch.hidden = NO;
            vol1.hidden = NO;
            vol2.hidden = NO;
            vol3.hidden = NO;
            vol4.hidden = NO;
            
            [shortcutToolbarForTouchpad1 removeFromSuperview];
            [shortcutToolbarForTouchpad2 removeFromSuperview];
            hiddenshortcutToolbar = YES;
            break;
    }
}

- (IBAction)iTunesPlay {
	[self sendComparableDataWithString:@"iTunesPlay"];
}

- (IBAction) iTunesPause {
	[self sendComparableDataWithString:@"iTunesPause"];
}
- (IBAction) iTunesNext {
	[self sendComparableDataWithString:@"iTunesNext"];
}
- (IBAction) iTunesPrevious {
	[self sendComparableDataWithString:@"iTunesPrevious"];
}
- (IBAction) iTunesVolumeUp {
	[self sendComparableDataWithString:@"iTunesVolumeUp"];
}
- (IBAction) iTunesVolumeDown {
	[self sendComparableDataWithString:@"iTunesVolumeDown"];
}

- (IBAction) FinderVol1 {
	[self sendComparableDataWithString:@"FinderVol1"];
}
- (IBAction) FinderVol2 {
	[self sendComparableDataWithString:@"FinderVol2"];
}
- (IBAction) FinderVol3 {
	[self sendComparableDataWithString:@"FinderVol3"];
}
- (IBAction) FinderVol4 {
	[self sendComparableDataWithString:@"FinderVol4"];
}


-(IBAction) cmdA {
	[self sendComparableDataWithString:@"cmdA"];
}
-(IBAction) cmdH {
	[self sendComparableDataWithString:@"cmdH"];
}
-(IBAction) cmdT {
	[self sendComparableDataWithString:@"cmdT"];
}
-(IBAction) cmdC {
	[self sendComparableDataWithString:@"cmdC"];
}
-(IBAction) cmdV {
	[self sendComparableDataWithString:@"cmdV"];
}
-(IBAction) cmdQ {
	[self sendComparableDataWithString:@"cmdQ"];
}
-(IBAction) cmdZ {
	[self sendComparableDataWithString:@"cmdZ"];
}

- (IBAction) iTunes {	
	NSString *actionText = [NSString stringWithFormat:@"iTunes"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) iPhoto {	
	NSString *actionText = [NSString stringWithFormat:@"iPhoto"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) iMovie {	
	NSString *actionText = [NSString stringWithFormat:@"iMovie"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) iChat{	
	NSString *actionText = [NSString stringWithFormat:@"iChat"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) Safari {	
	NSString *actionText = [NSString stringWithFormat:@"Safari"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Terminal {	
	NSString *actionText = [NSString stringWithFormat:@"Terminal"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Prefs {	
	NSString *actionText = [NSString stringWithFormat:@"Prefs"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) ShutDown {	
	NSString *actionText = [NSString stringWithFormat:@"ShutDown"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
	
}

- (IBAction)shiftButtonAction {
    [self sendComparableDataWithString:@"shiftButtonAction"];
}

- (IBAction) KeynoteNext {
	[self sendComparableDataWithString:@"KeynoteNext"];
}

- (IBAction)KeynoteExit {
    // ExitPresentation
    [self sendComparableDataWithString:@"ExitPresentation"];
}

- (IBAction)KeynoteBeginFromFirstPage {
    [self sendComparableDataWithString:@"PresentationBeginFromFirstPage"];
}

- (IBAction)KeynoteBeginFromCurrentPage {
    [self sendComparableDataWithString:@"PresentationBeginFromCurrentPage"];
}

- (IBAction) KeynoteBack {
	[self sendComparableDataWithString:@"KeynoteBack"];
}


- (IBAction)gamePlayUpArrow {
    [self sendComparableDataWithString:@"gamePlayUpArrow"];
}

- (IBAction)gamePlayRightArrow {
    [self sendComparableDataWithString:@"gamePlayRightArrow"];
}

- (IBAction)gamePlayLeftArrow {
    [self sendComparableDataWithString:@"gamePlayLeftArrow"];
}

- (IBAction)gamePlayDownArrow {
    [self sendComparableDataWithString:@"gamePlayDownArrow"];
}

- (IBAction)gamePlayA {
    [self sendComparableDataWithString:@"gamePlayA"];
}

- (IBAction)gamePlayB {
    [self sendComparableDataWithString:@"gamePlayB"];
}

- (IBAction)gamePlayC {
    [self sendComparableDataWithString:@"gamePlayC"];
}

- (IBAction)gamePlayD {
    [self sendComparableDataWithString:@"gamePlayD"];
}


//-(BOOL)textFieldShouldReturn:(UITextField*)textField; {
//    textField.hidden = YES;
//    [textField resignFirstResponder];
//    [showKeyboardButton setTitle:nil forState:UIControlEventEditingDidEndOnExit];
//    return YES;
//}
#pragma  mark -
#pragma  mark keyboard delegate

- (IBAction)sendKeyboard:(id)sender {
    if (hiddenKeyboard) {
		[showKeyboardButton setTitle:@"Hide keyboard" forState:UIControlStateNormal];
        [keyboardField becomeFirstResponder];
        [self.view addSubview:keyboardOtherKeyToolBar];
        [self.view addSubview:keyboardAdditionalKeyToolBar];
        hiddenKeyboard = NO;
        hiddenAdditionalKeyToolBar = NO;
        hiddenOtherKeyToolBar = NO;
	} else {
		[showKeyboardButton setTitle:@"Show keyboard" forState:UIControlStateNormal];
        [keyboardField resignFirstResponder];
        [keyboardAdditionalKeyToolBar removeFromSuperview];
        [keyboardOtherKeyToolBar removeFromSuperview];
        hiddenAdditionalKeyToolBar = YES;
        hiddenOtherKeyToolBar = YES;
        hiddenKeyboard = YES;
	}
}

- (IBAction)sendAppleScript {
    
}

- (IBAction)touchViewLeftClickAction:(id)sender {
    [self handleOneFingerSingleTap];
}

- (IBAction)touchViewRightClickAction:(id)sender {
    [self handleTwoFingerSingleTap];
}

- (IBAction)touchViewShowKeyboardButtonAction {
    [self addShortcutToolbar];
}

- (void) addShortcutToolbar{
    if (hiddenshortcutToolbar) {
        shortcutToolbarForTouchpad1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 110, self.view.bounds.size.width, 38.0f)];
        [shortcutToolbarForTouchpad1 setBarStyle:UIBarStyleBlackTranslucent];
        shortcutToolbarForTouchpad1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        // shortcutToolbarForTouchpad2
        shortcutToolbarForTouchpad2 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 148, self.view.bounds.size.width, 38.0f)];
        [shortcutToolbarForTouchpad2 setBarStyle:UIBarStyleBlackTranslucent];
        shortcutToolbarForTouchpad2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        // up, down, left and right arrow button
        UIBarButtonItem *UpArrowKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"↑", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayUpArrow)];
        UIBarButtonItem *DownArrowKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"↓", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayDownArrow)];
        UIBarButtonItem *LeftArrowKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"←", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayLeftArrow)];
        UIBarButtonItem *RightKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"→", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayRightArrow)];
        
        UIBarButtonItem *fFiveKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F5", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFFiveKey)];
        UIBarButtonItem *fSixKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F6", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFSixKey)];
        
        UIBarButtonItem *brightDownKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"☼", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToBrightDownKey)];
        UIBarButtonItem *brightUpKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"☀", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToBrightUpKey)];
        UIBarButtonItem *missionControlKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"^↑", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToMissionControlKey)];
        
        
        UIBarButtonItem *newFileKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"+F", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToNewFileKey)];
        UIBarButtonItem *commandDeleteKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘Del", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandDeleteKey)];
        
        UIBarButtonItem *commandSpaceKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘␣", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandSpaceKey)];
        UIBarButtonItem *commandQKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘Q", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandQKey)];
        
        UIBarButtonItem *commandHKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘H", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandHKey)];
        
        UIBarButtonItem *desktopGoLeftKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"^←", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToDesktopGoLeftKey)];
        
        UIBarButtonItem *desktopGoRightKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"^→", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToDesktopGoRightKey)];
        
        [shortcutToolbarForTouchpad1 setItems:[NSArray arrayWithObjects:commandHKeyBarItem,commandSpaceKeyBarItem, desktopGoLeftKeyBarItem, desktopGoRightKeyBarItem,missionControlKeyBarItem, fFiveKeyBarItem, fSixKeyBarItem,nil]];
        
        [shortcutToolbarForTouchpad2 setItems:[NSArray arrayWithObjects:UpArrowKeyBarItem, DownArrowKeyBarItem, LeftArrowKeyBarItem, RightKeyBarItem, newFileKeyBarItem, commandDeleteKeyBarItem, commandQKeyBarItem, brightDownKeyBarItem, brightUpKeyBarItem,nil]];
        [self.view addSubview:shortcutToolbarForTouchpad1];
        [self.view addSubview:shortcutToolbarForTouchpad2];
        
        [showKeyboardButton setTitle:@"Hide Shortcuts" forState:UIControlStateNormal];
        hiddenshortcutToolbar = NO;
    }
    else {
        [showKeyboardButton setTitle:@"Show Shortcuts" forState:UIControlStateNormal];
        [shortcutToolbarForTouchpad1 removeFromSuperview];
        [shortcutToolbarForTouchpad2 removeFromSuperview];
        hiddenshortcutToolbar = YES;
    }
}
- (IBAction)appleScriptInputToCallKeyBoard:(UITextField *)sender {
    NSLog(@"apple script is editing %d", sender.editing);
    [appleScriptInputText becomeFirstResponder];
}

//- (IBAction)appleScriptInputToCallKeyBoard:(UITextField *)sender {
//    NSLog(@"is editing %d", sender.editing);
//}

//- (IBAction)appleScriptInputToCallKeyBoard {
//    [keyboardField becomeFirstResponder];
//    NSLog(@"appleScriptInputToCallKeyBoard");
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	textField.text = @" ";
//    NSLog(@"is editing %d", textField.editing);
    [keyboardField becomeFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {  

//	NSTimeInterval timestamp = [NSDate timeIntervalSinceReferenceDate];

#warning cause stack overflow
    /*
    Terminating app due to uncaught exception 'NSRangeException', reason: '-[__NSCFConstantString characterAtIndex:]: Range or index out of bounds'
    *** First throw call stack:
     */
//    if ((int32_t)[string characterAtIndex:0] == '\n'){ // return
//        NSLog(@"it is a return");
//        NSString *finalString = @"KeyboardReturnCode";
//        NSData *data = [finalString dataUsingEncoding:NSUTF8StringEncoding];
//        NSError *error = nil;
//        [self.server sendData:data error:&error];
//    }
    
	if ([string isEqualToString:@""]) { // backspace

        NSString *finalString = @"KeyboardBackSpaceCode";
        NSData *data = [finalString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        [self.server sendData:data error:&error];
	}
    
    else {

        NSString *finalString = [@"KeyboardCode:" stringByAppendingString:string];
        NSData *data = [finalString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        [self.server sendData:data error:&error];
        
//        int32_t  value = [string characterAtIndex:0];
//        finalString = [NSString stringWithFormat:@"KeyboardCode:%d",value];
//        data = [finalString dataUsingEncoding:NSUTF8StringEncoding];
//        [self.server sendData:data error:&error];
//        NSLog(@"data: %@",finalString);
	}
	return FALSE;
}

#pragma mark -
#pragma mark keyboard tool bar
- (void) addKeyboardToolBar{
    // Keyboard toolbar
    if (keyboardShortcutToolbar == nil && keyboardAdditionalKeyToolBar == nil) {
    // keyboardShortcutToolbar
        keyboardShortcutToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 35.0f)];
        keyboardShortcutToolbar.barStyle = UIBarStyleBlackTranslucent;
        
        
        UIBarButtonItem *commandCKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘C", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandCKey)];
        UIBarButtonItem *commandVKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘V", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandVKey)];
        UIBarButtonItem *commandZKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘Z", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandZKey)];
        
        UIBarButtonItem *commandSpaceKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘␣", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandSpaceKey)];
        
        UIBarButtonItem *shiftKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⇪", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToShiftKey)];
        
        UIBarButtonItem *returnKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"↵ ", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToReturnKey)];
        
        UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *addshortcutToolBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⬆", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(toShowAdditionalKeyToolBar)];

        UIBarButtonItem *hideKeyboardBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Hide", @"") style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard:)];
        
        [keyboardShortcutToolbar setItems:[NSArray arrayWithObjects:commandCKeyBarItem, commandVKeyBarItem, commandZKeyBarItem, commandSpaceKeyBarItem, shiftKeyBarItem, returnKeyBarItem,spaceBarItem, addshortcutToolBarItem,hideKeyboardBarItem,nil]];
        
        keyboardField.inputAccessoryView = keyboardShortcutToolbar;
        appleScriptInputText.inputAccessoryView = keyboardShortcutToolbar;
        
    // keyAddtionalKeyToolBar 
        keyboardAdditionalKeyToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 284, self.view.bounds.size.width, 35.0f)];
        [keyboardAdditionalKeyToolBar setBarStyle:UIBarStyleBlackTranslucent];
        keyboardAdditionalKeyToolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        
        UIBarButtonItem *tabPreviousBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⇤", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToTabPrevious:)];
        UIBarButtonItem *tabNextBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⇥", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToTabNext:)];
        UIBarButtonItem *commandQKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘Q", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandQKey)];
        UIBarButtonItem *commandTKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘T", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandTKey)];
        
//        UIBarButtonItem *fOneKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F1", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFOneKey)];
//        UIBarButtonItem *fTwoKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F2", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFTwoKey)];
//        UIBarButtonItem *fThreeKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F3", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFThreeKey)];
        
        UIBarButtonItem *fFiveKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F5", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFFiveKey)];
        UIBarButtonItem *fSixKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"F6", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToFSixKey)];
        
        UIBarButtonItem *brightDownKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"☼", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToBrightDownKey)];
        UIBarButtonItem *brightUpKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"☀", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToBrightUpKey)];
        UIBarButtonItem *missionControlKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"^↑", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToMissionControlKey)];
        
        [keyboardAdditionalKeyToolBar setItems:[NSArray arrayWithObjects:tabPreviousBarItem, tabNextBarItem, spaceBarItem, commandQKeyBarItem, commandTKeyBarItem, brightDownKeyBarItem, brightUpKeyBarItem, missionControlKeyBarItem, fFiveKeyBarItem, fSixKeyBarItem, nil]];
        
    // keyboardOtherKeyToolBar
        keyboardOtherKeyToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 319, self.view.bounds.size.width, 35.0f)];
        [keyboardOtherKeyToolBar setBarStyle:UIBarStyleBlackTranslucent];
        keyboardOtherKeyToolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        // command A
        UIBarButtonItem *commandAKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘A", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandAKey)];
        UIBarButtonItem *commandHKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘H", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandHKey)];
        
        UIBarButtonItem *newFileKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"+F", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToNewFileKey)];
        UIBarButtonItem *commandDeleteKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"⌘Del", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToCommandDeleteKey)];
        // ␣
        UIBarButtonItem *spaceKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"␣", @"") style:UIBarButtonItemStylePlain target:self action:@selector(respondToSpaceKey)];
        
        // up, down, left and right arrow button
        UIBarButtonItem *UpArrowKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"↑", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayUpArrow)];
        UIBarButtonItem *DownArrowKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"↓", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayDownArrow)];
        UIBarButtonItem *LeftArrowKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"←", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayLeftArrow)];
        UIBarButtonItem *RightKeyBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"→", @"") style:UIBarButtonItemStylePlain target:self action:@selector(gamePlayRightArrow)];
        
        [keyboardOtherKeyToolBar setItems:[NSArray arrayWithObjects:commandAKeyBarItem, commandHKeyBarItem, spaceKeyBarItem,UpArrowKeyBarItem, DownArrowKeyBarItem, LeftArrowKeyBarItem, RightKeyBarItem, spaceBarItem, commandDeleteKeyBarItem, newFileKeyBarItem, nil]];
    }
}

- (void) respondToDesktopGoLeftKey{
    [self sendComparableDataWithString:@"DesktopGoLeft"];
}
- (void) respondToDesktopGoRightKey{
    [self sendComparableDataWithString:@"DesktopGoRight"];
}
- (void) respondToCommandAKey{
    [self cmdA];
}
- (void) respondToCommandCKey{
    [self cmdC];
}
- (void) respondToCommandVKey{
    [self cmdV];
}
- (void) respondToCommandZKey{
    [self cmdZ];
}
- (void) respondToNewFileKey{
    [self sendComparableDataWithString:@"NewFile"];
}
- (void) respondToCommandDeleteKey{
    [self sendComparableDataWithString:@"CommandDelete"];
}
- (void) respondToBrightDownKey{
    [self sendComparableDataWithString:@"BrightDown"];
}
- (void) respondToBrightUpKey{
    [self sendComparableDataWithString:@"BrightUp"];
}
- (void) respondToMissionControlKey{
    [self sendComparableDataWithString:@"MissionControl"];
}
- (void) respondToReturnKey{
    [self sendComparableDataWithString:@"KeyboardReturnCode"];
}
- (void) respondToSpaceKey{
    [self sendComparableDataWithString:@"KeyboardSpaceCode"];
}
- (void) respondToCommandSpaceKey{
    [self sendComparableDataWithString:@"CommandSpaceKey"];
}
- (void) respondToShiftKey{
    [self shiftButtonAction];
}
- (void) respondToTabPrevious:(id) sender{
    [self sendComparableDataWithString:@"TabPrevious"];
}
- (void) respondToTabNext:(id) sender{
    [self sendComparableDataWithString:@"TabNext"];
}
- (void) respondToCommandQKey{
    [self cmdQ];
}
- (void) respondToCommandTKey{
    [self cmdT];
}
- (void) respondToCommandHKey{
    [self cmdH];
}
- (void) respondToFOneKey{
    [self sendComparableDataWithString:@"FOneKey"];
}
- (void) respondToFTwoKey{
    [self sendComparableDataWithString:@"FTwoKey"];
}
- (void) respondToFThreeKey{
    [self sendComparableDataWithString:@"FThreeKey"];
}
- (void) respondToFFiveKey{
    [self sendComparableDataWithString:@"FFiveKey"];
}
- (void) respondToFSixKey{
    [self sendComparableDataWithString:@"FSixKey"];
}
- (void) resignKeyboard:(id)sender{
    [keyboardField resignFirstResponder];
    [appleScriptInputText resignFirstResponder];
    [keyboardAdditionalKeyToolBar removeFromSuperview];
    [keyboardOtherKeyToolBar removeFromSuperview];
    hiddenOtherKeyToolBar = YES;
    hiddenAdditionalKeyToolBar = YES;
    hiddenKeyboard = YES;
}

- (void) toShowAdditionalKeyToolBar{
    if (hiddenAdditionalKeyToolBar) {
        [self.view addSubview:keyboardAdditionalKeyToolBar];
        
        if (hiddenOtherKeyToolBar) {
            [self.view addSubview:keyboardOtherKeyToolBar];
            hiddenOtherKeyToolBar = NO;
            hiddenAdditionalKeyToolBar = NO;
        }
    return;
    } else if (!hiddenOtherKeyToolBar && !hiddenAdditionalKeyToolBar) {
            [keyboardOtherKeyToolBar removeFromSuperview];
            hiddenOtherKeyToolBar = YES;
    return;
    } else if (hiddenOtherKeyToolBar && !hiddenAdditionalKeyToolBar) {
        [keyboardAdditionalKeyToolBar removeFromSuperview];
        hiddenAdditionalKeyToolBar = YES;
    return;
    }
}

- (void) sendComparableDataWithString:(NSString *)string{
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}



- (void)viewDidUnload {
    touchView = nil;
    KeynoteExitPresentation = nil;
    KeynoteBeginFromCurrentPage = nil;
    KeynoteBeginFromFirstPage = nil;
    gamePlayUpButton = nil;
    gamePlayRightButton = nil;
    gamePlayDButton = nil;
    gamePlayBButton = nil;
    gamePlayAButton = nil;
    gamePlayCButton = nil;
    gamePlayLeftButton = nil;
    gamePlayDownButton = nil;
    showKeyboardButton = nil;
    keyboardField = nil;
    [self setServerRunningView:nil];

    touchViewLeftClick = nil;
    touchViewRightClick = nil;
    appleScriptLabel1 = nil;
    appleScriptLabel2 = nil;
    sendAppleScriptButton = nil;
    appleScriptInputText = nil;
    KeynoteBeginFromFirstPage = nil;
    KeynoteBeginFromCurrentPage = nil;
    touchViewShowKeyboardButton = nil;
    
//    serverRunningVC = nil;
    
    [super viewDidUnload];
}
@end
