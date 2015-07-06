//
//  MainScreenViewController.m
//  Intervalix
//
//  Created by David Casini on 4/27/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "MainScreenViewController.h"
#import "OptionsViewController.h"
#import "globalSettingsObject.h"

@interface MainScreenViewController ()

- (IBAction)toOptions:(id)sender;

- (IBAction)playInterval:(id)sender;

- (IBAction)repeatInterval:(id)sender;

- (IBAction)minor2nd:(id)sender;    //interval value 1

- (IBAction)Major2nd:(id)sender;    //interval value 2

- (IBAction)minor3rd:(id)sender;    //interval value 3

- (IBAction)Major3rd:(id)sender;    //interval value 4

- (IBAction)Perfect4th:(id)sender;  //interval value 5

- (IBAction)TriTone:(id)sender;     //interval value 6

- (IBAction)Perfect5th:(id)sender;  //interval value 7

- (IBAction)minor6th:(id)sender;    //interval value 8

- (IBAction)Major6th:(id)sender;    //interval value 9

- (IBAction)minor7th:(id)sender;    //interval value 10

- (IBAction)Major7th:(id)sender;    //interval value 11

- (IBAction)Octave:(id)sender;      //interval value 12


@property (weak, nonatomic) IBOutlet UIButton *min2button;

@property (weak, nonatomic) IBOutlet UIButton *maj2button;

@property (weak, nonatomic) IBOutlet UIButton *min3button;

@property (weak, nonatomic) IBOutlet UIButton *maj3button;

@property (weak, nonatomic) IBOutlet UIButton *p4button;

@property (weak, nonatomic) IBOutlet UIButton *triToneButton;

@property (weak, nonatomic) IBOutlet UIButton *p5button;

@property (weak, nonatomic) IBOutlet UIButton *min6button;

@property (weak, nonatomic) IBOutlet UIButton *maj6button;

@property (weak, nonatomic) IBOutlet UIButton *min7button;

@property (weak, nonatomic) IBOutlet UIButton *maj7button;

@property (weak, nonatomic) IBOutlet UIButton *octaveButton;

@property (weak, nonatomic) IBOutlet UIButton *playIntervalButton;

@property (weak, nonatomic) IBOutlet UIButton *optionsButton;

@property (weak, nonatomic) IBOutlet UIButton *repeatButton;

@property UILabel *response;

@property BOOL dontShowWelcome;

@property NSInteger randomSeqBrkn;

@property NSInteger randomDirUp;

@property NSTimeInterval timeBetweenNotes;

@property NSTimeInterval timeBetweenIntervals;

@property SEL selectPlay;

@property SEL selectStop;

@property SEL selectDownUp;

@property SEL selectUpDown;

@property SEL selectSimultaneous;

@property SEL selectSelf;

@property SEL selectParseSequential;

@property NSString *upperNote;

@property NSString *lowerNote;

@property NSString *pathToUpperNote;

@property NSString *pathToLowerNote;

@property BOOL answersEnabled;

@property NSString *finishSource;

@property BOOL killingPlayers;

@end


@implementation MainScreenViewController

@synthesize player1;
@synthesize player2;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainPageSettings = [[globalSettingsObject alloc]init];
    
    //should come up with all response buttons disabled, enabled on one tap of 'Play'
    self.repeatButton.enabled = NO; //Repeat won't be enabled until at least one tap of 'Play'
    self.answersEnabled = NO;       //response buttons won't be enabled until at least one tap of 'Play'
    [self answersEnableDisable];
    
    self.killingPlayers = NO;
    
    self.anInterval = [[IntervalClass alloc] init];
    self.upperNote = self.anInterval.upperNote;
    self.lowerNote = self.anInterval.lowerNote;
    
    NSError *error;
    
    self.pathToUpperNote = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.upperNote];
    self.pathToLowerNote = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.lowerNote];
    player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:self.pathToUpperNote] error:&error];
    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:self.pathToLowerNote] error:&error];
    
    self.player1.delegate = self;
    self.player2.delegate = self;
    
    self.timeBetweenNotes = 0.5;
    self.timeBetweenIntervals = 1.9;
    self.selectPlay = @selector(play);
    self.selectStop = @selector(stop);
    self.selectSelf = @selector(self);
    self.selectParseSequential = @selector(parseSequential);
    self.selectUpDown = @selector(playUpDown);
    self.selectDownUp = @selector(playDownUp);
    self.selectSimultaneous = @selector(playSimultaneous);
    
    [self.playIntervalButton setTitle:@"?" forState:UIControlStateHighlighted];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        self.playIntervalButton.titleLabel.font = [UIFont systemFontOfSize: 100];
        self.repeatButton.titleLabel.font = [UIFont systemFontOfSize: 40];
        self.optionsButton.titleLabel.font = [UIFont systemFontOfSize: 40];
    }
    
    [self displayNameStyle];
}

