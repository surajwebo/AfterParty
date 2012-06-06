//
//  ViewController.m
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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

/*-(void) viewDidAppear:(BOOL)animated{
    countDown=120;
    NSTimer *secTimer=[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateCountDown:) userInfo:nil repeats:YES];
}

-(void) updateCountDown:(NSTimer *) theTimer
{
    NSInteger mins,secs;
    NSString *timeString;
    countDown--;
    if (countDown>=0) 
    {
        mins=countDown/60;
        secs=countDown%60;
        displayTimeLabel.text=[NSString stringWithFormat:@"%02d:%02d",mins,secs];
        
    } 
    else 
    {
        [theTimer invalidate];
        // do whatever you wanted to do after two minutes
    }
    
}*/

- (void)use:(id)sender {
    // start timer
    
    // set userInfo to nil as we don't need user interaction
}
/*
-(void)updateTimer{
    timeRemaining=timeRemaining-1;
    int days=(int)((double)timeRemaining/(3600.0*24.00));
    int diffDay=timeRemaining-(days*3600*24);
    int hours=(int)((double)diffDay/3600.00);
    int diffMin=diffDay-(hours*3600);
    int minutes=(int)(diffMin/60.0);
    int seconds=diffMin-(minutes*60);
    NSLog(@”%d Days %d Hours %d Minutes %d Seconds”,days,hours,minutes,seconds);
}
*/
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
