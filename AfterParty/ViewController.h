//
//  ViewController.h
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UILabel *progress;
    NSTimer *timer;
    int currHours;
    int currMinute;
    int currSeconds;
    
    
}
- (IBAction)goToPreferences:(id)sender;

@end
