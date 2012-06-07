//
//  PreferencesViewController.m
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferencesViewController.h"
#import "ASIFormDataRequest.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController
@synthesize iAmMale;
@synthesize iAmFemale;
@synthesize lookingForMale;
@synthesize lookingForFemale;
@synthesize arrImages;
@synthesize tagLineTextField;

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
    
   // tagLineTextField.hidden = true;
        
}



- (void)viewDidUnload
{
    [self setIAmMale:nil];
    [self setIAmFemale:nil];
    [self setLookingForMale:nil];
    [self setLookingForFemale:nil];
    [self setTagLineTextField:nil];
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
    [arrImages release];
    [tagLineTextField release];
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

- (IBAction)postImageToServer:(id)sender 
{
    if ([arrImages count] > 0) 
    {
		NSString *strURL = @"URL Here";// URL to upload image
		ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
		[request setDelegate:self];
		[request setPostValue:@"This is sample text..." forKey:@"text"];//Here write down the text which will be sent.
		for (int i = 0; i < [arrImages count]; i++) 
        {
			[request addData:[arrImages objectAtIndex:i] withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image%d", i + 1]];
		}	
		[request startAsynchronous];
	}
	else 
    {
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error !!" message:@"Please select images..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
}

- (void)requestFinished:(ASIHTTPRequest *)request 
{
	NSString *receivedString = [request responseString];
    NSLog(@"%@",request);	
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:receivedString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	
}
- (void)requestFailed:(ASIHTTPRequest *)request 
{
	
	NSString *receivedString = [request responseString];
    
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error !!" message:receivedString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}
- (IBAction)TakeAPicture:(id)sender 
{
    
    if ( ([[userPreference objectForKey:@"IamMALE"] isEqualToString:@"yes"] || [[userPreference objectForKey:@"IamFEMALE"] isEqualToString:@"yes"]) && ([[userPreference objectForKey:@"SeekMALE"] isEqualToString:@"yes"] || [[userPreference objectForKey:@"SeekFEMALE"] isEqualToString:@"yes"]) ) 
    {
        NSLog(@"IamMALE %@",[userPreference objectForKey:@"IamMALE"]);
        NSLog(@"IamFEMALE %@",[userPreference objectForKey:@"IamFEMALE"]);
        
        NSLog(@"SeekMALE %@",[userPreference objectForKey:@"SeekMALE"]);
        NSLog(@"SeekFEMALE %@",[userPreference objectForKey:@"SeekFEMALE"]);
        
       imagePicker = [[UIImagePickerController alloc] init];
        
         NSLog(@"Device:  %@",[[UIDevice currentDevice] model]);
        // Set source to the camera
        if ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone Simulator"]) 
            imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        else 
            imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        // Allow editing of image ?
       // imagePicker.allowsImageEditing = NO;
        
        // Show image picker
        [self presentModalViewController:imagePicker animated:YES];	
    }
    else 
    {
        NSLog(@"Select Any Preference");
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error !!" message:@"Please select your preferences" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];
        [errorAlert release];
    }
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    
	// Unable to save the image  
    if (error)
        alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                           message:@"Unable to save image to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    // Image is saved successfully
	else 
        alert = [[UIAlertView alloc] initWithTitle:@"Success" 
                                           message:@"Image saved to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    [self.navigationController dismissModalViewControllerAnimated:YES];	
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Initialize array (arrImages)
    arrImages = [[NSMutableArray alloc] init]; 
    
	// Access the uncropped image from info dictionary
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // Convert Image to NSData (byte format)
    NSData *dataImage =  UIImageJPEGRepresentation(image,1);
    
    // Add encoded image to Array
    [arrImages addObject:dataImage];
    
	// Save image to Album
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
	[picker release];
    //tagLineTextField.hidden = false;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker 
{
    // Dismiss image picker
	[self.navigationController dismissModalViewControllerAnimated:YES];	
}


@end
