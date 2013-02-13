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
@property (nonatomic, unsafe_unretained) IBOutlet ACEDrawingView *drawingView;

-(UIImage *) getImageWithUnsaturatedPixelsOfImage:(UIImage *)image;
-(UIImage *) getImageWithTintedColor:(UIImage *)image withTint:(UIColor *)color withIntensity:(float)alpha;

+ (UIImage *) replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance ;
+ (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color;
- (void)getRGBAsFromImage:(UIImage*)image atX:(int)xx andY:(int)yy count:(int)count;


-(UIImage *) getImageWithChangePixelsOfImage:(UIImage *)image withColor :(UIColor*)color;

@end
