//
//  MainScreenViewController.h
//  Intervalix
//
//  Created by David Casini on 4/27/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "globalSettingsObject.h"
#import "IntervalClass.h"
#import <AVFoundation/AVFoundation.h> 

@interface MainScreenViewController : UIViewController  <AVAudioPlayerDelegate>

@property  globalSettingsObject *mainPageSettings;  //this needs to be seen by Options page

- (void)displayNameStyle;

@property (nonatomic) IntervalClass *anInterval;
@property (strong) AVAudioPlayer* player1;
@property (strong) AVAudioPlayer* player2;

- (IBAction)playInterval:(id)sender;
- (IBAction)repeatInterval:(id)sender;

-(void)killPlayers;

@end
