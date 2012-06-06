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
    userPreference = [NSUserDefaults standardUserDefaults];
    [userPreference removeObjectForKey:@"IamMALE"];
    [userPreference removeObjectForKey:@"IamFEMALE"];
    [userPreference removeObjectForKey:@"SeekMALE"];
    [userPreference removeObjectForKey:@"SeekFEMALE"];
    
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

- (IBAction)maleSelectAction:(id)sender 
{
    if ([iAmMale isSelected]) 
    {
        [iAmMale setImage:[UIImage imageNamed:@"MaleUnselected.png"] forState:UIControlStateNormal];
        [iAmMale setSelected:NO];
        
        [userPreference setObject:@"no" forKey:@"IamMALE"];
        
    }
    else
    {
        [iAmMale setImage:[UIImage imageNamed:@"MaleSelected.png"] forState:UIControlStateSelected];
        [iAmMale setSelected:YES];
        [iAmFemale setImage:[UIImage imageNamed:@"FemaleUnselected.png"] forState:UIControlStateNormal];
        [iAmFemale setSelected:NO];
        
        [userPreference setObject:@"yes" forKey:@"IamMALE"];
        [userPreference setObject:@"no" forKey:@"IamFEMALE"];
       
    }
    [userPreference synchronize];

}

- (IBAction)femaleSelectAction:(id)sender 
{
    if ([iAmFemale isSelected]) 
    {
        [iAmFemale setImage:[UIImage imageNamed:@"FemaleUnselected.png"] forState:UIControlStateNormal];
        [iAmFemale setSelected:NO];
        
        [userPreference setObject:@"no" forKey:@"IamFEMALE"];
        
    }
    else
    {
        [iAmFemale setImage:[UIImage imageNamed:@"FemaleSelected.png"] forState:UIControlStateSelected];
        [iAmFemale setSelected:YES];
        [iAmMale setImage:[UIImage imageNamed:@"MaleUnselected.png"] forState:UIControlStateNormal];
        [iAmMale setSelected:NO];
        
        [userPreference setObject:@"yes" forKey:@"IamFEMALE"];
        [userPreference setObject:@"no" forKey:@"IamMALE"];
    }
    [userPreference synchronize];
}

- (IBAction)lookingforMaleSelectAction:(id)sender 
{
    if ([lookingForMale isSelected]) 
    {
        [lookingForMale setImage:[UIImage imageNamed:@"MaleUnselected.png"] forState:UIControlStateNormal];
        [lookingForMale setSelected:NO];
        
        [userPreference setObject:@"no" forKey:@"SeekMALE"];
        
    }
    else
    {
        [lookingForMale setImage:[UIImage imageNamed:@"MaleSelected.png"] forState:UIControlStateSelected];
        [lookingForMale setSelected:YES];
        [lookingForFemale setImage:[UIImage imageNamed:@"FemaleUnselected.png"] forState:UIControlStateNormal];
        [lookingForFemale setSelected:NO];
        
        [userPreference setObject:@"yes" forKey:@"SeekMALE"];
        [userPreference setObject:@"no" forKey:@"SeekFEMALE"];
        
    }
    [userPreference synchronize];
}

- (IBAction)lookingforFemaleSelectAction:(id)sender 
{
    if ([lookingForFemale isSelected]) 
    {
        [lookingForFemale setImage:[UIImage imageNamed:@"FemaleUnselected.png"] forState:UIControlStateNormal];
        [lookingForFemale setSelected:NO];
        
        [userPreference setObject:@"no" forKey:@"SeekFEMALE"];
    }
    else
    {
        [lookingForFemale setImage:[UIImage imageNamed:@"FemaleSelected.png"] forState:UIControlStateSelected];
        [lookingForFemale setSelected:YES];
        [lookingForMale setImage:[UIImage imageNamed:@"MaleUnselected.png"] forState:UIControlStateNormal];
        [lookingForMale setSelected:NO];
        
        [userPreference setObject:@"yes" forKey:@"SeekFEMALE"];
        [userPreference setObject:@"no" forKey:@"SeekMALE"];
        
    }
    [userPreference synchronize];
}

- (IBAction)TakeAPicture:(id)sender 
{
    
    
    NSLog(@"IamMALE %@",[userPreference objectForKey:@"IamMALE"]);
    NSLog(@"IamFEMALE %@",[userPreference objectForKey:@"IamFEMALE"]);
    
    NSLog(@"SeekMALE %@",[userPreference objectForKey:@"SeekMALE"]);
    NSLog(@"SeekFEMALE %@",[userPreference objectForKey:@"SeekFEMALE"]);
    
    if ( ([[userPreference objectForKey:@"IamMALE"] isEqualToString:@"yes"] || [[userPreference objectForKey:@"IamFEMALE"] isEqualToString:@"yes"]) && ([[userPreference objectForKey:@"SeekMALE"] isEqualToString:@"yes"] || [[userPreference objectForKey:@"SeekFEMALE"] isEqualToString:@"yes"]) ) 
    {
        NSLog(@"IamMALE %@",[userPreference objectForKey:@"IamMALE"]);
        NSLog(@"IamFEMALE %@",[userPreference objectForKey:@"IamFEMALE"]);
        
        NSLog(@"SeekMALE %@",[userPreference objectForKey:@"SeekMALE"]);
        NSLog(@"SeekFEMALE %@",[userPreference objectForKey:@"SeekFEMALE"]);
    }
    
  /*  if (([iAmMale isSelected]  || [iAmFemale isSelected] ) && ([lookingForMale isSelected] || [lookingForFemale isSelected])) 
    {
        NSLog(@"Open Camera");
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        // Allow editing of image ?
       // imagePicker.allowsImageEditing = NO;
        
        // Show image picker
        [self presentModalViewController:imagePicker animated:YES];
    }*/
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"Image"];
    
    // Save image
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [picker release];
}

@end
