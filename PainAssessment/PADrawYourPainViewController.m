//
//  PADrawYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PADrawYourPainViewController.h"
#import "PADescribeYourPainViewController.h"
#import "ACEDrawingView.h"


@interface PADrawYourPainViewController ()<ACEDrawingViewDelegate>

@end

@implementation PADrawYourPainViewController

@synthesize pickerView;
@synthesize drawImageView;

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
    
    self.drawingView.backgroundColor = [UIColor colorWithPatternImage:self.drawImageView.image = [UIImage imageNamed:@"FullBody.png"]];
    
    // set the delegate
    self.drawingView.delegate = self;
    
    // start with red
    self.drawingView.lineColor = [UIColor redColor];
    self.lineWidthSlider.value = self.drawingView.lineWidth;
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
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:self.drawImageView.image = [UIImage imageNamed:@"FullBody.png"]];
            break;
        case 2:
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:self.drawImageView.image = [UIImage imageNamed:@"HandRight.png"]];
            break;
        case 3:
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:self.drawImageView.image = [UIImage imageNamed:@"KneeRight.png"]];
            break;
        case 4:
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:self.drawImageView.image = [UIImage imageNamed:@"FootRight.png"]];
            break;
            
        default:
            self.drawingView.backgroundColor = [UIColor colorWithPatternImage:self.drawImageView.image = [UIImage imageNamed:@"FullBody.png"]];
            break;
        }
    }
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(_answers != nil){
//        return [_answers count]+2;
//    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row ==0) {
        return 80;
    }
    
    return 40;
}



// BUTTONS ACTIONS

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
    self.drawingView.lineWidth = sender.value * 10;
}

#pragma mark - ACEDrawing View Delegate

- (void)drawingView:(ACEDrawingView *)view didEndDrawFreeformAtPoint:(CGPoint)point
{
    [self updateButtonStatus];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
