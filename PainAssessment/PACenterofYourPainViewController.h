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
    
}


@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;
@property (nonatomic, unsafe_unretained) IBOutlet UIImageView *drawingView;
@property (nonatomic, strong) IBOutlet UIView *drView;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;



@property (nonatomic, readwrite) UIImage *screenShotCenter;
@property (nonatomic, strong) PAReportOnPain *reportOnPian;

@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, strong) MKPointAnnotation *point;


@end
