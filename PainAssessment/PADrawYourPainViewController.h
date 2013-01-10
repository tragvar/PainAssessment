//
//  PADrawYourPainViewController.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PADrawYourPainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>{
    
    UIImageView *_imageView;
    UITableView *_leftTableView;
    
    UIPickerView *_pickerView;
    NSArray *bodyPickerArray1Row;
    NSArray *bodyPickerArray2Row;
    
    CGPoint lastPoint;
}

@property (nonatomic, retain) IBOutlet UITableView *leftTableView;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIImageView *drawImageView;

@end