-(void)viewDidAppear:(BOOL)animated    //must decide welcome AFTER rootView has appeared
{
    [super viewDidAppear:animated];
    if (self.mainPageSettings.displayWelcomeMessage && self.mainPageSettings.applicationJustOpened) {
        [self displayWelcome];
    }
}

- (void)displayNameStyle
{
    if (self.mainPageSettings.fullNameStyle) {
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
            [self defaultFontiPad];
        }
        [self.min2button setTitle: @" minor\nsecond" forState:UIControlStateNormal];
        [self.maj2button setTitle: @"  Major\nSecond" forState:UIControlStateNormal];
        [self.min3button setTitle: @"minor\n third" forState:UIControlStateNormal];
        [self.maj3button setTitle: @"Major\n Third" forState:UIControlStateNormal];
        [self.p4button setTitle: @"Perfect\n Fourth" forState:UIControlStateNormal];
        [self.triToneButton setTitle: @"TriTone" forState:UIControlStateNormal];
        [self.p5button setTitle: @"Perfect\n  Fifth" forState:UIControlStateNormal];
        [self.min6button setTitle: @"minor\n sixth" forState:UIControlStateNormal];
        [self.maj6button setTitle: @" Major\n  Sixth" forState:UIControlStateNormal];
        [self.min7button setTitle: @" minor\nseventh" forState:UIControlStateNormal];
        [self.maj7button setTitle: @"  Major\nSeventh" forState:UIControlStateNormal];
        [self.octaveButton setTitle: @"Octave" forState:UIControlStateNormal];
    }
    else {
        
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
            [self bigFontiPad];
        }
        [self.min2button setTitle: @"m2" forState:UIControlStateNormal];
        [self.maj2button setTitle: @"M2" forState:UIControlStateNormal];
        [self.min3button setTitle: @"m3" forState:UIControlStateNormal];
        [self.maj3button setTitle: @"M3" forState:UIControlStateNormal];
        [self.p4button setTitle: @"P4" forState:UIControlStateNormal];
        [self.triToneButton setTitle: @"TrTn" forState:UIControlStateNormal];
        [self.p5button setTitle: @"P5" forState:UIControlStateNormal];
        [self.min6button setTitle: @"m6" forState:UIControlStateNormal];
        [self.maj6button setTitle: @"M6" forState:UIControlStateNormal];
        [self.min7button setTitle: @"m7" forState:UIControlStateNormal];
        [self.maj7button setTitle: @"M7" forState:UIControlStateNormal];
        [self.octaveButton setTitle: @"P8" forState:UIControlStateNormal];
    }
}

-(void)defaultFontiPad
{
    self.min2button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.maj2button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.min3button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.maj3button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.p4button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.triToneButton.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.p5button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.min6button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.maj6button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.min7button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.maj7button.titleLabel.font = [UIFont systemFontOfSize: 50];
    self.octaveButton.titleLabel.font = [UIFont systemFontOfSize: 50];
}

-(void)bigFontiPad
{
 self.min2button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.maj2button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.min3button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.maj3button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.p4button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.triToneButton.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.p5button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.min6button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.maj6button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.min7button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.maj7button.titleLabel.font = [UIFont systemFontOfSize: 80];
    self.octaveButton.titleLabel.font = [UIFont systemFontOfSize: 80];
    
}

