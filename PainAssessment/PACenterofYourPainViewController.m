//
//  PACenterofYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PACenterofYourPainViewController.h"
#import "PADrawYourPainViewController.h"
#import "PAConfirmYourPainViewController.h"
#import "ACEDrawingView.h"
#import <QuartzCore/QuartzCore.h>




@interface PACenterofYourPainViewController ()

@end

@implementation PACenterofYourPainViewController

@synthesize pickerView;

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(showNextView)];
 
    bodyPickerArray1Row = [[NSArray alloc] initWithObjects:@"Full Body", @"Hend", @"Knee", @"Foot", nil];
    bodyPickerArray2Row = [[NSArray alloc] initWithObjects:@"Left", @"Right", nil];
    
    self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FullBody.png"]];
//    self.drawingView.image =  screenShot;
    self.drawingView.layer.borderWidth = 1;
    self.drawingView.layer.cornerRadius = 20;

}



- (void)showNextView
{  
    PAConfirmYourPainViewController *numberListView = [[PAConfirmYourPainViewController alloc] initWithNibName:@"PAConfirmYourPainViewController" bundle:nil];
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
}

#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [bodyPickerArray1Row count];
    }
    else
    {
        return [bodyPickerArray2Row count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [bodyPickerArray1Row objectAtIndex:row];
    }
    else
    {
        return [bodyPickerArray2Row objectAtIndex:row];
    }
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        
        
        
        switch (row+1) {
            case 1:
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FullBody.png"]];
                break;
            case 2:
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"HandRight.png"]];
                break;
            case 3:
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"KneeRight.png"]];
                break;
            case 4:
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FootRight.png"]];
                break;
                
            default:
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FullBody.png"]];
                break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
