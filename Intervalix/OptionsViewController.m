//
//  OptionsViewController.m
//  Intervalix
//
//  Created by David Casini on 4/27/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *optionsTableView;

@property NSInteger checkedRowS0;
@property NSInteger previousCheckS0;
@property NSInteger checkedRowS1;
@property NSInteger previousCheckS1;
@property NSInteger checkedRowS2;
@property NSInteger previousCheckS2;
@property NSInteger checkedRowS3;
@property NSInteger previousCheckS3;
@property NSInteger checkedRowS4;
@property NSInteger previousCheckS4;

- (IBAction)doneButton:(id)sender;

@end

@implementation OptionsViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

//////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRows;
    switch (section) {
        case 0:
            numRows = 5;    //'interval prefs' section
            break;
        case 1:
            numRows = 5;    //'sequential prefs' section
            break;
        case 2:
            numRows = 2;    //'name prefs' section
            break;
        case 3:
            numRows = 2;    //'answer prefs' section
            break;
        case 4:
            numRows = 2;    //'support' section
            break;
        default:
            numRows = 0;
            break;
    }
    return numRows;
}

//////////////////////////////////////////

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextAlignment:NSTextAlignmentCenter];
    
    NSString *sectionName;
    switch (section)
    {
        case 0:   //5 rows
            sectionName = @"Interval Preferences";
            break;
        case 1:     //5 rows
            sectionName = @"Sequential Preferences";
            break;
        case 2:     //2 rows
            sectionName = @"Name Display Preferences";
            break;
        case 3:     //2 rows
            sectionName = @"Answer Display Preferences";
            break;
        case 4:     //w2 rows
            sectionName = @"Support";
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

/////////////////////////////////////////////////

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    CGFloat height;
    if (section == 0) {
        height = 30;     //make space for the NavBar at top of screen
    }
    else height = 20;
    
    return height;
}

