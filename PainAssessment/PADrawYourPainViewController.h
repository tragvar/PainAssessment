//
//  PADrawYourPainViewController.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@class ACEDrawingView;

@interface PADrawYourPainViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>{
    
    UIImageView *_imageView;
    UIImage *screenShot;
    UIColor *pixelColor;
    UIColor *whiteC;
    
    
    UIPickerView *_pickerView;
    NSArray *bodyPickerArray1Row;
    NSArray *bodyPickerArray2Row;
    
    CGPoint lastPoint;
}

@property (nonatomic, assign) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineAlpha;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIView *drView;
@property (nonatomic, unsafe_unretained) IBOutlet ACEDrawingView *drawingView;
@property (nonatomic, retain) IBOutlet UISlider *lineWidthSlider;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;

@property (nonatomic, unsafe_unretained) IBOutlet UIButton *undoButton;
@property (nonatomic, unsafe_unretained) IBOutlet UIButton *redoButton;


- (IBAction)undo:(id)sender;
- (IBAction)redo:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)widthChange:(UISlider *)sender;


@end
