//
//  OptionsViewController.h
//  Intervalix
//
//  Created by David Casini on 4/27/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "globalSettingsObject.h"

@interface OptionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property  globalSettingsObject *optionsPageSettings;

@end