//////////////////////////////////////////

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0){                //5 rows
        switch (indexPath.row) {
            case 0:
                aCell.textLabel.text = @"Sequential Only";
                if (self.optionsPageSettings.playSequentialOnly) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS0 = indexPath.row;
                    self.previousCheckS0 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 1:
                aCell.textLabel.text = @"Simultaneous Only";
                if (self.optionsPageSettings.playSimultaneousOnly) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS0 = indexPath.row;
                    self.previousCheckS0 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 2:
                aCell.textLabel.text = @"Sequential, then Simultaneous";
                if (self.optionsPageSettings.playSequentialThenSimultaneous) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS0 = indexPath.row;
                    self.previousCheckS0 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 3:
                aCell.textLabel.text = @"Simultaneous, then Sequential";
                if (self.optionsPageSettings.playSimultaneousThenSequential) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS0 = indexPath.row;
                    self.previousCheckS0 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 4:
                aCell = [aCell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"defaultCell"];
                aCell.textLabel.text = @"Random Seq. or Sim.";
                if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
                    aCell.textLabel.text = @"Random Sequential or Simultaneous";
                }
                aCell.detailTextLabel.text = @"default";
                if (self.optionsPageSettings.playRandomSequentialOrSimultaneous) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS0 = indexPath.row;
                    self.previousCheckS0 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1){                //5 rows
        switch (indexPath.row) {
            case 0:
                aCell.textLabel.text = @"Low to High Only";
                if (self.optionsPageSettings.breakUpOnly) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS1 = indexPath.row;
                    self.previousCheckS1 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 1:
                aCell.textLabel.text = @"High to Low Only";
                if (self.optionsPageSettings.breakDownOnly) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS1 = indexPath.row;
                    self.previousCheckS1 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 2:
                aCell.textLabel.text = @"Low-High, then High-Low";
                if (self.optionsPageSettings.breakUpThenDown) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS1 = indexPath.row;
                    self.previousCheckS1 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 3:
                aCell.textLabel.text = @"High-Low, then Low-High";
                if (self.optionsPageSettings.breakDownThenUp) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS1 = indexPath.row;
                    self.previousCheckS1 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 4:
                aCell = [aCell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"defaultCell"];
                aCell.textLabel.text = @"Random Low-High or High-Low";
                aCell.detailTextLabel.text = @"default";
                if (self.optionsPageSettings.breakRandomUpOrDown) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS1 = indexPath.row;
                    self.previousCheckS1 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2){                //2 rows
        switch (indexPath.row) {
            case 0:
                aCell.textLabel.text = @"Abbreviated Interval Names";
                if (self.optionsPageSettings.abbreviatedNameStyle) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS2 = indexPath.row;
                    self.previousCheckS2 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 1:
                aCell = [aCell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"defaultCell"];
                aCell.textLabel.text = @"Full Interval Names";
                aCell.detailTextLabel.text = @"default";
                if (self.optionsPageSettings.fullNameStyle) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS2 = indexPath.row;
                    self.previousCheckS2 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 3){                //2 rows
        switch (indexPath.row) {
            case 0:
                aCell.textLabel.text = @"Alert Style (user dismisses)";
                if (self.optionsPageSettings.answerStyleAlert) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS3 = indexPath.row;
                    self.previousCheckS3 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            case 1:
                aCell = [aCell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"defaultCell"];
                aCell.textLabel.text = @"Label Style (self-dismisses)";
                aCell.detailTextLabel.text = @"default";
                if (self.optionsPageSettings.answerStyleLabel) {
                    aCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    self.checkedRowS3 = indexPath.row;
                    self.previousCheckS3 = indexPath.row;
                }
                else
                    aCell.accessoryType = UITableViewCellAccessoryNone;
                break;
            default:
                break;
        }
    }
    
    if (indexPath.section == 4) {
        aCell.accessoryType = UITableViewCellAccessoryNone;
        switch (indexPath.row) {
            case 0:
                aCell.textLabel.text = @"View instructions and support";
                aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 1:
                aCell.textLabel.text = @"Reset to defaults";
                aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            default:
                break;
        }
        
    }
    return aCell;
}


////////////////////////////////////////////////

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.optionsTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
        if (self.previousCheckS0 == indexPath.row) {  //no change
            return;
        }
        
        NSIndexPath *oldPathS0 = [NSIndexPath indexPathForRow:self.previousCheckS0 inSection:0];
        
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedRowS0 = indexPath.row;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldPathS0];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        [self changePref:indexPath checked:self.checkedRowS0 unchecked:self.previousCheckS0];
        
        self.previousCheckS0 = self.checkedRowS0;
    }
    
    if (indexPath.section == 1) {
        
        if (self.previousCheckS1 == indexPath.row) {  //no change
            return;
        }
        
        NSIndexPath *oldPathS1 = [NSIndexPath indexPathForRow:self.previousCheckS1 inSection:1];
        
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedRowS1 = indexPath.row;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldPathS1];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        [self changePref:indexPath checked:self.checkedRowS1 unchecked:self.previousCheckS1];
        
        self.previousCheckS1 = self.checkedRowS1;
    }
    
    if (indexPath.section == 2) {
        
        if (self.previousCheckS2 == indexPath.row) {  //no change
            return;
        }
        
        NSIndexPath *oldPathS2 = [NSIndexPath indexPathForRow:self.previousCheckS2 inSection:2];
        
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedRowS2 = indexPath.row;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldPathS2];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        [self changePref:indexPath checked:self.checkedRowS2 unchecked:self.previousCheckS2];
        
        self.previousCheckS2 = self.checkedRowS2;
    }
    
    if (indexPath.section == 3) {
        
        if (self.previousCheckS3 == indexPath.row) {  //no change
            return;
        }
        
        NSIndexPath *oldPathS3 = [NSIndexPath indexPathForRow:self.previousCheckS3 inSection:3];
        
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedRowS3 = indexPath.row;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldPathS3];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        [self changePref:indexPath checked:self.checkedRowS3 unchecked:self.previousCheckS3];
        
        self.previousCheckS3 = self.checkedRowS3;
    }
    
    if (indexPath.section == 4) {       // no check marks needed for the Support section....
        if (indexPath.row == 0) {
            [self displayInformationView];
        }
        if (indexPath.row == 1) {
            [self confirmBeforeReset];
        }
    }
    
    [self.optionsPageSettings saveChanges];   //if ANY row is selected, state is save even if there was no change
}

/////////////////////////////////////////////////////////

