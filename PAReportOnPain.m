//
//  PAReportOnPain.m
//  PainAssessment
//
//  Created by Admin on 1/31/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PAReportOnPain.h"

#define kDefaultLineColor       [UIColor blackColor]
#define kDefaultLineWidth       10.0f;
#define kDefaultLineAlpha       1.0f

@implementation PAReportOnPain

@synthesize imageOfPain;
@synthesize typeOfPain;
@synthesize intensityOfPain;
@synthesize depthOfPain;
@synthesize describeOfPain;

- (id)init
{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    self.imageOfPain = nil;
    self.typeOfPain = nil;
    self.intensityOfPain = 0;
    self.depthOfPain = 0;
    self.describeOfPain = nil;
}

//- (void)dealloc
//{
//    self.imageOfPain = nil;
//    self.typeOfPain = nil;
//    self.intensityOfPain = nil;
//    self.depthOfPain = nil;
//    self.describeOfPain = nil;
//    [super dealloc];
//}

@end