- (void)displayWelcome {
    
    NSString *welcomeMessage = @"Be sure you have adjusted the volume on your device.\n\nInstructions and configuration are available under Options.\n\n'Reset to Defaults' under Options will reenable this message at startup.";
    UIAlertController *welcomeAlert = [UIAlertController alertControllerWithTitle:@"Welcome to Intervalix"
                                                                   message:welcomeMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* dontShowAgain = [UIAlertAction actionWithTitle:@"Don't show this at startup"
                                                            style:UIAlertActionStyleDestructive
                                                                handler:^(UIAlertAction * action) {self.mainPageSettings.displayWelcomeMessage = NO;
                                                                    [self.mainPageSettings saveChanges];}];
    
    
    UIAlertAction* dismissButShowAgain = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action) {self.mainPageSettings.applicationJustOpened = NO;}];
    [welcomeAlert addAction:dontShowAgain];
    [welcomeAlert addAction:dismissButShowAgain];
    
    [self presentViewController:welcomeAlert animated:YES completion:nil];
}

- (IBAction)toOptions:(id)sender {
        OptionsViewController *optionsView = [[OptionsViewController alloc]init];
        optionsView.myPresenter = self;   //this will allow options to pass back to main screen
        optionsView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:optionsView animated:YES completion:nil];
}
////////////////////////////////////////////////////////////////////
-(void)killPlayers
{
    self.killingPlayers = YES;
    [player1 stop];
    [player1 stop];
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //not currently used
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)playInterval:(id)sender {           //create a new interval, use existing settings
    if ((player1.playing || player2.playing) && (self.killingPlayers = NO)){
        self.killingPlayers = YES;
        [player1 stop];
        [player1 stop];
    }
    else
    {
        [self.playIntervalButton setTitle:@"?" forState:UIControlStateNormal];
        self.killingPlayers = NO;
        [self playNew];
    }
}

