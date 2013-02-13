//
//  PAReportOnPain.h
//  PainAssessment
//
//  Created by Admin on 1/31/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAReportOnPain : NSObject{
    
    UIImage *imageOfPain;
    NSString *typeOfPain;
    NSInteger *intensityOfPain;
    NSInteger *depthOfPain;
    NSString *describeOfPain;    
}

@property (nonatomic, retain) UIImage *imageOfPain;
@property (nonatomic, retain) NSString *typeOfPain;
@property (nonatomic, assign) NSInteger *intensityOfPain;
@property (nonatomic, assign) NSInteger *depthOfPain;
@property (nonatomic, retain) NSString *describeOfPain;

+ (PAReportOnPain *) sharedInstance;


@end
