//
//  ServerRunningViewController.m
//  NetworkingTesting
//
//  Created by Bill Dudney on 2/20/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import "ServerRunningViewController.h"
#import "Server.h"

@interface ServerRunningViewController()
 
@end
@implementation ServerRunningViewController{

}

@synthesize message = _message;
@synthesize server = _server;

//@synthesize delegate = _delegate;

#pragma mark -
#pragma mark view
- (void) viewDidLoad{
    
}

- (void) viewDidAppear:(BOOL)animated{
    
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
    
    NSLog(@"server stoped from server running viewcontroller");
    NSLog(@"connecttion successful? - %@",_server.isConnectSuccessfully ? @"True":@"False");
}


#pragma mark -
- (IBAction)switchAction:(id)sender {
	
	if (segments.selectedSegmentIndex == 0) {
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
		
		cmdA.hidden = YES;
		cmdC.hidden = YES;		
		cmdZ.hidden = YES;
		cmdV.hidden = YES;
		cmdT.hidden = YES;
		cmdH.hidden = YES;
		cmdQ.hidden = YES;
		up.hidden = YES;
		down.hidden = YES;
		left.hidden = YES;
		right.hidden = YES;
		Delete.hidden = YES;
		Enter.hidden = YES;
		shutDown.hidden = YES;
		
	/*	a.hidden = YES;
		b.hidden = YES;
		c.hidden = YES;
		d.hidden = YES;
		e.hidden = YES;
		f.hidden = YES;
		g.hidden = YES;
		h.hidden = YES;
		i.hidden = YES;
		j.hidden = YES;
		k.hidden = YES;
		l.hidden = YES;
		m.hidden = YES;
		n.hidden = YES;
		o.hidden = YES;
		p.hidden = YES;
		q.hidden = YES;
		r.hidden = YES;
		s.hidden = YES;
		t.hidden = YES;
		u.hidden = YES;
		v.hidden = YES;
		w.hidden = YES;
		x.hidden = YES;
		y.hidden = YES;
		z.hidden = YES;
		
		period.hidden = YES;
		comma.hidden = YES;
		question.hidden = YES;
		exclamation.hidden = YES;
		carrot.hidden = YES;
		carrot1.hidden = YES;
		slash.hidden = YES;
		curlybracket1.hidden = YES;
		curlybracket2.hidden = YES;
		space.hidden = YES;
		tab.hidden = YES;
		enterKey.hidden = YES;
		deleteKey.hidden = YES;*/
		
		iTunes.hidden = YES;
		iPhoto.hidden = YES;
		iMovie.hidden = YES;
		iChat.hidden = YES;
		Safari.hidden = YES;
		
		Terminal.hidden = YES;
		Prefs.hidden = YES;
		
		KeynoteBack.hidden = YES;
		KeynoteNext.hidden=YES;
		KeynoteClosePresentation.hidden = YES;
		
		DvdPlay.hidden = YES;
		DvdPause.hidden = YES;
		DvdResume.hidden = YES;
		DvdStop.hidden = YES;
		
		Capture.hidden = YES;
		captureImage.hidden = YES;
		
	}
	
	
	if (segments.selectedSegmentIndex == 1) {
		
		/*a.hidden = YES;
		b.hidden = YES;
		c.hidden = YES;
		d.hidden = YES;
		e.hidden = YES;
		f.hidden = YES;
		g.hidden = YES;
		h.hidden = YES;
		i.hidden = YES;
		j.hidden = YES;
		k.hidden = YES;
		l.hidden = YES;
		m.hidden = YES;
		n.hidden = YES;
		o.hidden = YES;
		p.hidden = YES;
		q.hidden = YES;
		r.hidden = YES;
		s.hidden = YES;
		t.hidden = YES;
		u.hidden = YES;
		v.hidden = YES;
		w.hidden = YES;
		x.hidden = YES;
		y.hidden = YES;
		z.hidden = YES;
		
		period.hidden = YES;
		comma.hidden = YES;
		question.hidden = YES;
		exclamation.hidden = YES;
		carrot.hidden = YES;
		carrot1.hidden = YES;
		slash.hidden = YES;
		curlybracket1.hidden = YES;
		curlybracket2.hidden = YES;
		space.hidden = YES;
		tab.hidden = YES;
		enterKey.hidden = YES;
		deleteKey.hidden = YES;*/
		
		cmdA.hidden = NO;
		cmdC.hidden = NO;
		cmdZ.hidden = NO;
		cmdV.hidden = NO;
		cmdT.hidden = NO;
		cmdH.hidden = NO;
		cmdQ.hidden = NO;
		up.hidden = NO;
		down.hidden = NO;
		left.hidden = NO;
		right.hidden = NO;
		Delete.hidden = NO;
		Enter.hidden = NO;
		shutDown.hidden = NO;
		
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
		
		iTunes.hidden = YES;
		iPhoto.hidden = YES;
		iMovie.hidden = YES;
		iChat.hidden = YES;
		Terminal.hidden = YES;
		Prefs.hidden = YES;
		Safari.hidden = YES;
		
		KeynoteBack.hidden = YES;
		KeynoteNext.hidden=YES;
		KeynoteClosePresentation.hidden = YES;
		
		DvdPlay.hidden = YES;
		DvdPause.hidden = YES;
		DvdResume.hidden = YES;
		DvdStop.hidden = YES;
		
		
		Capture.hidden = YES;
		captureImage.hidden = YES;
		
	}
	
	
	if (segments.selectedSegmentIndex == 2) {
		
		/*a.hidden = NO;
		b.hidden = NO;
		c.hidden = NO;
		d.hidden = NO;
		e.hidden = NO;
		f.hidden = NO;
		g.hidden = NO;
		h.hidden = NO;
		i.hidden = NO;
		j.hidden = NO;
		k.hidden = NO;
		l.hidden = NO;
		m.hidden = NO;
		n.hidden = NO;
		o.hidden = NO;
		p.hidden = NO;
		q.hidden = NO;
		r.hidden = NO;
		s.hidden = NO;
		t.hidden = NO;
		u.hidden = NO;
		v.hidden = NO;
		w.hidden = NO;
		x.hidden = NO;
		y.hidden = NO;
		z.hidden = NO;
		
		period.hidden = NO;
		comma.hidden = NO;
		question.hidden = NO;
		exclamation.hidden = NO;
		carrot.hidden = NO;
		carrot1.hidden = NO;
		slash.hidden = NO;
		curlybracket1.hidden = NO;
		curlybracket2.hidden = NO;
		space.hidden = NO;
		tab.hidden = NO;
		enterKey.hidden = NO;
		deleteKey.hidden = NO;
		*/
		
		cmdA.hidden = YES;
		cmdC.hidden = YES;
		cmdZ.hidden = YES;
		cmdV.hidden = YES;
		cmdT.hidden = YES;
		cmdH.hidden = YES;
		cmdQ.hidden = YES;
		up.hidden = YES;
		down.hidden = YES;
		left.hidden = YES;
		right.hidden = YES;
		Delete.hidden = YES;
		Enter.hidden = YES;
		shutDown.hidden = YES;
		
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
		
		
		iTunes.hidden = YES;
		iPhoto.hidden = YES;
		iMovie.hidden = YES;
		iChat.hidden = YES;
		Safari.hidden = YES;
		
	
		
		Terminal.hidden = YES;
		Prefs.hidden = YES;
		
		DvdPlay.hidden = YES;
		DvdPause.hidden = YES;
		DvdResume.hidden = YES;
		DvdStop.hidden = YES;
		
		Capture.hidden = YES;
		captureImage.hidden = YES;
		
		
		KeynoteBack.hidden = NO;
		KeynoteNext.hidden=NO;
		KeynoteClosePresentation.hidden = NO;
	}
	
	if (segments.selectedSegmentIndex == 3) {
		/*a.hidden = YES;
		b.hidden = YES;
		c.hidden = YES;
		d.hidden = YES;
		e.hidden = YES;
		f.hidden = YES;
		g.hidden = YES;
		h.hidden = YES;
		i.hidden = YES;
		j.hidden = YES;
		k.hidden = YES;
		l.hidden = YES;
		m.hidden = YES;
		n.hidden = YES;
		o.hidden = YES;
		p.hidden = YES;
		q.hidden = YES;
		r.hidden = YES;
		s.hidden = YES;
		t.hidden = YES;
		u.hidden = YES;
		v.hidden = YES;
		w.hidden = YES;
		x.hidden = YES;
		y.hidden = YES;
		z.hidden = YES;
		
		period.hidden = YES;
		comma.hidden = YES;
		question.hidden = YES;
		exclamation.hidden = YES;
		carrot.hidden = YES;
		carrot1.hidden = YES;
		slash.hidden = YES;
		curlybracket1.hidden = YES;
		curlybracket2.hidden = YES;
		space.hidden = YES;
		tab.hidden = YES;
		enterKey.hidden = YES;
		deleteKey.hidden = YES;
		*/
		
		cmdA.hidden = YES;
		cmdC.hidden = YES;
		cmdZ.hidden = YES;
		cmdV.hidden = YES;
		cmdT.hidden = YES;
		cmdH.hidden = YES;
		cmdQ.hidden = YES;
		up.hidden = YES;
		down.hidden = YES;
		left.hidden = YES;
		right.hidden = YES;
		Delete.hidden = YES;
		Enter.hidden = YES;
		
		
		
		cmdA.hidden = YES;
		cmdC.hidden = YES;
		cmdZ.hidden = YES;
		cmdV.hidden = YES;
		cmdT.hidden = YES;
		cmdH.hidden = YES;
		cmdQ.hidden = YES;
		up.hidden = YES;
		down.hidden = YES;
		left.hidden = YES;
		right.hidden = YES;
		Delete.hidden = YES;
		Enter.hidden = YES;
		shutDown.hidden = YES;
		
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
	
		KeynoteBack.hidden = YES;
		KeynoteNext.hidden=YES;
		KeynoteClosePresentation.hidden = YES;
		
		
		Capture.hidden = YES;
		captureImage.hidden = YES;
		
		DvdPlay.hidden = NO;
		DvdPause.hidden = NO;
		DvdResume.hidden = NO;
		DvdStop.hidden = NO;
	}
	
	if (segments.selectedSegmentIndex == 4) {
		/*a.hidden = YES;
		 b.hidden = YES;
		 c.hidden = YES;
		 d.hidden = YES;
		 e.hidden = YES;
		 f.hidden = YES;
		 g.hidden = YES;
		 h.hidden = YES;
		 i.hidden = YES;
		 j.hidden = YES;
		 k.hidden = YES;
		 l.hidden = YES;
		 m.hidden = YES;
		 n.hidden = YES;
		 o.hidden = YES;
		 p.hidden = YES;
		 q.hidden = YES;
		 r.hidden = YES;
		 s.hidden = YES;
		 t.hidden = YES;
		 u.hidden = YES;
		 v.hidden = YES;
		 w.hidden = YES;
		 x.hidden = YES;
		 y.hidden = YES;
		 z.hidden = YES;
		 
		 period.hidden = YES;
		 comma.hidden = YES;
		 question.hidden = YES;
		 exclamation.hidden = YES;
		 carrot.hidden = YES;
		 carrot1.hidden = YES;
		 slash.hidden = YES;
		 curlybracket1.hidden = YES;
		 curlybracket2.hidden = YES;
		 space.hidden = YES;
		 tab.hidden = YES;
		 enterKey.hidden = YES;
		 deleteKey.hidden = YES;
		 */
		
		cmdA.hidden = YES;
		cmdC.hidden = YES;
		cmdZ.hidden = YES;
		cmdV.hidden = YES;
		cmdT.hidden = YES;
		cmdH.hidden = YES;
		cmdQ.hidden = YES;
		up.hidden = YES;
		down.hidden = YES;
		left.hidden = YES;
		right.hidden = YES;
		Delete.hidden = YES;
		Enter.hidden = YES;
		
		
		
		cmdA.hidden = YES;
		cmdC.hidden = YES;
		cmdZ.hidden = YES;
		cmdV.hidden = YES;
		cmdT.hidden = YES;
		cmdH.hidden = YES;
		cmdQ.hidden = YES;
		up.hidden = YES;
		down.hidden = YES;
		left.hidden = YES;
		right.hidden = YES;
		Delete.hidden = YES;
		Enter.hidden = YES;
		shutDown.hidden = YES;
		
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
		
		KeynoteBack.hidden = YES;
		KeynoteNext.hidden=YES;
		KeynoteClosePresentation.hidden = YES;
		
		DvdPlay.hidden = YES;
		DvdPause.hidden = YES;
		DvdResume.hidden = YES;
		DvdStop.hidden = YES;
		
		Capture.hidden = NO;
		captureImage.hidden = NO;
	}
	
	else {
		
	}
	
}