-(void)playNew
{
    [self.response removeFromSuperview];
    self.repeatButton.enabled = YES;
    self.answersEnabled = YES;
    [self answersEnableDisable];
    
    self.anInterval = [[IntervalClass alloc] init];
    self.upperNote = self.anInterval.upperNote;
    self.lowerNote = self.anInterval.lowerNote;
    
    NSError *error;
    
    self.pathToUpperNote = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.upperNote];
    self.pathToLowerNote = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.lowerNote];
    self.player1 = [player1 initWithContentsOfURL:[NSURL fileURLWithPath:self.pathToUpperNote] error:&error];
    self.player2 = [player2 initWithContentsOfURL:[NSURL fileURLWithPath:self.pathToLowerNote] error:&error];
    self.player1.delegate = self;  //must 'RESET' the player delegates each time it is initialized
    self.player2.delegate = self;
    
    self.randomSeqBrkn = arc4random_uniform(2);  //returns 1 (sequential/broken) or 0 (simultaneous)
    self.randomDirUp = arc4random_uniform(2);  //returns 1 (up) or 0 (down)
    [self parseSettings:self.anInterval.lowerNote nextTone:self.anInterval.upperNote];
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)repeatInterval:(id)sender {
    if ((player1.playing || player2.playing) && (self.killingPlayers = NO)) {
        self.killingPlayers = YES;
        [player1 stop];
        [player1 stop];
    }
    else
    {
        [self.playIntervalButton setTitle:@"?" forState:UIControlStateNormal];
        self.killingPlayers = NO;
        [self playRepeat];
    }
}
-(void)playRepeat   //use existing interval & settings
{
    [self.response removeFromSuperview];
    [self parseSettings:self.anInterval.lowerNote nextTone:self.anInterval.upperNote];
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
-(void)playSimultaneous
{
    if (!self.killingPlayers) {
        [player1 play];
        [player2 play];
    }
}
///////////////////////////////////////////
-(void)playUpDown
{
    if (!self.killingPlayers)
    {
        [player1 play];
        [player2 prepareToPlay];
    }
    
    if (!self.killingPlayers)
    {
        [player2 performSelector:self.selectPlay
                      withObject:nil
                      afterDelay:self.timeBetweenNotes];
    }
}
///////////////////////////////////////////
-(void)playDownUp
{
   if (!self.killingPlayers)
   {
       [player2 play];
       [player1 prepareToPlay];
   }
    if (!self.killingPlayers)
    {
        [player1 performSelector:self.selectPlay
                      withObject:nil
                      afterDelay:self.timeBetweenNotes];
    }
}
///////////////////////////////////////////
- (void)parseSettings:(NSString *)lowerNote nextTone:(NSString *)upperNote
{
    //this block will be just simultaneous
    if (self.mainPageSettings.playSimultaneousOnly
        || self.mainPageSettings.playSimultaneousThenSequential
        || (self.mainPageSettings.playRandomSequentialOrSimultaneous && !self.randomSeqBrkn) )
    {
        if (!self.killingPlayers)
        {
            [self playSimultaneous];
        }
    }

    if (self.mainPageSettings.playSimultaneousThenSequential) {
        if (!self.killingPlayers)
        {
            [self performSelector:self.selectParseSequential
                       withObject:nil
                       afterDelay:self.timeBetweenIntervals - 0.5];
        }
    }
    
    if (self.mainPageSettings.playSequentialThenSimultaneous) {
        if (!self.killingPlayers)
        {
            [self parseSequential];
        }
        
        if (!self.killingPlayers)
        {
            NSTimeInterval doubleLength = self.timeBetweenIntervals;
            if (self.mainPageSettings.breakDownThenUp || self.mainPageSettings.breakUpThenDown) {
                doubleLength = (doubleLength * 2.0);
            }
            [self performSelector:self.selectSimultaneous
                       withObject:nil
                       afterDelay:doubleLength];
        }
    }
    
    if (self.mainPageSettings.playSequentialOnly
        || (self.mainPageSettings.playRandomSequentialOrSimultaneous && self.randomSeqBrkn))
    {
        if (!self.killingPlayers)
        {
            [self parseSequential];
        }
    }
}

-(void)parseSequential                                          //this block will handle the different sequential types
{
    [player1 stop];
    [player2 stop];
    
    if (self.mainPageSettings.breakUpOnly) {        //low to high
            if (!self.killingPlayers)
            {
                [self playDownUp];
            }
        }
        if (self.mainPageSettings.breakDownOnly) {      //high to low
            if (!self.killingPlayers)
            {
                [self playUpDown];
            }
        }
        if (self.mainPageSettings.breakUpThenDown) {            //lo-hi, then hi-lo
            if (!self.killingPlayers)
            {
                [self playDownUp];
            }
            
            if (!self.killingPlayers)
            {
                [self performSelector:self.selectUpDown
                           withObject:nil
                           afterDelay:self.timeBetweenIntervals];
            }
        }
        if (self.mainPageSettings.breakDownThenUp) {            //hi-lo, then lo-hi
            if (!self.killingPlayers)
            {
                [self playUpDown];
            }
            if (!self.killingPlayers)
            {
                [self performSelector:self.selectDownUp
                           withObject:nil
                           afterDelay:self.timeBetweenIntervals];
            }
        }

        if (self.mainPageSettings.breakRandomUpOrDown) {           //random sequential
            if (self.randomDirUp) {
                if (!self.killingPlayers)
                {
                    [self playDownUp];
                }
            }
            else
            {
                if (!self.killingPlayers)
                {
                    [self playUpDown];
                }
            }
        }
}
///////////////////////////////////////////

- (void)displayAnswer:(NSInteger)buttonSelected
{
    [self killPlayers];
    [self.playIntervalButton setTitle:@"PLAY" forState:UIControlStateNormal];
    NSString *intervalName = [self.anInterval intervalNumberToName:buttonSelected nameStyle:NO];
    NSString *correctString1 = @"CORRECT";
    NSString *correctString2 = @"\n";
    NSString *correctString3 = [correctString2 stringByAppendingString:intervalName];
    NSString *correctString4 = [correctString1 stringByAppendingString:correctString3];
    
    NSString *incorrectString1 = @"keep trying....";
    NSString *incorrectString2 = @"NOT ";
    NSString *incorrectString3 = [incorrectString2 stringByAppendingString:[intervalName stringByAppendingString:correctString2]];
    NSString *incorrectString4 = [incorrectString3 stringByAppendingString:[correctString2 stringByAppendingString:incorrectString1]];
    
    if (self.mainPageSettings.answerStyleAlert)
    {
        
        if (buttonSelected == self.anInterval.intervalNumber)
        {
            UIAlertController *correctAlert = [UIAlertController alertControllerWithTitle:correctString1
                                                                                  message:correctString3
                                                                           preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* dismissWithOK = [UIAlertAction actionWithTitle:@"OK"
                                                                          style:UIAlertActionStyleCancel
                                                                        handler:nil];
            [correctAlert addAction:dismissWithOK];
            [self presentViewController:correctAlert animated:YES completion:nil];
        }
        else
        {
            UIAlertController *incorrectAlert = [UIAlertController alertControllerWithTitle:incorrectString3
                                                                                  message:incorrectString1
                                                                           preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* dismissWithDONE = [UIAlertAction actionWithTitle:@"Dismiss"
                                                                    style:UIAlertActionStyleCancel
                                                                  handler:nil];
            [incorrectAlert addAction:dismissWithDONE];
            [self presentViewController:incorrectAlert animated:YES completion:nil];
        }
    }
    else
    {               //this is the label
        [self.response removeFromSuperview];
        float frameWidth = 200;
        float frameHeight = 200;
        float viewCenterPointx = self.view.center.x;
        float centeredOriginX = viewCenterPointx - (frameWidth / 2);
        float viewCenterPointy = self.view.center.y;
        float centeredOriginY = viewCenterPointy - (frameHeight /2);
        
        CGRect responseRect = CGRectMake(centeredOriginX, -30, frameWidth, frameHeight);
        self.response = [[UILabel alloc]initWithFrame:responseRect];
        self.response.numberOfLines = 0;
        self.response.textAlignment = NSTextAlignmentCenter;
        self.response.lineBreakMode = NSLineBreakByWordWrapping;
        [self.view addSubview:self.response];
        
        if (buttonSelected == self.anInterval.intervalNumber) {
            self.response.backgroundColor = [UIColor greenColor];
            self.response.textColor = [UIColor blackColor];
            self.response.text = correctString4;
        }
        else {
            self.response.backgroundColor = [UIColor redColor];
            self.response.textColor = [UIColor blackColor];
            self.response.text = incorrectString4;
        }
         [UIView animateWithDuration:1.0
                              delay:0.0
             usingSpringWithDamping:0.25
              initialSpringVelocity:0
                            options:0
                         animations:^{
                             CGRect frame = CGRectMake(centeredOriginX, centeredOriginY, frameWidth, frameHeight);
                             self.response.frame = frame;
                         }
                         completion:^(BOOL finished){[UIView animateWithDuration:1.0
                                                                           delay:0.5
                                                          usingSpringWithDamping:1.0
                                                           initialSpringVelocity:0.5
                                                                         options:0
                                                                      animations:^{
                                                                          CGRect frame = CGRectMake(centeredOriginX, (self.view.frame.size.height + 400), frameWidth, frameHeight);
                                                                          self.response.frame = frame;
                                                                                }
                                                                      completion:NULL];
                                                    }
         ];
    }
    
    
}

- (IBAction)minor2nd:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:1];
    }
}

