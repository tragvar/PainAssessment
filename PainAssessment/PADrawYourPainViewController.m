//
//  PADrawYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#define RGB(r, g, b)[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


#import "PADrawYourPainViewController.h"
#import "PADescribeYourPainViewController.h"
#import "ACEDrawingView.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>



@interface PADrawYourPainViewController ()<ACEDrawingViewDelegate>

@end

@implementation PADrawYourPainViewController

@synthesize pickerView;

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
    
    
    // set the delegate
    self.drawingView.delegate = self;
    
    // start with red
    self.drawingView.lineWidth = 1.5;
    self.drawingView.lineColor = [UIColor redColor];
    self.lineWidthSlider.value = self.drawingView.lineWidth;
    self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FullBody.png"]];


}

- (void)showNextView
{
    PADescribeYourPainViewController *numberListView = [[PADescribeYourPainViewController alloc] initWithNibName:@"PADescribeYourPainViewController" bundle:nil];    
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
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


- (void)updateButtonStatus
{
    self.undoButton.enabled = [self.drawingView canUndo];
    self.redoButton.enabled = [self.drawingView canRedo];
}


- (IBAction)undo:(id)sender
{
    [self.drawingView undoLatestStep];
    [self updateButtonStatus];
}

- (IBAction)redo:(id)sender
{
    [self.drawingView redoLatestStep];
    [self updateButtonStatus];
}

- (IBAction)clear:(id)sender
{
    [self.drawingView clear];
    [self updateButtonStatus];
}

- (IBAction)widthChange:(UISlider *)sender
{
    self.drawingView.lineWidth = sender.value * 2;
}

#pragma mark - ACEDrawing View Delegate

//-(void)drawingView:(ACEDrawingView *)view willBeginDrawFreeformAtPoint:(CGPoint)point
//{
////    [self getPixelColorAtLocation:point];
//    whiteC = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
////    pixelColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
//
//    if ([pixelColor isEqual:whiteC]) {
//        NSLog(@"THE COLOR IS WHITE!!!");
//    }
//}


- (void)drawingView:(ACEDrawingView *)view didEndDrawFreeformAtPoint:(CGPoint)point
{
    [self updateButtonStatus];
}



//- (UIColor*) getPixelColorAtLocation:(CGPoint)point {
//    pixelColor = [UIColor colorWithRed:1 green: 1 blue:1 alpha:1];
////    CGImageRef inImage = (CGImageRef)CFBridgingRetain((_drawingView.backgroundColor));
//    CGImageRef inImage = [UIImage imageNamed:@"FullBody.png"].CGImage;
//
//    
////    [self CGImageWriteToFile:inImage, @"TESTPicture.png"];
//
//    // Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
//    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
//    if (cgctx == NULL) { return nil; /* error */ }
//    
//   
//    size_t w = CGImageGetWidth(inImage);
//    size_t h = CGImageGetHeight(inImage);
//    CGRect rect = {{0,0},{w,h}};
//    
//    // Draw the image to the bitmap context. Once we draw, the memory
//    // allocated for the context for rendering will then contain the
//    // raw image data in the specified color space.
//    CGContextDrawImage(cgctx, rect, inImage);
//    
//    // Now we can get a pointer to the image data associated with the bitmap
//    // context.
//    unsigned char* data = CGBitmapContextGetData (cgctx);
//    if (data != NULL) {
//        //offset locates the pixel in the data from x,y.
//        //4 for 4 bytes of data per pixel, w is width of one row of data.
//        int offset = 4*((w*round(point.y))+round(point.x));
//        int alpha =  data[offset];
//        int red = data[offset+1];
//        int green = data[offset+2];
//        int blue = data[offset+3];
////        NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
//        pixelColor = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
//    }
//    
//    // When finished, release the context
//    CGContextRelease(cgctx);
//    // Free image data memory for the context
//    if (data) { free(data); }
//    
//    return pixelColor;
//}
//
//- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage
//{
//    CGContextRef    context = (CGContextRef)inImage;
//    CGColorSpaceRef colorSpace;
//    void *          bitmapData;
//    int             bitmapByteCount;
//    int             bitmapBytesPerRow;
//    
//    size_t width = CGImageGetWidth(inImage);
//    size_t height = CGImageGetHeight(inImage);
//    
//    bitmapBytesPerRow   = (width * 4);
//    bitmapByteCount     = (bitmapBytesPerRow * height);
//    
//    // Use the generic RGB color space.
//    colorSpace = CGColorSpaceCreateDeviceRGB();
//    
//    if (colorSpace == NULL)
//    {
//        //fprintf(stderr, "Error allocating color space\n");
//        return NULL;
//    }
//    
//    bitmapData = malloc( bitmapByteCount );
//    if (bitmapData == NULL)
//    {
//        //fprintf (stderr, "Memory not allocated!");
//        CGColorSpaceRelease( colorSpace );
//        return NULL;
//    }
//    context = CGBitmapContextCreate (bitmapData,
//                                     width,
//                                     height,
//                                     8,      // bits per component
//                                     bitmapBytesPerRow,
//                                     colorSpace,
//                                     kCGImageAlphaPremultipliedFirst);
//    if (context == NULL)
//    {
//        free (bitmapData);
//    }
//    CGColorSpaceRelease( colorSpace );
//    
//    return context;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
