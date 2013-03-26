//
//  PAReportOnPain.h
//  PainAssessment
//
//  Created by Admin on 1/31/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAReportOnPain : NSObject{
    
    NSString *typeOfPain;
    UIColor *intensityOfPain;
    NSInteger *depthOfPain;
    NSString *describeOfPain;    
}

@property (nonatomic, retain) UIImage *imageOfFullBody;
@property (nonatomic, retain) UIImage *imageOfHandRight;
@property (nonatomic, retain) UIImage *imageOfHandLeft;
@property (nonatomic, retain) UIImage *imageOfKneeRight;
@property (nonatomic, retain) UIImage *imageOfKneeLeft;
@property (nonatomic, retain) UIImage *imageOfFootRight;
@property (nonatomic, retain) UIImage *imageOfFootLeft;

@property (nonatomic, retain) NSString *typeOfPain;
@property (nonatomic, retain) UIColor *intensityOfPain;
@property (nonatomic, assign) NSInteger *depthOfPain;
@property (nonatomic, retain) NSString *describeOfPain;
@property (nonatomic, readwrite) NSInteger *pickerPosition;

+ (PAReportOnPain *) sharedInstance;


@end
