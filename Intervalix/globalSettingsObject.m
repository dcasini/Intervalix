//
//  globalSettingsObject.m
//  Intervalix
//
//  Created by David Casini on 4/29/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "globalSettingsObject.h"

@implementation globalSettingsObject

- (instancetype)init
{
    NSString *path = [self itemArchivePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
    self = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    else
        self = [self initToDefaults];
    return self;
}

- (instancetype)initToDefaults
{
    if (self) {
    self.playSequentialOnly = NO;
    self.playSimultaneousOnly = NO;
    self.playSequentialThenSimultaneous = NO;
    self.playSimultaneousThenSequential = NO;
    self.playRandomSequentialOrSimultaneous = YES;
    
    self.breakUpOnly = NO;
    self.breakDownOnly = NO;
    self.breakUpThenDown = NO;
    self.breakDownThenUp = NO;
    self.breakRandomUpOrDown = YES;
    
    self.abbreviatedNameStyle = NO;
    self.fullNameStyle = YES;
    
    self.answerStyleAlert = NO;
    self.answerStyleLabel = YES;
        
    self.displayWelcomeMessage = YES;
    }
    
    return self;
}

//////////////////////////////////////////////////////////////////////////
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:self.playSequentialOnly forKey:@"playSequentialOnly"];
    [aCoder encodeBool:self.playSimultaneousOnly forKey:@"playSimultaneousOnly"];
    [aCoder encodeBool:self.playSequentialThenSimultaneous forKey:@"playSequentialThenSimultaneous"];
    [aCoder encodeBool:self.playSimultaneousThenSequential forKey:@"playSimultaneousThenSequential"];
    [aCoder encodeBool:self.playRandomSequentialOrSimultaneous forKey:@"playRandomSequentialOrSimultaneous"];
    
    [aCoder encodeBool:self.breakUpOnly forKey:@"breakUpOnly"];
    [aCoder encodeBool:self.breakDownOnly forKey:@"breakDownOnly"];
    [aCoder encodeBool:self.breakUpThenDown forKey:@"breakUpThenDown"];
    [aCoder encodeBool:self.breakDownThenUp forKey:@"breakDownThenUp"];
    [aCoder encodeBool:self.breakRandomUpOrDown forKey:@"breakRandomUpOrDown"];
    
    [aCoder encodeBool:self.fullNameStyle forKey:@"fullNameStyle"];
    [aCoder encodeBool:self.abbreviatedNameStyle forKey:@"abbreviatedNameStyle"];
    
    [aCoder encodeBool:self.answerStyleAlert  forKey:@"answerStyleAlert"];
    [aCoder encodeBool:self.answerStyleLabel  forKey:@"answerStyleLabel"];
    
    [aCoder encodeBool:self.displayWelcomeMessage forKey:@"displayWelcomeMessage"];
    
}
//////////////////////////////////////////////////////////////////////////
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
   self = [super init];
    if (self) {
        self.playSequentialOnly = [aDecoder decodeBoolForKey:@"playSequentialOnly"];
        self.playSimultaneousOnly = [aDecoder decodeBoolForKey:@"playSimultaneousOnly"];
        self.playSequentialThenSimultaneous = [aDecoder decodeBoolForKey:@"playSequentialThenSimultaneous"];
        self.playSimultaneousThenSequential = [aDecoder decodeBoolForKey:@"playSimultaneousThenSequential"];
        self.playRandomSequentialOrSimultaneous = [aDecoder decodeBoolForKey:@"playRandomSequentialOrSimultaneous"];
        
        self.breakUpOnly = [aDecoder decodeBoolForKey:@"breakUpOnly"];
        self.breakDownOnly = [aDecoder decodeBoolForKey:@"breakDownOnly"];
        self.breakUpThenDown = [aDecoder decodeBoolForKey:@"breakUpThenDown"];
        self.breakDownThenUp = [aDecoder decodeBoolForKey:@"breakDownThenUp"];
        self.breakRandomUpOrDown = [aDecoder decodeBoolForKey:@"breakRandomUpOrDown"];
        
        self.fullNameStyle = [aDecoder decodeBoolForKey:@"fullNameStyle"];
        self.abbreviatedNameStyle = [aDecoder decodeBoolForKey:@"abbreviatedNameStyle"];
        
        self.answerStyleAlert = [aDecoder decodeBoolForKey:@"answerStyleAlert"];
        self.answerStyleLabel = [aDecoder decodeBoolForKey:@"answerStyleLabel"];
             
        self.displayWelcomeMessage = [aDecoder decodeBoolForKey:@"displayWelcomeMessage"];
        
    }
    return self;
}
//////////////////////////////////////////////////////////////////////////////
- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"global.archive"];
}


///////////////////////////////////////////////////////////////////////////////
- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}



@end
