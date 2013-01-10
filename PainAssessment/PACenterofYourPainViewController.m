//
//  PACenterofYourPainViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PACenterofYourPainViewController.h"
#import "PAConfirmYourPainViewController.h"

@interface PACenterofYourPainViewController ()

@end

@implementation PACenterofYourPainViewController

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
    
}

- (void)showNextView
{
    PAConfirmYourPainViewController *numberListView = [[PAConfirmYourPainViewController alloc] initWithNibName:@"PAConfirmYourPainViewController" bundle:nil];
    [self.navigationController pushViewController:numberListView animated:YES];
    NSLog(@"show list here");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
