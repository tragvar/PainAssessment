//
//  PADrawYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PADrawYourPainViewController.h"
#import "PADescribeYourPainViewController.h"


@interface PADrawYourPainViewController ()

@end

@implementation PADrawYourPainViewController

@synthesize leftTableView;
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
            self.drawImageView.image = [UIImage imageNamed:@"FullBody.png"];
            break;
        case 2:
            if ([bodyPickerArray2Row objectAtIndex:row] == @"Left") {
            self.drawImageView.image = [UIImage imageNamed:@"HandRight.png"];
            }
            else{
                self.drawImageView.image = [UIImage imageNamed:@"HandLeft.png"];
            }
            break;
        case 3:
            self.drawImageView.image = [UIImage imageNamed:@"KneeRight.png"];
            break;
        case 4:
            self.drawImageView.image = [UIImage imageNamed:@"FootRight.png"];
            break;
            
        default:
            self.drawImageView.image = [UIImage imageNamed:@"FullBody.png"];
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

//Drawing methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (touch.tapCount == 1) {
        lastPoint = [touch locationInView:self.drawImageView];
    }
    else {
//        drawImageView.image = nil;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.drawImageView];
    
    UIGraphicsBeginImageContext(self.drawImageView.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f,
                                 self.drawImageView.frame.size.width,
                                 self.drawImageView.frame.size.height);
    [drawImageView.image drawInRect:drawRect];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0f);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0f, 0.0f, 0.0f, 1.0f);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    drawImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
