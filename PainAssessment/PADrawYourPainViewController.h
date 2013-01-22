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
    UIColor* pixelColor;
    
    
    UIPickerView *_pickerView;
    NSArray *bodyPickerArray1Row;
    NSArray *bodyPickerArray2Row;
    
    CGPoint lastPoint;
}

@property (nonatomic, unsafe_unretained) IBOutlet ACEDrawingView *drawingView;
@property (nonatomic, unsafe_unretained) IBOutlet UISlider *lineWidthSlider;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIImageView *drawImageView;

@property (nonatomic, unsafe_unretained) IBOutlet UIButton *undoButton;
@property (nonatomic, unsafe_unretained) IBOutlet UIButton *redoButton;


- (IBAction)undo:(id)sender;
- (IBAction)redo:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)widthChange:(UISlider *)sender;

- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage;

@end
