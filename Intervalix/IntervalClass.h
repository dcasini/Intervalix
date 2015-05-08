//
//  IntervalClass.h
//  Intervalix
//
//  Created by David Casini on 5/5/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntervalClass : NSObject

//these are the only attributes readable by other classes
@property (nonatomic) NSInteger intervalNumber;
@property (nonatomic, weak) NSString *upperNote;  //change to upperNoteName or upperNoteString?
@property (nonatomic, weak) NSString *lowerNote;        //should this be weak or strong?


@property (nonatomic) BOOL breakUP;   //if true, interval breaks UP (from low note to high note). if false, break DOWN (from high to low)
@property (nonatomic) BOOL breakDOWN;   //probably init to NO, but will be set by MIXED randomizer (always compliment of breakIntervalUp)


- (NSString *)intervalNumberToName:(NSInteger)intervalNumber
                         nameStyle:(BOOL)nameStyle;

@end
