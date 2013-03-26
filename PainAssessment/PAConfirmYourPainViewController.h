//
//  PAConfirmYourPainViewController.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACEDrawingView.h"


@interface PAConfirmYourPainViewController :  UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>{
    
    UIPickerView *_pickerView;
    NSArray *bodyPickerArray1Row;
    NSArray *bodyPickerArray2Row;
    UIImage *cgangedImage;
    UIView *drView;
}
@property (nonatomic, strong) UIImage *cgangedImage;

@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) IBOutlet UIView *drView;
@property (nonatomic, unsafe_unretained) IBOutlet UIImageView *drawingView;


- (UIImage *)getRGBAsFromImage:(UIImage*)myImage redPx:(int)redNew greenPx:(int)greenNew bluePx:(int)blueNew;

@end
