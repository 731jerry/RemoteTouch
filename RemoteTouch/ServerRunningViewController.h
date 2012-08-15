//
//  ServerRunningViewController.h
//  NetworkingTesting
//
//  Created by Bill Dudney on 2/20/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Server;
@interface ServerRunningViewController : UIViewController{
	
	IBOutlet UISegmentedControl *segments;
	
	//UI
	IBOutlet UIButton *iTunesPlay;
	IBOutlet UIButton *iTunesPause;
	IBOutlet UIButton *iTunesNext;
	IBOutlet UIButton *iTunesPrevious;
	IBOutlet UIButton *iTunesVolumeUp;
	IBOutlet UIButton *iTunesVolumeDown;	
	IBOutlet UIButton *iTunesSearch;	

	IBOutlet UIButton *vol1;
	IBOutlet UIButton *vol2;
	IBOutlet UIButton *vol3;
	IBOutlet UIButton *vol4;
	
	IBOutlet UIButton *cmdA;
	IBOutlet UIButton *cmdC;
	IBOutlet UIButton *cmdV;
	IBOutlet UIButton *cmdZ;
	IBOutlet UIButton *cmdH;
	IBOutlet UIButton *cmdT;
	IBOutlet UIButton *cmdQ;
	IBOutlet UIButton *up;
	IBOutlet UIButton *down;
	IBOutlet UIButton *left;
	IBOutlet UIButton *right;
	IBOutlet UIButton *Delete;
	IBOutlet UIButton *Enter;
	IBOutlet UIButton *shutDown;
	
	/*IBOutlet UIButton *a;
	IBOutlet UIButton *b;
	IBOutlet UIButton *c;
	IBOutlet UIButton *d;
	IBOutlet UIButton *e;
	IBOutlet UIButton *f;
	IBOutlet UIButton *g;
	IBOutlet UIButton *h;
	IBOutlet UIButton *i;
	IBOutlet UIButton *j;
	IBOutlet UIButton *k;
	IBOutlet UIButton *l;
	IBOutlet UIButton *m;
	IBOutlet UIButton *n;
	IBOutlet UIButton *o;
	IBOutlet UIButton *p;
	IBOutlet UIButton *q;
	IBOutlet UIButton *r;
	IBOutlet UIButton *s;
	IBOutlet UIButton *t;
	IBOutlet UIButton *u;
	IBOutlet UIButton *v;
	IBOutlet UIButton *w;
	IBOutlet UIButton *x;
	IBOutlet UIButton *y;
	IBOutlet UIButton *z;
	
	IBOutlet UIButton *period;
	IBOutlet UIButton *comma;
	IBOutlet UIButton *exclamation;
	IBOutlet UIButton *question;
	IBOutlet UIButton *carrot;
	IBOutlet UIButton *carrot1;
	IBOutlet UIButton *curlybracket1;
	IBOutlet UIButton *curlybracket2;
	IBOutlet UIButton *slash;
	IBOutlet UIButton *space;
	IBOutlet UIButton *enterKey;
	IBOutlet UIButton *deleteKey;
	IBOutlet UIButton *tab;*/
	
	IBOutlet UIButton *iTunes;
	IBOutlet UIButton *iPhoto;
	IBOutlet UIButton *iMovie;
	IBOutlet UIButton *iChat;
	IBOutlet UIButton *Safari;
	IBOutlet UIButton *Terminal;
	IBOutlet UIButton *Prefs;

	
	IBOutlet UIButton *KeynoteNext;
	IBOutlet UIButton *KeynoteBack;
	IBOutlet UIButton *KeynoteClosePresentation;
	
	IBOutlet UIButton *DvdPlay;
	IBOutlet UIButton *DvdPause;
	IBOutlet UIButton *DvdResume;
	IBOutlet UIButton *DvdStop;
	
	IBOutlet UIButton *Capture;
	IBOutlet UIImageView *captureImage;
	
    __weak IBOutlet UIButton *touchPad;
    
	NSString *_message;
	Server *_server;
	
}

@property(nonatomic, retain) NSString *message;
@property(nonatomic, retain) Server *server;



- (IBAction)switchAction:(id)sender;


//ITUNES
- (IBAction) iTunesPlay;
- (IBAction) iTunesPause;
- (IBAction) iTunesNext;
- (IBAction) iTunesPrevious;
- (IBAction) iTunesVolumeUp;
- (IBAction) iTunesVolumeDown;
- (IBAction) FinderVol1;
- (IBAction) FinderVol2;
- (IBAction) FinderVol3;
- (IBAction) FinderVol4;

//SHORTCUTS

-(IBAction) cmdA;
-(IBAction) cmdH;
-(IBAction) cmdT;
-(IBAction) cmdC;
-(IBAction) cmdV;
-(IBAction) cmdZ;
-(IBAction) cmdQ;
-(IBAction) arrowU;
-(IBAction) arrowD;
-(IBAction) arrowL;
-(IBAction) arrowR;
-(IBAction) Delete;
-(IBAction) Enter;
-(IBAction) ShutDown;


// KEYBOARD


/*
- (IBAction) Akey;
- (IBAction) Bkey;
- (IBAction) Ckey;
- (IBAction) Dkey;
- (IBAction) Ekey;
- (IBAction) Fkey;
- (IBAction) Gkey;
- (IBAction) Hkey;
- (IBAction) Ikey;
- (IBAction) Jkey;
- (IBAction) Kkey;
- (IBAction) Lkey;
- (IBAction) Mkey;
- (IBAction) Nkey;
- (IBAction) Okey;
- (IBAction) Pkey;
- (IBAction) Qkey;
- (IBAction) Rkey;
- (IBAction) Skey;
- (IBAction) Tkey;
- (IBAction) Ukey;
- (IBAction) Vkey;
- (IBAction) Wkey;
- (IBAction) Xkey;
- (IBAction) Ykey;
- (IBAction) Zkey;
- (IBAction) SpaceKey;
- (IBAction) EnterKey;
- (IBAction) DeleteKey;
- (IBAction) Period;
- (IBAction) Comma;
- (IBAction) Slash;
- (IBAction) Question;
- (IBAction) Exclamation;
- (IBAction) Carrot;
- (IBAction) Carrot2;
- (IBAction) CurlyBracket;
- (IBAction) CurlyBracket2;
- (IBAction) Tab;
*/
- (IBAction) iTunes;
- (IBAction) iPhoto;
- (IBAction) iMovie;
- (IBAction) iChat;
- (IBAction) Safari;
- (IBAction) Terminal;
- (IBAction) Prefs;



- (IBAction) KeynoteNext;
- (IBAction) KeynoteBack;
- (IBAction) KeynoteClosePresentation;

- (IBAction) DvdPlay;
- (IBAction) DvdPause;
- (IBAction) DvdResume;
- (IBAction) DvdStop;

- (IBAction) iSightCapture;


- (IBAction)touchPad:(id)sender;

@end
