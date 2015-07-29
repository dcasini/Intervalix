//
//  InterfaceController.m
//  Intervalix WatchKit Extension
//
//  Created by David Casini on 7/21/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "InterfaceController.h"

@interface InterfaceController()

@property NSString *stringFromWatch;

@property NSString *currentIntervalString;

@property int currentInterval;


- (IBAction)playButtonTop;

- (IBAction)playButtonCenter;

- (IBAction)repeatButton;

- (IBAction)minorSecondButton;

- (IBAction)MajorSecondButton;

- (IBAction)minorThirdButton;

- (IBAction)MajorThirdButton;

- (IBAction)PerfectFourthButton;

- (IBAction)TriToneButton;

- (IBAction)PerfectFifthButton;

- (IBAction)minorSixthButton;

- (IBAction)MajorSixthButton;

- (IBAction)minorSeventhButton;

- (IBAction)MajorSeventhButton;

- (IBAction)OctaveButton;

@property (weak, nonatomic) IBOutlet WKInterfaceButton *responseButton;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)playButtonTop
{
    [self.responseButton setTitle:@"?"];
    [self.responseButton setBackgroundColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0]];
    self.stringFromWatch = @"playButtonFromWatch";
    [self callFromWatch];
}

- (IBAction)playButtonCenter
{
    [self.responseButton setTitle:@"?"];
    [self.responseButton setBackgroundColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0]];
    self.stringFromWatch = @"playButtonFromWatch";
    [self callFromWatch];
}

- (IBAction)repeatButton
{
    [self.responseButton setTitle:@"?"];
    [self.responseButton setBackgroundColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0]];
    self.stringFromWatch = @"repeatButtonFromWatch";
    [self callFromWatch];
}

-(void)callFromWatch
{
    NSDictionary *appData = [[NSDictionary alloc] initWithObjects:@[self.stringFromWatch] forKeys:@[@"buttonName"]];
    
    [WKInterfaceController openParentApplication:appData reply:^(NSDictionary *replyInfo, NSError *error)
     {
         self.currentIntervalString = [replyInfo objectForKey:@"intervalNumber"];
         //NSLog(@"on watch, got this reply:%@",self.currentIntervalString);
     }];
}

-(void)checkAnswer:(NSString *)theChoice
{
    self.stringFromWatch = @"answerButtonFromWatch";
    [self callFromWatch];
    
    if ([theChoice isEqualToString:self.currentIntervalString]) {
        [self.responseButton setBackgroundColor:[UIColor greenColor]];
        [self.responseButton setTitle:@"Y"];
    }
    else
    {
        [self.responseButton setBackgroundColor:[UIColor redColor]];
        [self.responseButton setTitle:@"N"];
    }
}

- (IBAction)minorSecondButton {
    [self checkAnswer:@"one"];
}

- (IBAction)MajorSecondButton {
    [self checkAnswer:@"two"];
}

- (IBAction)minorThirdButton {
    [self checkAnswer:@"three"];
}

- (IBAction)MajorThirdButton {
    [self checkAnswer:@"four"];
}

- (IBAction)PerfectFourthButton {
    [self checkAnswer:@"five"];
}

- (IBAction)TriToneButton {
    [self checkAnswer:@"six"];
}

- (IBAction)PerfectFifthButton {
    [self checkAnswer:@"seven"];
}

- (IBAction)minorSixthButton {
    [self checkAnswer:@"eight"];
}

- (IBAction)MajorSixthButton {
    [self checkAnswer:@"nine"];
}

- (IBAction)minorSeventhButton {
    [self checkAnswer:@"ten"];
}

- (IBAction)MajorSeventhButton {
    [self checkAnswer:@"eleven"];
}

- (IBAction)OctaveButton {
    [self checkAnswer:@"twelve"];
}


@end



