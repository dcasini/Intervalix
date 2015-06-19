//
//  IntervalClass.m
//  Intervalix
//
//  Created by David Casini on 5/5/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.

#import <AVFoundation/AVFoundation.h>
#import "IntervalClass.h"

@interface IntervalClass ()

@property (nonatomic)NSInteger rootNoteNumber;
@property (nonatomic)NSInteger secondToneNumber;

@end

@implementation IntervalClass

- (instancetype)init
{
    return [self initInterval:self];
}
- (instancetype)initInterval:(id)sender
{
    self = [super init];
    if (self) {
        self.intervalNumber = arc4random_uniform(12) + 1;  //generates lowest num = 1, highest num = 12
        self.rootNoteNumber = [self generateRoot];
        self.secondToneNumber = [self generateSecondTone];
        _upperNote = [self returnNoteName:(int)_rootNoteNumber];
        _lowerNote = [self returnNoteName:(int)_secondToneNumber];
        _breakUP = arc4random_uniform(2);  //returns 0 or 1
    }
    return self;
}

- (NSInteger)generateRoot
{
    NSInteger randomRoot = 0;
    randomRoot = arc4random_uniform(12) + 1;
    if (!_breakUP) {
        randomRoot += 12;
    }
    return randomRoot;
}

- (NSInteger)generateSecondTone
{
    NSInteger secondToneNumber = 0;
    if (_breakUP) {
        secondToneNumber = (_rootNoteNumber + _intervalNumber);
    }
    else {
        secondToneNumber = (_rootNoteNumber - _intervalNumber);
    }
    return secondToneNumber;
}

- (NSString *)returnNoteName:(int) NoteNumber
{
    NSString *noteString;
    
    switch (NoteNumber) {
        case 1:
            noteString = @"52_E_2.mp3";
            break;
        case 2:
            noteString = @"53_F_2.mp3";
            break;
        case 3:
            noteString = @"54_Gb_2.mp3";
            break;
        case 4:
            noteString = @"55_G_2.mp3";
            break;
        case 5:
            noteString = @"56_Ab_2.mp3";
            break;
        case 6:
            noteString = @"57_A_2.mp3";
            break;
        case 7:
            noteString = @"58_Bb_2.mp3";
            break;
        case 8:
            noteString = @"59_B_2.mp3";
            break;
        case 9:
            noteString = @"60_C_3.mp3";
            break;
        case 10:
            noteString = @"61_Db_3.mp3";
            break;
        case 11:
            noteString = @"62_D_3.mp3";
            break;
        case 12:
            noteString = @"63_Eb_3.mp3";
            break;
            
        case 13:
            noteString = @"64_E_3.mp3";
            break;
        case 14:
            noteString = @"65_F_3.mp3";
            break;
        case 15:
            noteString = @"66_Gb_3.mp3";
            break;
        case 16:
            noteString = @"67_G_3.mp3";
            break;
        case 17:
            noteString = @"68_Ab_4.mp3";
            break;
        case 18:
            noteString = @"69_A_3.mp3";
            break;
        case 19:
            noteString = @"70_Bb_3.mp3";
            break;
        case 20:
            noteString = @"71_B_3.mp3";
            break;
        case 21:
            noteString = @"72_C_4.mp3";
            break;
        case 22:
            noteString = @"73_Db_4.mp3";
            break;
        case 23:
            noteString = @"74_D_4.mp3";
            break;
        case 24:
            noteString = @"75_Eb_4.mp3";
            break;
        case 25:
            noteString = @"76_E_4.mp3";
            break;
            
        default:
            noteString = @"ERROR - invalid root note selected";
            break;
    }
    return noteString;
}

- (NSString *)intervalNumberToName:(NSInteger)intervalNumber nameStyle:(BOOL)nameStyle
{
    NSString *intervalName;
    
    switch (intervalNumber) {
        case 1:
            if (nameStyle) {
                intervalName = @"m2";
            }
            else
                intervalName = @"minor second";
            break;
        case 2:
            if (nameStyle) {
                intervalName = @"M2";
            }
            else
                intervalName = @"Major Second";
            break;
        case 3:
            if (nameStyle) {
                intervalName = @"m3";
            }
            else
                intervalName = @"minor third";
            break;
        case 4:
            if (nameStyle) {
                intervalName = @"M3";
            }
            else
                intervalName = @"Major Third";
            break;
        case 5:
            if (nameStyle) {
                intervalName = @"P4";
            }
            else
                intervalName = @"Perfect Fourth";
            break;
        case 6:
            if (nameStyle) {
                intervalName = @"TT";
            }
            else
                intervalName = @"TriTone";
            break;
        case 7:
            if (nameStyle) {
                intervalName = @"P5";
            }
            else
                intervalName = @"Perfect Fifth";
            break;
        case 8:
            if (nameStyle) {
                intervalName = @"m6";
            }
            else
                intervalName = @"minor sixth";
            break;
        case 9:
            if (nameStyle) {
                intervalName = @"M6";
            }
            else
                intervalName = @"Major Sixth";
            break;
        case 10:
            if (nameStyle) {
                intervalName = @"m7";
            }
            else
                intervalName = @"minor seventh";
            break;
        case 11:
            if (nameStyle) {
                intervalName = @"M7";
            }
            else
                intervalName = @"Major Seventh";
            break;
        case 12:
            if (nameStyle) {
                intervalName = @"8va";
            }
            else
                intervalName = @"Octave";
            break;
            
        default:
            break;
    }
    
    
    return intervalName;
}



@end
