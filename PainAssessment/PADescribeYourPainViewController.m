//
//  PADescribeYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PADescribeYourPainViewController.h"
#import "PACenterofYourPainViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface PADescribeYourPainViewController ()

@end

@implementation PADescribeYourPainViewController

@synthesize tableView = _tableView;
@synthesize intensitySlider;
@synthesize depthSlider;
@synthesize lineColor;

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
    
    [intensitySlider setThumbImage:[UIImage imageNamed:@"grad_bip.png"] forState:UIControlStateNormal];
    UIImage *sliderLeftTrackImage1 = [[UIImage imageNamed: @"is.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    UIImage *sliderRightTrackImage1 = [[UIImage imageNamed: @"is.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    [intensitySlider setMinimumTrackImage: sliderLeftTrackImage1 forState: UIControlStateNormal];
    [intensitySlider setMaximumTrackImage: sliderRightTrackImage1 forState: UIControlStateNormal];
    
    [depthSlider setThumbImage:[UIImage imageNamed:@"grad_bip.png"] forState:UIControlStateNormal];
    UIImage *sliderLeftTrackImage2 = [[UIImage imageNamed: @"ds.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    UIImage *sliderRightTrackImage2 = [[UIImage imageNamed: @"ds.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    [depthSlider setMinimumTrackImage: sliderLeftTrackImage2 forState: UIControlStateNormal];
    [depthSlider setMaximumTrackImage: sliderRightTrackImage2 forState: UIControlStateNormal];
    
    typeOFPain = [[NSArray alloc] initWithObjects:@"Sharp", @"Numb", @"Ache", @"Burning", @"Dull",nil];

    self.tableView.layer.borderWidth = 1;
    self.tableView.layer.cornerRadius = 10;
    
    self.intensitySlider.layer.borderWidth = 1;
    self.depthSlider.layer.borderWidth = 1;
    self.intensitySlider.layer.cornerRadius = 10;
    self.depthSlider.layer.cornerRadius = 10;    
}

- (UIColor*) setLineC
{
    UIColor *color = self.lineColor;
    NSLog(@"@%@",color);

    return color;
}
- (IBAction)intensitySliderChange:(UISlider *)sender{
    self.lineColor = [UIColor colorWithRed:self.intensitySlider.value green:self.intensitySlider.value blue:self.intensitySlider.value alpha:1 ];
    NSLog(@"@%@",lineColor);
}

- (IBAction)depthSliderChange:(UISlider *)sender{
//    self.drawingView.lineWidth = sender.value * 2;
}

#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [typeOFPain count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text = [typeOFPain objectAtIndex:indexPath.row];
    }
    
//	[self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}




- (void)showNextView
{
    PACenterofYourPainViewController *numberListView = [[PACenterofYourPainViewController alloc] initWithNibName:@"PACenterofYourPainViewController" bundle:nil];
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
