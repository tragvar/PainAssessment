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

@synthesize imageOfFullBody;
@synthesize imageOfHandRight;
@synthesize imageOfHandLeft;
@synthesize imageOfKneeRight;
@synthesize imageOfKneeLeft;
@synthesize imageOfFootRight;
@synthesize imageOfFootLeft;

@synthesize typeOfPain;
@synthesize intensityOfPain;
@synthesize depthOfPain;
@synthesize describeOfPain;


+ (PAReportOnPain *) sharedInstance
{
    static PAReportOnPain *sReport = nil;
//    static dispatch_once_t pred;
    if (sReport == nil)
        {
            sReport = [[[self class]alloc]init];
//            dispatch_once(&pred, ^{
//                sReport = [[PAReportOnPain alloc] init];
//            });
//        
        }
    return sReport;
}


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
    self.imageOfFullBody = [UIImage imageNamed:@"FullBody.png"];
    self.imageOfHandRight = [UIImage imageNamed:@"HandRight.png"];
    self.imageOfHandLeft = [UIImage imageNamed:@"HandLeft.png"];
    self.imageOfKneeRight = [UIImage imageNamed:@"KneeRight.png"];
    self.imageOfKneeLeft = [UIImage imageNamed:@"KneeLeft.png"];
    self.imageOfFootRight = [UIImage imageNamed:@"FootRight.png"];
    self.imageOfFootLeft = [UIImage imageNamed:@"FootLeft.png"];
    
    self.typeOfPain = nil;
    self.intensityOfPain = nil;
    self.depthOfPain = 0;
    self.describeOfPain = nil;
}

- (void)setImageOfFullBody:(UIImage *)image{
    imageOfFullBody = image;
}

- (void)setImageOfHandRight:(UIImage *)image{
    imageOfHandRight = image;
}

- (void)setImageOfHandLeft:(UIImage *)image{
    imageOfHandLeft = image;
}

- (void)setImageOfKneeRight:(UIImage *)image{
    imageOfKneeRight = image;
}

- (void)setImageOfKneeLeft:(UIImage *)image{
    imageOfKneeLeft = image;
}

- (void)setImageOfFootRight:(UIImage *)image{
    imageOfFootRight = image;
}

- (void)setImageOfFootLeft:(UIImage *)image{
    imageOfFootLeft = image;
}


- (void)setTypeOfPain:(NSString *)type{
    typeOfPain = type;
}

- (void)setIntensityOfPain:(UIColor *)intensity{
    intensityOfPain = intensity;
}

- (void)setDepthOfPain:(NSInteger *)depth{
    depthOfPain = depth;
}

- (void)setDescribeOfPain:(NSString *)describe{
    describeOfPain = describe;
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
