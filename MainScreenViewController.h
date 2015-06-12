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
#import <AVFoundation/AVFoundation.h>  //seems to not need Core Audio - this is enough to run the players, even on a real device

@interface MainScreenViewController : UIViewController  <AVAudioPlayerDelegate>

@property  globalSettingsObject *mainPageSettings;

- (void)displayNameStyle;

//these  3 could be private?
@property (nonatomic) IntervalClass *anInterval;
@property (strong) AVAudioPlayer* player1;
@property (strong) AVAudioPlayer* player2;



@end
