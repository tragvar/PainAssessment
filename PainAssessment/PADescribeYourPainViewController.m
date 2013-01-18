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

@synthesize segmentedControl;
@synthesize tableView = _tableView;

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
    
    typeOFPain = [[NSArray alloc] initWithObjects:@"Sharp", @"Numb", @"Ache", @"Burning", @"Dull",nil];
    self.tableView.layer.borderWidth = 1.0;
    
    segmentedControl.transform = CGAffineTransformMakeRotation(M_PI / 2.0);
    NSArray *arr = [segmentedControl subviews];
    for (int i = 0; i < [arr count]; i++) {
        UIView *v = (UIView*) [arr objectAtIndex:i];
        NSArray *subarr = [v subviews];
        for (int j = 0; j < [subarr count]; j++) {
            if ([[subarr objectAtIndex:j] isKindOfClass:[UILabel class]]) {
                UILabel *l = (UILabel*) [subarr objectAtIndex:j];
                l.transform = CGAffineTransformMakeRotation(- M_PI / 2.0); //do the reverse of what Ben did
            }
        }
    }
    
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
