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
@synthesize screenShotCenter;
@synthesize drView;
@synthesize reportOnPian;
@synthesize point;

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
    PADrawYourPainViewController *obj = [[PADrawYourPainViewController alloc]init];
        
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(showNextView)];
 
    bodyPickerArray1Row = [[NSArray alloc] initWithObjects:@"Full Body", @"Hend", @"Knee", @"Foot", nil];
    bodyPickerArray2Row = [[NSArray alloc] initWithObjects:@"Left", @"Right", nil];
    
    screenShotCenter = [obj setScreenShot];
    self.drawingView.image = [PAReportOnPain sharedInstance].imageOfPain;
    [self.mapView addSubview:self.drawingView];
    self.drView.layer.borderWidth = 1;
    self.drView.layer.cornerRadius = 20;
}



- (void)showNextView
{  
    PAConfirmYourPainViewController *numberListView = [[PAConfirmYourPainViewController alloc] initWithNibName:@"PAConfirmYourPainViewController" bundle:nil];
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    point = [[MKPointAnnotation alloc] init];
    UITouch *touch = [touches anyObject];
    self.currentPoint = [touch locationInView:self.drawingView];
    
    CLLocationCoordinate2D location;
    location.latitude = self.currentPoint.x;
    location.longitude = self.currentPoint.y;
    point.coordinate = location;
    
//    [point setAccessibilityActivationPoint:self.currentPoint];
//    [point setTitle:@"zdghn"];
    
    NSLog(@" %f, %f", self.currentPoint.x, self.currentPoint.y);
    
    [self.mapView viewForAnnotation:point];

    [self.mapView addAnnotation:point];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id ) annotation{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    annView.pinColor = MKPinAnnotationColorGreen;
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    annView.calloutOffset = CGPointMake(-5, 5);
    return annView;
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
