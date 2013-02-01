//
//  PACenterofYourPainViewController.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACEDrawingView.h"


@interface PACenterofYourPainViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    
    UIPickerView *_pickerView;
    NSArray *bodyPickerArray1Row;
    NSArray *bodyPickerArray2Row;
    
}


@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;
@property (nonatomic, unsafe_unretained) IBOutlet UIImageView *drawingView;

@property (nonatomic, readwrite) UIImage *screenShotCenter;



@end
