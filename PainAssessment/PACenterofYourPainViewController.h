//
//  PACenterofYourPainViewController.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACEDrawingView.h"
#import "PAReportOnPain.h"
#import <MapKit/MapKit.h>


@interface PACenterofYourPainViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, MKAnnotation, MKMapViewDelegate>{
    
    UIPickerView *_pickerView;
    NSArray *bodyPickerArray1Row;
    NSArray *bodyPickerArray2Row;
    
    UIImage *firstImageOfFullBody;
    UIImage *firstImageOfHandRight;
    UIImage *firstImageOfKneeRight;
    UIImage *firstImageOfFootRight;

    UIImage *lastImageOfFullBody;
    UIImage *lastImageOfHandRight;
    UIImage *lastImageOfKneeRight;
    UIImage *lastImageOfFootRight;
}


@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;
@property (nonatomic, unsafe_unretained) IBOutlet UIImageView *drawingView;
@property (nonatomic, strong) IBOutlet UIView *drView;
@property (nonatomic, unsafe_unretained) IBOutlet UIImageView *pinView;
@property (nonatomic, strong) IBOutlet UIButton *removeAllPinsButton;
@property (nonatomic, strong) IBOutlet UIButton *removeLastPinButton;

@property (nonatomic, strong) UIGestureRecognizer *myGest;
@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, strong) MKPointAnnotation *point;

- (IBAction)removeAllPinsButtonPressed:(id)sender;
- (IBAction)removeLastPinButtonPressed:(id)sender;


@end
