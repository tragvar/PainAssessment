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
#import "PACenterofYourPainViewController.h"
#import "ACEDrawingView.h"
#import "PAReportOnPain.h"

#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>



@interface PADrawYourPainViewController ()<ACEDrawingViewDelegate>

@end

@implementation PADrawYourPainViewController

@synthesize drView;
@synthesize pickerView;
@synthesize screenShotDraw;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
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
    self.drawingView.lineWidth = 3;
//    self.drawingView.lineColor = [UIColor redColor];
    self.lineWidthSlider.value = 1.5;
    self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FullBody.png"]];
    self.drView.layer.borderWidth = 1;
    self.drView.layer.cornerRadius = 20;
    
    [PAReportOnPain sharedInstance].pickerPosition = [self.pickerView selectedRowInComponent:0];
}

- (void)showNextView{
    [PAReportOnPain sharedInstance].pickerPosition = 0;
    PADescribeYourPainViewController *numberListView = [[PADescribeYourPainViewController alloc] initWithNibName:@"PADescribeYourPainViewController" bundle:nil];
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
}
   
- (UIImage*) setScreenShot{
    
    UIGraphicsBeginImageContextWithOptions(self.drawingView.bounds.size, self.drawingView.opaque, 0.0);
    [self.drawingView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    self.screenShotDraw = img;
    int row = [self.pickerView selectedRowInComponent:0];
    NSLog(@"%d", row);
    switch (row+1) {
        case 1:
            [PAReportOnPain sharedInstance].imageOfFullBody = self.screenShotDraw;
            break;
        case 2:
            [PAReportOnPain sharedInstance].imageOfHandRight = self.screenShotDraw;
            break;
        case 3:
            [PAReportOnPain sharedInstance].imageOfKneeRight = self.screenShotDraw;
            break;
        case 4:
            [PAReportOnPain sharedInstance].imageOfFootRight = self.screenShotDraw;
            break;
            
        default:
            [PAReportOnPain sharedInstance].imageOfFullBody = self.screenShotDraw;
            break;
    }
//    UIGraphicsEndImageContext();
    return img;
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
    [PAReportOnPain sharedInstance].pickerPosition = row;
    if (component == 0) {
    switch (row+1) {
        case 1:
            [self.drawingView clear];                       
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFullBody];
            break;
        case 2:
            [self.drawingView clear];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfHandRight];
            break;
        case 3:
            [self.drawingView clear];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfKneeRight];
            break;
        case 4:
            [self.drawingView clear];
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFootRight];
            break;
            
        default:
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:[PAReportOnPain sharedInstance].imageOfFullBody];
            break;
        }
    }
}

#pragma mark - actions buttons

- (void)updateButtonStatus{
    self.undoButton.enabled = [self.drawingView canUndo];
    self.redoButton.enabled = [self.drawingView canRedo];
}

- (IBAction)undo:(id)sender{
    [self.drawingView undoLatestStep];
    [self setScreenShot];
    [self updateButtonStatus];
}

- (IBAction)redo:(id)sender{
    [self.drawingView redoLatestStep];
    [self setScreenShot];
    [self updateButtonStatus];
}

- (IBAction)clear:(id)sender{
    [self.drawingView clear];
    [self setScreenShot];
    [self updateButtonStatus];
}

- (IBAction)widthChange:(UISlider *)sender{
    self.drawingView.lineWidth = sender.value * 2;
}


#pragma mark - ACEDrawing View Delegate

- (void)drawingView:(ACEDrawingView *)view didEndDrawFreeformAtPoint:(CGPoint)point{
    [self updateButtonStatus];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
