//
//  MainScreenViewController.m
//  Intervalix
//
//  Created by David Casini on 4/27/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "MainScreenViewController.h"
#import "OptionsViewController.h"


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

@property UIButton *playIntervalButton;

@property BOOL playersDone;

@property UILabel *response;

//@property (strong, nonatomic) IBOutlet customButton *playIntervalButton;

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
    
    
    /*
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    //    style.firstLineHeadIndent = 10.0f;
    //    style.headIndent = 10.0f;
    //    style.tailIndent = -10.0f;
    
    NSAttributedString  *attrText = [[NSAttributedString alloc] initWithString:self.playIntervalButton.titleLabel.text attributes:@{NSParagraphStyleAttributeName : style}];
    
    //  self.playIntervalButton = [[customButton alloc]init];
    self.playIntervalButton.titleLabel.numberOfLines = 2;
    self.playIntervalButton.titleLabel.attributedText = attrText;
    */

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
        optionsView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:optionsView animated:YES completion:nil];
}

- (IBAction)playInterval:(id)sender {
}

- (IBAction)repeatInterval:(id)sender {
}

- (IBAction)minor2nd:(id)sender {
}

- (IBAction)Major2nd:(id)sender {
}

- (IBAction)minor3rd:(id)sender {
}

- (IBAction)Major3rd:(id)sender {
}

- (IBAction)Perfect4th:(id)sender {
}

- (IBAction)TriTone:(id)sender {
}

- (IBAction)Perfect5th:(id)sender {
}

- (IBAction)minor6th:(id)sender {
}

- (IBAction)Major6th:(id)sender {
}

- (IBAction)minor7th:(id)sender {
}

- (IBAction)Major7th:(id)sender {
}

- (IBAction)Octave:(id)sender {
}
@end