- (IBAction)Major2nd:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:2];
    }
}

- (IBAction)minor3rd:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:3];
    }
}

- (IBAction)Major3rd:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:4];
    }
}

- (IBAction)Perfect4th:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:5];
    }
}

- (IBAction)TriTone:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:6];
    }
}

- (IBAction)Perfect5th:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:7];
    }
}

- (IBAction)minor6th:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:8];
    }
}

- (IBAction)Major6th:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:9];
    }
}

- (IBAction)minor7th:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:10];
    }
}

- (IBAction)Major7th:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:11];
    }
}

- (IBAction)Octave:(id)sender {
    if (self.anInterval) {
        [self displayAnswer:12];
    }
}

-(void)answersEnableDisable;
{
    self.min2button.enabled = self.answersEnabled;
    self.maj2button.enabled = self.answersEnabled;
    self.min3button.enabled = self.answersEnabled;
    self.maj3button.enabled = self.answersEnabled;
    self.p4button.enabled = self.answersEnabled;
    self.triToneButton.enabled = self.answersEnabled;
    self.p5button.enabled = self.answersEnabled;
    self.min6button.enabled = self.answersEnabled;
    self.maj6button.enabled = self.answersEnabled;
    self.min7button.enabled = self.answersEnabled;
    self.maj7button.enabled = self.answersEnabled;
    self.octaveButton.enabled = self.answersEnabled;
}

@end





