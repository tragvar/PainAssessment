//
//  PAConfirmYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PAConfirmYourPainViewController.h"
#import "ACEDrawingView.h"
#import "PADrawYourPainViewController.h"
#import "PADescribeYourPainViewController.h"
#import "PAReportOnPain.h"
#import <QuartzCore/QuartzCore.h>


@interface PAConfirmYourPainViewController ()

@end

@implementation PAConfirmYourPainViewController

@synthesize textView;
@synthesize pickerView;
@synthesize drView;
@synthesize cgangedImage;

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
    bodyPickerArray1Row = [[NSArray alloc] initWithObjects:@"Full Body", @"Hend", @"Knee", @"Foot", nil];
    bodyPickerArray2Row = [[NSArray alloc] initWithObjects:@"Left", @"Right", nil];
    
//    self.textView.backgroundColor = [PAReportOnPain sharedInstance].intensityOfPain;
    
    cgangedImage = [self getRGBAsFromImage:[PAReportOnPain sharedInstance].imageOfFullBody redPx:0 greenPx:0 bluePx:255];
    self.drawingView.image = cgangedImage;
    self.drView.layer.borderWidth = 1;
    self.drView.layer.cornerRadius = 20;    
}

- (UIImage *)getRGBAsFromImage:(UIImage*)myImage redPx:(int)redNew greenPx:(int)greenNew bluePx:(int)blueNew{   
    // First get the image into your data buffer
    CGImageRef imageRef = [myImage CGImage];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bitmapContext      =   CGBitmapContextCreate(NULL,CGImageGetWidth(imageRef),CGImageGetHeight(imageRef),8,CGImageGetWidth(imageRef)*4,colorSpace,kCGImageAlphaPremultipliedLast);
    CGContextDrawImage(bitmapContext, CGRectMake(0, 0, CGBitmapContextGetWidth(bitmapContext), CGBitmapContextGetHeight(bitmapContext)), imageRef);
    UInt8* data                     =   CGBitmapContextGetData(bitmapContext);
    int numComponents               =   4;
    int bytesInContext              =   CGBitmapContextGetHeight(bitmapContext) * CGBitmapContextGetBytesPerRow(bitmapContext);
    double redIn, greenIn, blueIn;

    for (int i = 0; i < bytesInContext; i += numComponents)        
    {
        redIn                       =   (double)data[i]/255.0;
        greenIn                     =   (double)data[i+1]/255.0;
        blueIn                      =   (double)data[i+2]/255.0;

        if ((redIn == 0 && greenIn == 0 && blueIn == 0) )
        {
            data[i] = (redNew);
            data[i+1] = (greenNew);
            data[i+2] = (blueNew);
        }        
    }
    CGImageRef outImage             =   CGBitmapContextCreateImage(bitmapContext);
    myImage                         =   [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    CGContextRelease(bitmapContext);
    return myImage;
}

#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [bodyPickerArray1Row count];
    }
    else{return [bodyPickerArray2Row count];}
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
                self.drawingView.image = [self getRGBAsFromImage:[PAReportOnPain sharedInstance].imageOfFullBody redPx:0 greenPx:0 bluePx:255];
                break;
            case 2:
                self.drawingView.image = [self getRGBAsFromImage:[PAReportOnPain sharedInstance].imageOfHandRight redPx:0 greenPx:0 bluePx:255];
                break;
            case 3:
                self.drawingView.image = [self getRGBAsFromImage:[PAReportOnPain sharedInstance].imageOfKneeRight redPx:0 greenPx:0 bluePx:255];
                break;
            case 4:
                self.drawingView.image = [self getRGBAsFromImage:[PAReportOnPain sharedInstance].imageOfFootRight redPx:0 greenPx:0 bluePx:255];
                break;
                
            default:
                self.drawingView.image = [self getRGBAsFromImage:[PAReportOnPain sharedInstance].imageOfFullBody redPx:0 greenPx:0 bluePx:255];
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
