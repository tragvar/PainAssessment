//
//  PADescribeYourPainViewController.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PADescribeYourPainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    NSArray *typeOFPain;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UISlider *intensitySlider;
@property (nonatomic, strong) IBOutlet UISlider *depthSlider;
@property (nonatomic, strong) IBOutlet UIView *ipView;
@property (nonatomic, strong) IBOutlet UIView *dpView;




@end