- (IBAction)iTunesPlay {
	NSString *messageText = [NSString stringWithFormat:@"iTunesPlay"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) iTunesPause {
	NSString *messageText = [NSString stringWithFormat:@"iTunesPause"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) iTunesNext {
	NSString *messageText = [NSString stringWithFormat:@"iTunesNext"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) iTunesPrevious {
	NSString *messageText = [NSString stringWithFormat:@"iTunesPrevious"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) iTunesVolumeUp {
	NSString *messageText = [NSString stringWithFormat:@"iTunesVolumeUp"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) iTunesVolumeDown {
	NSString *messageText = [NSString stringWithFormat:@"iTunesVolumeDown"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) FinderVol1 {
	NSString *messageText = [NSString stringWithFormat:@"FinderVol1"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) FinderVol2 {
	NSString *messageText = [NSString stringWithFormat:@"FinderVol2"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) FinderVol3 {
	NSString *messageText = [NSString stringWithFormat:@"FinderVol3"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) FinderVol4 {
	NSString *messageText = [NSString stringWithFormat:@"FinderVol4"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}


-(IBAction) cmdA {
	NSString *messageText = [NSString stringWithFormat:@"cmdA"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) cmdH {
	NSString *messageText = [NSString stringWithFormat:@"cmdH"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) cmdT {
	NSString *messageText = [NSString stringWithFormat:@"cmdT"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) cmdC {
	NSString *messageText = [NSString stringWithFormat:@"cmdC"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) cmdV {
	NSString *messageText = [NSString stringWithFormat:@"cmdV"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) cmdQ {
	NSString *messageText = [NSString stringWithFormat:@"cmdQ"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) cmdZ {
	NSString *messageText = [NSString stringWithFormat:@"cmdZ"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) arrowU { 
	NSString *messageText = [NSString stringWithFormat:@"arrowU"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) arrowD {
	NSString *messageText = [NSString stringWithFormat:@"arrowD"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) arrowL {
	NSString *messageText = [NSString stringWithFormat:@"arrowL"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) arrowR {
	NSString *messageText = [NSString stringWithFormat:@"arrowR"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
-(IBAction) Delete {
	NSString *messageText = [NSString stringWithFormat:@"Delete"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

-(IBAction) Enter {
	NSString *messageText = [NSString stringWithFormat:@"Enter"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}




- (IBAction) Akey {
	NSString *messageText = [NSString stringWithFormat:@"a"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Bkey {
	NSString *messageText = [NSString stringWithFormat:@"b"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Ckey {
	NSString *messageText = [NSString stringWithFormat:@"c"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Dkey {
	NSString *messageText = [NSString stringWithFormat:@"d"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Ekey {
	NSString *messageText = [NSString stringWithFormat:@"e"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Fkey {
	NSString *messageText = [NSString stringWithFormat:@"f"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Gkey {
	NSString *messageText = [NSString stringWithFormat:@"g"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Hkey {
	NSString *messageText = [NSString stringWithFormat:@"h"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Ikey {
	NSString *messageText = [NSString stringWithFormat:@"i"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Jkey {
	NSString *messageText = [NSString stringWithFormat:@"j"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Kkey {
	NSString *messageText = [NSString stringWithFormat:@"k"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Lkey {
	NSString *messageText = [NSString stringWithFormat:@"l"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Mkey {
	NSString *messageText = [NSString stringWithFormat:@"m"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Nkey {
	NSString *messageText = [NSString stringWithFormat:@"n"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Okey {
	NSString *messageText = [NSString stringWithFormat:@"o"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Pkey {
	NSString *messageText = [NSString stringWithFormat:@"p"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Qkey {
	NSString *messageText = [NSString stringWithFormat:@"q"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Rkey {
	NSString *messageText = [NSString stringWithFormat:@"r"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Skey {
	NSString *messageText = [NSString stringWithFormat:@"s"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Tkey {
	NSString *messageText = [NSString stringWithFormat:@"t"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Ukey {
	NSString *messageText = [NSString stringWithFormat:@"u"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Vkey {
	NSString *messageText = [NSString stringWithFormat:@"v"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Wkey {
	NSString *messageText = [NSString stringWithFormat:@"w"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Xkey {
	NSString *messageText = [NSString stringWithFormat:@"x"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Ykey {
	NSString *messageText = [NSString stringWithFormat:@"y"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];	
}
- (IBAction) Zkey {
	NSString *messageText = [NSString stringWithFormat:@"z"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) SpaceKey {
	NSString *messageText = [NSString stringWithFormat:@"space"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) EnterKey {
	NSString *messageText = [NSString stringWithFormat:@"Enter"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) DeleteKey {
	NSString *messageText = [NSString stringWithFormat:@"Delete"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Period {
	NSString *messageText = [NSString stringWithFormat:@"."];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Comma {
	NSString *messageText = [NSString stringWithFormat:@","];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Slash {
	NSString *messageText = [NSString stringWithFormat:@"/"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Question {
	NSString *messageText = [NSString stringWithFormat:@"?"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Exclamation {
	NSString *messageText = [NSString stringWithFormat:@"!"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Carrot {
	NSString *messageText = [NSString stringWithFormat:@"<"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Carrot2 {
	NSString *messageText = [NSString stringWithFormat:@">"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) CurlyBracket {
	NSString *messageText = [NSString stringWithFormat:@"{"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) CurlyBracket2 {
	NSString *messageText = [NSString stringWithFormat:@"}"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) Tab {
	NSString *messageText = [NSString stringWithFormat:@"Tab"];
	NSData *data = [messageText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
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

- (IBAction) KeynoteNext {
	NSString *actionText = [NSString stringWithFormat:@"KeynoteNext"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) KeynoteBack {
	NSString *actionText = [NSString stringWithFormat:@"KeynoteBack"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) DvdPlay {
	NSString *actionText = [NSString stringWithFormat:@"DvdPlay"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) DvdPause {
	NSString *actionText = [NSString stringWithFormat:@"DvdPause"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) DvdResume {
	NSString *actionText = [NSString stringWithFormat:@"DvdResume"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}
- (IBAction) DvdStop {
	NSString *actionText = [NSString stringWithFormat:@"DvdStop"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}

- (IBAction) iSightCapture {
	NSString *actionText = [NSString stringWithFormat:@"iSightCapture"];
	NSData *data = [actionText dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	[self.server sendData:data error:&error];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}



@end