- (void)changePref:(NSIndexPath *)indexPath checked:(NSInteger)checked unchecked:(NSInteger)unchecked
{
    if (indexPath.section == 0) {
        switch (checked) {
            case 0:
                self.optionsPageSettings.playSequentialOnly = true;
                break;
            case 1:
                self.optionsPageSettings.playSimultaneousOnly = true;
                break;
            case 2:
                self.optionsPageSettings.playSequentialThenSimultaneous = true;
                break;
            case 3:
                self.optionsPageSettings.playSimultaneousThenSequential = true;
                break;
            case 4:
                self.optionsPageSettings.playRandomSequentialOrSimultaneous = true;
                break;
            default:
                break;
        }
        switch (unchecked) {
            case 0:
                self.optionsPageSettings.playSequentialOnly = false;
                break;
            case 1:
                self.optionsPageSettings.playSimultaneousOnly = false;
                break;
            case 2:
                self.optionsPageSettings.playSequentialThenSimultaneous = false;
                break;
            case 3:
                self.optionsPageSettings.playSimultaneousThenSequential = false;
                break;
            case 4:
                self.optionsPageSettings.playRandomSequentialOrSimultaneous = false;
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (checked) {
            case 0:
                self.optionsPageSettings.breakUpOnly = true;
                break;
            case 1:
                self.optionsPageSettings.breakDownOnly = true;
                break;
            case 2:
                self.optionsPageSettings.breakUpThenDown = true;
                break;
            case 3:
                self.optionsPageSettings.breakDownThenUp = true;
                break;
            case 4:
                self.optionsPageSettings.breakRandomUpOrDown = true;
                break;
            default:
                break;
        }
        switch (unchecked) {
            case 0:
                self.optionsPageSettings.breakUpOnly = false;
                break;
            case 1:
                self.optionsPageSettings.breakDownOnly = false;
                break;
            case 2:
                self.optionsPageSettings.breakUpThenDown = false;
                break;
            case 3:
                self.optionsPageSettings.breakDownThenUp = false;
                break;
            case 4:
                self.optionsPageSettings.breakRandomUpOrDown = false;
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {
        switch (checked) {
            case 0:
                self.optionsPageSettings.abbreviatedNameStyle = true;
                break;
            case 1:
                self.optionsPageSettings.fullNameStyle = true;
                break;
            default:
                break;
        }
        switch (unchecked) {
            case 0:
                self.optionsPageSettings.abbreviatedNameStyle = false;
                break;
            case 1:
                self.optionsPageSettings.fullNameStyle = false;
                break;
            default:
                break;
        }
    }
    
    if (indexPath.section == 3) {
        switch (checked) {
            case 0:
                self.optionsPageSettings.answerStyleAlert = true;
                break;
            case 1:
                self.optionsPageSettings.answerStyleLabel = true;
                break;
            default:
                break;
        }
        switch (unchecked) {
            case 0:
                self.optionsPageSettings.answerStyleAlert = false;
                break;
            case 1:
                self.optionsPageSettings.answerStyleLabel = false;
                break;
            default:
                break;
        }
    }
}

//////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    self.optionsPageSettings = [[globalSettingsObject alloc]init];  //it will call initWithCoder to restore prior settings
    
    [self.optionsTableView registerClass:[UITableViewCell class]
                    forCellReuseIdentifier:@"basicCell"];
    [self.optionsTableView registerClass:[UITableViewCell class]
                  forCellReuseIdentifier:@"defaultCell"];

}

//////////////////////////////////////////////

- (IBAction)doneButton:(id)sender {
    self.myPresenter.mainPageSettings = self.optionsPageSettings;           //main page needs to know the current settings
    [self.myPresenter displayNameStyle];
    
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmBeforeReset {
    
    NSString *warningMessage = @"You are about to reset all options to default settings\n(also reenables the welcome screen)";
    UIAlertController *welcomeAlert = [UIAlertController alertControllerWithTitle:@"ARE YOU SURE?"
                                                                          message:warningMessage
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *reset = [UIAlertAction actionWithTitle:@"Confirm Reset"
                                        style:UIAlertActionStyleDestructive
                                        handler:^(UIAlertAction * action) {self.optionsPageSettings = [self.optionsPageSettings initToDefaults];                                         [self.optionsPageSettings saveChanges];
                                            [self.optionsTableView reloadData];}];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action) {}];
    [welcomeAlert addAction:reset];
    [welcomeAlert addAction:cancel];
    
    [self presentViewController:welcomeAlert animated:YES completion:nil];
}

- (void)displayInformationView {
    
    NSString *infoMessage = @"\nTurn the Ringer or Side Switch ON.\nTap ‘Play’ on Main Screen to hear an interval, then tap the button with interval name to see if you identified it correctly.\n\nThe Options page allows you to configure how intervals are played, and how names or answers are displayed.\n\nMore information at:";
    
    UIAlertController *InfoView = [UIAlertController alertControllerWithTitle:@"INTERVALIX INSTRUCTIONS:"
                                                                          message:infoMessage
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *goToSupport = [UIAlertAction actionWithTitle:@"facebook.com/Intervalix"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action) {[self openLink];}];
    
    UIAlertAction *done = [UIAlertAction actionWithTitle:@"DONE"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * action) {}];
    
    [InfoView addAction:goToSupport];
    [InfoView addAction:done];
    
    [self presentViewController:InfoView animated:YES completion:nil];
}

-(void)openLink
{
    UIApplication *mySafari = [UIApplication sharedApplication];
    
    NSURL *myURL = [[NSURL alloc]initWithString:@"http://facebook.com/Intervalix"];
    
    [mySafari openURL:myURL];
    
    
}


@end
