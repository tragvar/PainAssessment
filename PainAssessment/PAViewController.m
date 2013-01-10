//
//  PAViewController.m
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PAViewController.h"
#import "PADrawYourPainViewController.h"

@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(showNextView)];
}

- (void)showNextView
{
    PADrawYourPainViewController *numberListView = [[PADrawYourPainViewController alloc] initWithNibName:@"PADrawYourPainViewController" bundle:nil];
    
    [self.navigationController pushViewController:numberListView animated:YES];
    
    
    NSLog(@"show list here");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end