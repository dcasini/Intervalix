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
#import "customButton1.h"  //not using custom button? if not, change IBOutlets to UIButton?


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


@property (weak, nonatomic) IBOutlet customButton1 *min2button;

@property (weak, nonatomic) IBOutlet customButton1 *maj2button;

@property (weak, nonatomic) IBOutlet customButton1 *min3button;

@property (weak, nonatomic) IBOutlet customButton1 *maj3button;

@property (weak, nonatomic) IBOutlet customButton1 *p4button;

@property (weak, nonatomic) IBOutlet customButton1 *triToneButton;

@property (weak, nonatomic) IBOutlet customButton1 *p5button;

@property (weak, nonatomic) IBOutlet customButton1 *min6button;

@property (weak, nonatomic) IBOutlet customButton1 *maj6button;

@property (weak, nonatomic) IBOutlet customButton1 *min7button;

@property (weak, nonatomic) IBOutlet customButton1 *maj7button;

@property (weak, nonatomic) IBOutlet customButton1 *octaveButton;

@property (weak, nonatomic) IBOutlet customButton1 *playIntervalButton;  //weak (automatic) strong?

@property (weak, nonatomic) IBOutlet customButton1 *optionsButton;

@property (weak, nonatomic) IBOutlet customButton1 *repeatButton;

@property BOOL playersDone;

@property UILabel *response;

@property BOOL dontShowWelcome;

@end



@implementation MainScreenViewController

@synthesize player1;
@synthesize player2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.mainPageSettings = [[globalSettingsObject alloc]init];

    player1 = [[AVAudioPlayer alloc]init];   //improve response time by intantiating these before they are needed?
    player2 = [[AVAudioPlayer alloc]init];
    self.playersDone = YES;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        self.playIntervalButton.titleLabel.font = [UIFont systemFontOfSize: 100];
        self.repeatButton.titleLabel.font = [UIFont systemFontOfSize: 40];
        self.optionsButton.titleLabel.font = [UIFont systemFontOfSize: 40];
    }
    
    [self displayNameStyle];
}

-(void)viewDidAppear:(BOOL)animated    //must decide welcome AFTER rootView has appeared
{
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
        [self.triToneButton setTitle: @"TT" forState:UIControlStateNormal];
        [self.p5button setTitle: @"P5" forState:UIControlStateNormal];
        [self.min6button setTitle: @"m6" forState:UIControlStateNormal];
        [self.maj6button setTitle: @"M6" forState:UIControlStateNormal];
        [self.min7button setTitle: @"m7" forState:UIControlStateNormal];
        [self.maj7button setTitle: @"M7" forState:UIControlStateNormal];
        [self.octaveButton setTitle: @"8va" forState:UIControlStateNormal];
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

- (IBAction)playInterval:(id)sender {           //create a new interval, use existing settings
    [self.response removeFromSuperview];
    if (self.playersDone) {
        self.playersDone = NO;
        self.anInterval = [[IntervalClass alloc] init];
        NSLog(@"\n\n\n requested lower: %@, upper: %@", self.anInterval.lowerNote, self.anInterval.upperNote);
        [self parseSettings:self.anInterval.lowerNote nextTone:self.anInterval.upperNote];
    }

    
}

- (IBAction)repeatInterval:(id)sender {     //use existing interval & settings
    [self parseSettings:self.anInterval.lowerNote nextTone:self.anInterval.upperNote];
}

- (void)playTones:(NSString *)tone1  secondTone:(NSString *)tone2 playBroken:(BOOL)playBroken
{
    NSLog(@"playing tone1 = %@ - - tone2 = %@", tone1, tone2);
    
    NSString* path1 = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:tone1];
    NSError* error;
    player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path1] error:&error];
    self.player1.delegate = self;
    
    NSString *path2 = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:tone2];
    NSError* error2;
    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path2] error:&error2];
    self.player2.delegate = self;
 
    [player1 play];
    if (playBroken) {
        NSLog(@"Broken(sequential");
        sleep(1);
    }
    else
    {
        NSLog(@"simultaneous");
    }
   [player2 play];
    self.playersDone = YES;
  

//    self.playersDone = YES;
//    NSTimeInterval myDelay = 0.25;
//    SEL mySelector = @selector(play);
//    if (playBroken) {
//        NSLog(@"Broken(sequential");
//        [player1 play];
//        [player2 performSelector:mySelector
//                      withObject:nil
//                      afterDelay:myDelay];
//     }
//     else
//     {
//         NSLog(@"simultaneous");
//         [player1 play];
//         [player2 play];
//     }
//     self.playersDone = YES;
    
}
///////////////////////////////////////////

