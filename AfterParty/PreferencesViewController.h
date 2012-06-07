//
//  PreferencesViewController.h
//  AfterParty
//
//  Created by Bhuvan Khanna on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreferencesViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    NSUserDefaults *userPreference;
    UIImagePickerController *imagePicker;
    NSMutableArray *arrImages;
    UIImageView *photoImageView;
    UIImage *image;
    NSData *dataImage;
    
}
@property (retain, nonatomic) IBOutlet UIButton *iAmMale;
@property (retain, nonatomic) IBOutlet UIButton *iAmFemale;
@property (retain, nonatomic) IBOutlet UIButton *lookingForMale;
@property (retain, nonatomic) IBOutlet UIButton *lookingForFemale;
@property (retain) NSMutableArray *arrImages;
@property (retain, nonatomic) IBOutlet UITextField *tagLineTextField;
@property (retain) UIImageView *photoImageView;
@property (retain) UIImage *image;


- (IBAction)maleSelectAction:(id)sender;
- (IBAction)femaleSelectAction:(id)sender;
- (IBAction)lookingforMaleSelectAction:(id)sender;
- (IBAction)lookingforFemaleSelectAction:(id)sender;
- (IBAction)postImageToServer:(id)sender;


- (IBAction)TakeAPicture:(id)sender;

@end
