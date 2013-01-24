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
    
//    [intensitySlider setThumbImage:[UIImage imageNamed:@"tumb.png"] forState:UIControlStateNormal];
    UIImage *sliderLeftTrackImage1 = [[UIImage imageNamed: @"intensitySlider.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    UIImage *sliderRightTrackImage1 = [[UIImage imageNamed: @"intensitySlider.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    [intensitySlider setMinimumTrackImage: sliderLeftTrackImage1 forState: UIControlStateNormal];
    [intensitySlider setMaximumTrackImage: sliderRightTrackImage1 forState: UIControlStateNormal];
    
    UIImage *sliderLeftTrackImage2 = [[UIImage imageNamed: @"depthSlider.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    UIImage *sliderRightTrackImage2 = [[UIImage imageNamed: @"depthSlider.png"] stretchableImageWithLeftCapWidth: 9 topCapHeight: 0];
    [depthSlider setMinimumTrackImage: sliderLeftTrackImage2 forState: UIControlStateNormal];
    [depthSlider setMaximumTrackImage: sliderRightTrackImage2 forState: UIControlStateNormal];
    
    typeOFPain = [[NSArray alloc] initWithObjects:@"Sharp", @"Numb", @"Ache", @"Burning", @"Dull",nil];
    self.tableView.layer.borderWidth = 2.0;
    self.intensitySlider.layer.borderWidth = 2.0;
    self.depthSlider.layer.borderWidth = 2.0;
        
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
