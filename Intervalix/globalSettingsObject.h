//
//  globalSettingsObject.h
//  Intervalix
//
//  Created by David Casini on 4/29/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface globalSettingsObject : NSObject <NSCoding>

//only one of these 5 will be true
@property (nonatomic) BOOL playSequentialOnly;
@property (nonatomic) BOOL playSimultaneousOnly;
@property (nonatomic) BOOL playSequentialThenSimultaneous;
@property (nonatomic) BOOL playSimultaneousThenSequential;
@property (nonatomic) BOOL playRandomSequentialOrSimultaneous;

//only one of these 5 will be true
@property (nonatomic) BOOL breakUpOnly;
@property (nonatomic) BOOL breakDownOnly;
@property (nonatomic) BOOL breakDownThenUp;
@property (nonatomic) BOOL breakUpThenDown;
@property (nonatomic) BOOL breakRandomUpOrDown;

//only one of these 2 will be true
@property (nonatomic) BOOL fullNameStyle;
@property (nonatomic) BOOL abbreviatedNameStyle;

//only one of these 2 will be true
@property (nonatomic) BOOL answerStyleAlert; 
@property (nonatomic) BOOL answerStyleLabel;

@property (nonatomic) BOOL displayWelcomeMessage;

@property (nonatomic) BOOL applicationJustOpened;

- (BOOL)saveChanges;

- (instancetype)initToDefaults;



@end
