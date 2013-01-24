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

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@property (nonatomic, retain) IBOutlet UISlider *intensitySlider;
@property (nonatomic, retain) IBOutlet UISlider *depthSlider;




@end
