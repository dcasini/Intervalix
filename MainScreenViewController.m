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
#import "customButton1.h"


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

//@property (copy, nonatomic) void(^dismissBlock)(void);


//- (void)displayAnswer:(NSInteger)buttonSelected;
//
//- (void)parseSettings:(NSString *)lowerNote nextTone:(NSString *)upperNote;
//
//- (void)playTones:(NSString *)tone1  secondTone:(NSString *)tone2 playBroken:(BOOL)playBroken;


@end

@implementation MainScreenViewController

@synthesize player1;
@synthesize player2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.mainPageSettings = [[globalSettingsObject alloc]init];
    
    player1 = [[AVAudioPlayer alloc]init];
    player2 = [[AVAudioPlayer alloc]init];
    self.playersDone = YES;
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    //    style.firstLineHeadIndent = 10.0f;
    //    style.headIndent = 10.0f;
    //    style.tailIndent = -10.0f;
    
    NSAttributedString  *attrText = [[NSAttributedString alloc] initWithString:self.playIntervalButton.titleLabel.text attributes:@{NSParagraphStyleAttributeName : style}];
    
    self.playIntervalButton.titleLabel.numberOfLines = 2;
    self.playIntervalButton.titleLabel.attributedText = attrText;
    
    [self displayNameStyle];
    
}

- (void)displayNameStyle
{
    if (self.mainPageSettings.fullNameStyle) {
        [self.playIntervalButton setTitle: @"Play Interval" forState:UIControlStateNormal];
        [self.repeatButton setTitle: @"Repeat Interval" forState:UIControlStateNormal];
        [self.optionsButton setTitle: @"Go to Options" forState:UIControlStateNormal];
        [self.min2button setTitle: @"minor second" forState:UIControlStateNormal];
        [self.maj2button setTitle: @"Major Second" forState:UIControlStateNormal];
        [self.min3button setTitle: @"minor third" forState:UIControlStateNormal];
        [self.maj3button setTitle: @"Major Third" forState:UIControlStateNormal];
        [self.p4button setTitle: @"Perfect Fourth" forState:UIControlStateNormal];
        [self.triToneButton setTitle: @"TriTone" forState:UIControlStateNormal];
        [self.p5button setTitle: @"Perfect Fifth" forState:UIControlStateNormal];
        [self.min6button setTitle: @"minor sixth" forState:UIControlStateNormal];
        [self.maj6button setTitle: @"Major Sixth" forState:UIControlStateNormal];
        [self.min7button setTitle: @"minor seventh" forState:UIControlStateNormal];
        [self.maj7button setTitle: @"Major Seventh" forState:UIControlStateNormal];
        [self.octaveButton setTitle: @"Octave" forState:UIControlStateNormal];
    }
    else {
        [self.playIntervalButton setTitle: @"play" forState:UIControlStateNormal];
        [self.repeatButton setTitle: @"repeat" forState:UIControlStateNormal];
        [self.optionsButton setTitle: @"options" forState:UIControlStateNormal];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    //[self playTones:self.anInterval.upperNote secondTone:self.anInterval.lowerNote seqORsim:false];
    // [self playTones:self.tone1 secondTone:self.tone2 seqYesSimNo:false];
}

- (void)playTones:(NSString *)tone1  secondTone:(NSString *)tone2 playBroken:(BOOL)playBroken
{
    NSLog(@"playing tone1 = %@ - - tone2 = %@", tone1, tone2);
    
    NSString* path1 = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:tone1];
    NSError* error;
    player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path1] error:&error];
    // player1 = [player1 initWithContentsOfURL:[NSURL fileURLWithPath:path1] error:&error];
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
}
///////////////////////////////////////////

- (void)displayAnswer:(NSInteger)buttonSelected
{
    // FIX THIS !!
    NSString *intervalName = @"FIX ME"; // = [self.anInterval intervalNumberToName:buttonSelected nameStyle:self.mainPageSettings.intervalNameStyle];
    
    NSString *correctString1 = @"Correct";
    NSString *correctString2 = @" - the interval is ";
    NSString *correctString3 = [correctString2 stringByAppendingString:intervalName];
    NSString *correctString4 = [correctString1 stringByAppendingString:correctString3];
    
    NSString *incorrectString1 = @"Incorrect";
    NSString *incorrectString2 = @" - the interval is not ";
    NSString *incorrectString3 = [incorrectString2 stringByAppendingString:intervalName];
    NSString *incorrectString4 = [incorrectString1 stringByAppendingString:incorrectString3];
    
    
    //    NSString *tempString2 = [NSString stringWithFormat:@"- interval:%d, selected:%d", (int)self.anInterval.intervalNumber, (int)buttonSelected];
    //    NSString *tempString = [tempString1 stringByAppendingString:tempString2];
    
    
    if (self.mainPageSettings.answerStyleAlert)     //this is the alert...
    {
        if (buttonSelected == self.anInterval.intervalNumber)
        {
            UIAlertView
            * alert =[[UIAlertView alloc ] initWithTitle:correctString1 message:correctString3
                                                delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            UIAlertView
            * alert =[[UIAlertView alloc ] initWithTitle:incorrectString1 message:incorrectString3
                                                delegate:self
                                       cancelButtonTitle:@"DONE"
                                       otherButtonTitles:nil];
            //[alert addButtonWithTitle:@"Try again?"];  //trigger 'repeat interval' method?
            [alert show];
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
        _response.backgroundColor = [UIColor blackColor];
        _response.textColor = [UIColor whiteColor];
        [self.view addSubview:_response];
        
        if (buttonSelected == self.anInterval.intervalNumber) {
            //NSLog(@"Correct - interval:%ld, selected:%ld", (long)self.anInterval.intervalNumber, (long)buttonSelected);
            _response.text = correctString4;
        }
        else {
            // NSLog(@"Wrong - interval:%ld, selected:%ld", (long)self.anInterval.intervalNumber, (long)buttonSelected);
            // NSString *tempString = [NSString stringWithFormat:@"Incorrect - interval:%d, selected:%d", (int)self.anInterval.intervalNumber, (int)buttonSelected];
            _response.text = incorrectString4;
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




- (void)parseSettings:(NSString *)lowerNote nextTone:(NSString *)upperNote      //use enumerated??
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





