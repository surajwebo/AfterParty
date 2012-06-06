//
//  ViewController.m
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PreferencesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    progress=[[UILabel alloc] initWithFrame:CGRectMake(100, 85, 180, 90)];
    [progress setFont:[UIFont fontWithName:@"Verdana" size:42]];
    progress.textColor=[UIColor blackColor];
    [progress setText:@"59:59"];
    progress.backgroundColor=[UIColor clearColor];
    [self.view addSubview:progress];
    currMinute=59;
    currSeconds=60;
    
    [self start];

}

-(void)start
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}

-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=60;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [progress setText:[NSString stringWithFormat:@"%@%d%@%02d",@"",currMinute,@":",currSeconds]];
    }
    else
    {
        [timer invalidate];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)goToPreferences:(id)sender 
{
    NSLog(@"Push View to preferences");
    PreferencesViewController *preferencesViewController = [[PreferencesViewController alloc] initWithNibName:@"PreferencesViewController" bundle:nil];
    [self.navigationController pushViewController:preferencesViewController animated:YES];
    [preferencesViewController release];
}

@end
