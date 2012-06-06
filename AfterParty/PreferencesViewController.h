//
//  PreferencesViewController.h
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreferencesViewController : UIViewController
{
    
}
@property (retain, nonatomic) IBOutlet UIButton *iAmMale;
@property (retain, nonatomic) IBOutlet UIButton *iAmFemale;
@property (retain, nonatomic) IBOutlet UIButton *lookingForMale;
@property (retain, nonatomic) IBOutlet UIButton *lookingForFemale;
- (IBAction)TakeAPicture:(id)sender;

@end
