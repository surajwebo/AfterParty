//
//  PreferencesViewController.m
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferencesViewController.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController
@synthesize iAmMale;
@synthesize iAmFemale;
@synthesize lookingForMale;
@synthesize lookingForFemale;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



- (void)viewDidUnload
{
    [self setIAmMale:nil];
    [self setIAmFemale:nil];
    [self setLookingForMale:nil];
    [self setLookingForFemale:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [iAmMale release];
    [iAmFemale release];
    [lookingForMale release];
    [lookingForFemale release];
    [super dealloc];
}
- (IBAction)TakeAPicture:(id)sender 
{
    
}
@end
