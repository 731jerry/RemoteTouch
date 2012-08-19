//
//  ServerRunningViewController.h
//  NetworkingTesting
//
//  Created by Bill Dudney on 2/20/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Server;
@interface ServerRunningViewController : UIViewController <UITextFieldDelegate>{
	
    BOOL hiddenKeyboard;
    BOOL hiddenAdditionalKeyToolBar;
    BOOL hiddenOtherKeyToolBar;
    BOOL hiddenshortcutToolbar;
//    UITextField *keyboardField;
    __weak IBOutlet UITextField *keyboardField;
    UIToolbar *keyboardShortcutToolbar;
    UIToolbar *keyboardAdditionalKeyToolBar;
    UIToolbar *keyboardOtherKeyToolBar;
    
    UIToolbar *shortcutToolbarForTouchpad1;
    UIToolbar *shortcutToolbarForTouchpad2;
    
//    UIToolbar *keyboardToolbar;
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
	
	IBOutlet UIButton *iTunes;
	IBOutlet UIButton *iPhoto;
	IBOutlet UIButton *iMovie;
	IBOutlet UIButton *iChat;
	IBOutlet UIButton *Safari;
	IBOutlet UIButton *Terminal;
	IBOutlet UIButton *Prefs;

	
	IBOutlet UIButton *KeynoteNext;
	IBOutlet UIButton *KeynoteBack;
    __weak IBOutlet UIButton *KeynoteExitPresentation;
    __weak IBOutlet UIButton *KeynoteBeginFromFirstPage;
    __weak IBOutlet UIButton *KeynoteBeginFromCurrentPage;
	
	
    __weak IBOutlet UIButton *gamePlayUpButton;
    __weak IBOutlet UIButton *gamePlayRightButton;
    __weak IBOutlet UIButton *gamePlayDButton;
    __weak IBOutlet UIButton *gamePlayBButton;
    __weak IBOutlet UIButton *gamePlayAButton;
    __weak IBOutlet UIButton *gamePlayCButton;
    __weak IBOutlet UIButton *gamePlayLeftButton;
    __weak IBOutlet UIButton *gamePlayDownButton;
    
    
    __weak IBOutlet UITextField *appleScriptInputText;
    __weak IBOutlet UILabel *appleScriptLabel1;
    __weak IBOutlet UILabel *appleScriptLabel2;
    __weak IBOutlet UIButton *showKeyboardButton;
    __weak IBOutlet UIButton *sendAppleScriptButton;
    
    __weak IBOutlet UIView *touchView;
    __weak IBOutlet UIButton *touchViewLeftClick;
    __weak IBOutlet UIButton *touchViewRightClick;
    __weak IBOutlet UIButton *touchViewShowKeyboardButton;
    
	NSString *_message;
	Server *_server;
	
}

@property(nonatomic, retain) NSString *message;
@property(nonatomic, retain) Server *server;
@property (strong, nonatomic) IBOutlet UIView *serverRunningView;



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

//SHORTCUTS..

- (IBAction)shiftButtonAction;

- (IBAction) iTunes;
- (IBAction) iPhoto;
- (IBAction) iMovie;
- (IBAction) iChat;
- (IBAction) Safari;
- (IBAction) Terminal;
- (IBAction) Prefs;

- (IBAction) KeynoteNext;
- (IBAction) KeynoteExit;
- (IBAction) KeynoteBeginFromFirstPage;
- (IBAction) KeynoteBeginFromCurrentPage;
- (IBAction) KeynoteBack;
- (IBAction) KeynoteClosePresentation;

- (IBAction)gamePlayUpArrow;
- (IBAction)gamePlayRightArrow;
- (IBAction)gamePlayLeftArrow;
- (IBAction)gamePlayDownArrow;
- (IBAction)gamePlayA;
- (IBAction)gamePlayB;
- (IBAction)gamePlayC;
- (IBAction)gamePlayD;

- (IBAction) iSightCapture;

- (IBAction)sendKeyboard:(id)sender;
- (IBAction)sendAppleScript;
- (IBAction)touchViewLeftClickAction:(id)sender;
- (IBAction)touchViewRightClickAction:(id)sender;
- (IBAction)touchViewShowKeyboardButtonAction;

- (IBAction)appleScriptInputToCallKeyBoard:(UITextField *)sender;




@end