- (void)displayAnswer:(NSInteger)buttonSelected
{
    NSString *intervalName = [self.anInterval intervalNumberToName:buttonSelected nameStyle:NO];//self.mainPageSettings.abbreviatedNameStyle];
    
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
        
        [UIView animateWithDuration:1.5
                              delay:0.0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0
                            options:0
                         animations:^{
                             CGRect frame = CGRectMake(centeredOriginX, centeredOriginY, frameWidth, frameHeight);
                             self.response.frame = frame;
                         }
                         completion:^(BOOL finished){[UIView animateWithDuration:1.0
                                                                           delay:0.75
                                                          usingSpringWithDamping:1.0
                                                           initialSpringVelocity:0.5
                                                                         options:0
                                                                      animations:^{
                                                                          CGRect frame = CGRectMake(centeredOriginX, (self.view.frame.size.height + 200), frameWidth, frameHeight);
                                                                          self.response.frame = frame;
                                                                      }
                        completion:NULL];}
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


- (void)parseSettings:(NSString *)lowerNote nextTone:(NSString *)upperNote
{
    NSInteger randomSeqBrkn = arc4random_uniform(2);  //returns 1 (sequential/broken) or 0 (simultaneous)
    NSLog(@"randomBroken:%ld", (long)randomSeqBrkn);
    
    if (self.mainPageSettings.playSimultaneousOnly              //this block will be just simultaneous
        || self.mainPageSettings.playSimultaneousThenSequential
        || (self.mainPageSettings.playRandomSequentialOrSimultaneous && !randomSeqBrkn) )
    {
        NSLog(@"PAR simult1 block");
        [self playTones:lowerNote secondTone:upperNote playBroken:NO];
    }
    
    if (self.mainPageSettings.playSimultaneousThenSequential) {
        sleep(2);
    }
    
    
    if (self.mainPageSettings.playSequentialOnly   //this block will handle the different sequential types, followed by optional simultaneous
        || self.mainPageSettings.playSequentialThenSimultaneous
        || self.mainPageSettings.playSimultaneousThenSequential
        || (self.mainPageSettings.playRandomSequentialOrSimultaneous && randomSeqBrkn))
    {
        NSLog(@"PAR brkn/seq block");
        if (self.mainPageSettings.breakUpOnly) {
            NSLog(@"low to high");
            [self playTones:lowerNote secondTone:upperNote playBroken:YES];   //low to high
        }
        if (self.mainPageSettings.breakDownOnly) {
            NSLog(@"high to low");
            [self playTones:upperNote secondTone:lowerNote playBroken:YES];   //high to low
        }
        if (self.mainPageSettings.breakUpThenDown) {
            NSLog(@"lo-hi then hi-lo");
            [self playTones:lowerNote secondTone:upperNote playBroken:YES];   //lo-hi, then hi-lo
            sleep(2);
            if (self.playersDone) {
                [self playTones:upperNote secondTone:lowerNote playBroken:YES];
            }
        }
        if (self.mainPageSettings.breakDownThenUp) {
            NSLog(@"hi-lo then lo-hi");
            [self playTones:upperNote secondTone:lowerNote playBroken:YES];  //hi-lo, then lo-hi
            sleep(2);
            if (self.playersDone) {
                [self playTones:lowerNote secondTone:upperNote playBroken:YES];
            }
        }
        
        if (self.mainPageSettings.breakRandomUpOrDown) {                             //random sequential
            NSInteger randomDirUp = arc4random_uniform(2);  //returns 0 or 1
            NSLog(@"in randomUpDown block, up = %ld", (long)randomDirUp);
            if (randomDirUp) {
                NSLog(@"randomly parsed low to high");
                [self playTones:lowerNote secondTone:upperNote playBroken:YES];
            }
            else
            {
                NSLog(@"randomly parsed high to low");
                [self playTones:upperNote secondTone:lowerNote playBroken:YES];
            }
        }
        
        if (self.mainPageSettings.playSequentialThenSimultaneous) {          //this is 'thenSimultaneous' after sequential....
            NSLog(@"PAR sequ then simul");
            sleep(2);
            [self playTones:lowerNote secondTone:upperNote playBroken:NO];
        }
    }
}

@end

// this was created by default by Xcode, but not needed?
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}






