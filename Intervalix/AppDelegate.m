//
//  AppDelegate.m
//  Intervalix
//
//  Created by David Casini on 4/27/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScreenViewController.h"

@interface AppDelegate ()

@property MainScreenViewController *mainView;

@property NSInteger currentInterval;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
   // MainScreenViewController *mainView = [[MainScreenViewController alloc]init];
    self.mainView = [[MainScreenViewController alloc]init];
    self.window.rootViewController = self.mainView;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.mainView.mainPageSettings.applicationJustOpened = YES;  //used in MainScreen/ViewDidLoad
    //this is used to be sure welcome screen only appears at startup (if enabled)
    //and does not reappear when coming back from options page
    
    return YES;
}


- (void)application:(UIApplication *)application
handleWatchKitExtensionRequest:(NSDictionary *)userInfo
              reply:(void (^)(NSDictionary *replyInfo))reply
{
    NSString *buttonName = [userInfo objectForKey:@"buttonName"];
    
    if ([buttonName isEqual: @"playButtonFromWatch"])
    {
        [self.mainView playInterval:self];
    }
    
    if ([buttonName isEqual: @"repeatButtonFromWatch"])
    {
        [self.mainView repeatInterval:self];
    }
    
    if ([buttonName isEqual: @"answerButtonFromWatch"])
    {
        [self.mainView killPlayers];
    }
    
    self.currentInterval = self.mainView.anInterval.intervalNumber;
    NSString *intAsString = [self intToString:(int)self.currentInterval];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:intAsString,@"intervalNumber", nil];
    reply(dict);
}

- (NSString *)intToString:(int)intIn
{
    NSString *returnValue;
    switch (intIn) {
        case 1:
            returnValue = @"one";
            break;
        case 2:
            returnValue = @"two";
            break;
        case 3:
            returnValue = @"three";
            break;
        case 4:
            returnValue = @"four";
            break;
        case 5:
            returnValue = @"five";
            break;
        case 6:
            returnValue = @"six";
            break;
        case 7:
            returnValue = @"seven";
            break;
        case 8:
            returnValue = @"eight";
            break;
        case 9:
            returnValue = @"nine";
            break;
        case 10:
            returnValue = @"ten";
            break;
        case 11:
            returnValue = @"eleven";
            break;
        case 12:
            returnValue = @"twelve";
            break;
            
        default:
            returnValue = @"ERROR - invalid int to string";
            break;
    }
    
    
    return returnValue;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
