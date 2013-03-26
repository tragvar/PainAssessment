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
#import "PAReportOnPain.h"

#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>

@class PADrawYourPainViewController;

@implementation PACenterofYourPainViewController

@synthesize pickerView;
@synthesize drView;
@synthesize point;
@synthesize myGest;

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
    
    myGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(drawingViewTapped:)];
    [self.drawingView addGestureRecognizer:myGest];
    
    firstImageOfFullBody = [PAReportOnPain sharedInstance].imageOfFullBody;
    firstImageOfHandRight = [PAReportOnPain sharedInstance].imageOfHandRight;
    firstImageOfKneeRight = [PAReportOnPain sharedInstance].imageOfKneeRight;
    firstImageOfFootRight = [PAReportOnPain sharedInstance].imageOfFootRight;
    
    lastImageOfFullBody = firstImageOfFullBody;
    lastImageOfHandRight = firstImageOfHandRight;
    lastImageOfKneeRight = firstImageOfKneeRight;
    lastImageOfFootRight = firstImageOfFootRight;
    
    self.removeLastPinButton.enabled = NO;

    self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFullBody];
    self.pinView.frame = CGRectMake(100, -100, self.pinView.frame.size.width, self.pinView.frame.size.height);
    [self.drawingView addSubview:self.pinView];
    self.drView.layer.borderWidth = 1;
    self.drView.layer.cornerRadius = 20;
}
-(void)drawingViewTapped:(UIGestureRecognizer *)gestureRecognizer{
    [self setLasstScreen];
    self.pinView.frame = CGRectMake(self.currentPoint.x - 8, self.currentPoint.y - 34, self.pinView.frame.size.width, self.pinView.frame.size.height);
    [self.drawingView addSubview:self.pinView];
    self.removeLastPinButton.enabled = YES;
    [self setScreenShot];
}

-(void)didTapped{
    self.pinView.frame = CGRectMake(100, -100, self.pinView.frame.size.width, self.pinView.frame.size.height);
    [self.drawingView addSubview:self.pinView];   
}

- (void)showNextView{  
    PAConfirmYourPainViewController *numberListView = [[PAConfirmYourPainViewController alloc] initWithNibName:@"PAConfirmYourPainViewController" bundle:nil];
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{    
    UITouch *touch = [touches anyObject];
    self.currentPoint = [touch locationInView:self.drawingView];
    NSLog(@" %f, %f", self.currentPoint.x, self.currentPoint.y);    
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [PAReportOnPain sharedInstance].pickerPosition = row;

    if (component == 0) {
        switch (row+1) {
            case 1:
                self.pinView.frame = CGRectMake(1000, 1000, self.pinView.frame.size.width, self.pinView.frame.size.height);
                [self.drawingView addSubview:self.pinView];
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFullBody];
                break;
            case 2:
                self.pinView.frame = CGRectMake(1000, 1000, self.pinView.frame.size.width, self.pinView.frame.size.height);
                [self.drawingView addSubview:self.pinView];
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfHandRight];
                break;
            case 3:
                self.pinView.frame = CGRectMake(1000, 1000, self.pinView.frame.size.width, self.pinView.frame.size.height);
                [self.drawingView addSubview:self.pinView];
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfKneeRight];
                break;
            case 4:
                self.pinView.frame = CGRectMake(1000, 1000, self.pinView.frame.size.width, self.pinView.frame.size.height);
                [self.drawingView addSubview:self.pinView];
                self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFootRight];
                break;
                
            default:

                break;
        }
    }
}

- (UIImage*) setScreenShot{
    
    UIGraphicsBeginImageContextWithOptions(self.drawingView.bounds.size, self.drawingView.opaque, 0.0);
    [self.drawingView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    int row = [PAReportOnPain sharedInstance].pickerPosition;
    //    NSLog(@"%d", row);
    switch (row+1) {
        case 1:
            [PAReportOnPain sharedInstance].imageOfFullBody = img;
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFullBody];
            break;
        case 2:
            [PAReportOnPain sharedInstance].imageOfHandRight = img;
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfHandRight];
            break;
        case 3:
            [PAReportOnPain sharedInstance].imageOfKneeRight = img;
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfKneeRight];
            break;
        case 4:
            [PAReportOnPain sharedInstance].imageOfFootRight = img;
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFootRight];
            break;
            
        default:
            [PAReportOnPain sharedInstance].imageOfFullBody = img;
            break;
    }
    UIGraphicsEndImageContext();
    return img;
}

- (IBAction)removeAllPinsButtonPressed:(id)sender{

    self.removeLastPinButton.enabled = NO;
    int row = [PAReportOnPain sharedInstance].pickerPosition;
    switch (row+1) {
        case 1:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:firstImageOfFullBody];
            lastImageOfFullBody = firstImageOfFullBody;
            [self setScreenShot];
            break;
        case 2:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:firstImageOfHandRight];
            lastImageOfHandRight = firstImageOfHandRight;
            [self setScreenShot];
            break;
        case 3:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:firstImageOfKneeRight];
            lastImageOfKneeRight = firstImageOfKneeRight;
            [self setScreenShot];
            break;
        case 4:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:firstImageOfFootRight];
            lastImageOfFootRight = firstImageOfFootRight;
            [self setScreenShot];
            break;
            
        default:
            break;
    }

}

- (IBAction)removeLastPinButtonPressed:(id)sender{
    self.removeLastPinButton.enabled = NO;
    int row = [PAReportOnPain sharedInstance].pickerPosition;
    switch (row+1) {
        case 1:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:lastImageOfFullBody];
            [self setScreenShot];
            break;
        case 2:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:lastImageOfHandRight];
            [self setScreenShot];
            break;
        case 3:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:lastImageOfKneeRight];
            [self setScreenShot];
            break;
        case 4:
            [self didTapped];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:lastImageOfFootRight];
            [self setScreenShot];
            break;
            
        default:
            break;
    }
}

- (UIImage*)setLasstScreen{
    UIGraphicsBeginImageContextWithOptions(self.drawingView.bounds.size, self.drawingView.opaque, 0.0);
    [self.drawingView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    int row = [PAReportOnPain sharedInstance].pickerPosition;
    //    NSLog(@"%d", row);
    switch (row+1) {
        case 1:
            lastImageOfFullBody = [PAReportOnPain sharedInstance].imageOfFullBody;
            break;
        case 2:
            lastImageOfHandRight = [PAReportOnPain sharedInstance].imageOfHandRight;
            break;
        case 3:
            lastImageOfKneeRight = [PAReportOnPain sharedInstance].imageOfKneeRight;
            break;
        case 4:
            lastImageOfFootRight = [PAReportOnPain sharedInstance].imageOfFootRight;
            break;
            
        default:
            break;
    }
    UIGraphicsEndImageContext();
    return img;}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
