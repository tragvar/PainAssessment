//
//  PADrawView.m
//  PainAssessment
//
//  Created by Admin on 2/1/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import "PADrawView.h"

@implementation PADrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//Линия
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 2.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 0.0f, 0.0f);
//    CGContextAddLineToPoint(context, 300.0f, 400.0f);
//    CGContextStrokePath(context);
//}

//Ромб
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 100.0f, 100.0f);
//    CGContextAddLineToPoint(context, 150.0f, 150.0f);
//    CGContextAddLineToPoint(context, 100.0f, 200.0f);
//    CGContextAddLineToPoint(context, 50.0f, 150.0f);
//    CGContextAddLineToPoint(context, 100.0f, 100.0f);
//    CGContextStrokePath(context);
//}

//Квадрат
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGRect rectangle = CGRectMake(60.0f, 170.0f, 200.0f ,80.0f);
//    CGContextAddRect(context, rectangle);
//    CGContextStrokePath(context);
//}

//Круг
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGRect rectangle = CGRectMake(60.0f, 170.0f, 200.0f, 80.0f);
//    CGContextAddEllipseInRect(context, rectangle);
//    CGContextStrokePath(context);
//}

//Квадрат с заливкой
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextMoveToPoint(context, 100.0f, 100.0f);
//    CGContextAddLineToPoint(context, 150.0f, 150.0f);
//    CGContextAddLineToPoint(context, 100.0f, 200.0f);
//    CGContextAddLineToPoint(context, 50.0f, 150.0f);
//    CGContextAddLineToPoint(context, 100.0f, 100.0f);
//    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextFillPath(context);
//}

//Квадрат с заливкой и градиентом
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGRect rectangle = CGRectMake(60.0f, 170.0f, 200.0f, 80.0f);
//    CGContextAddRect(context, rectangle);
//    CGContextStrokePath(context);
//    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextFillRect(context, rectangle);
//}

//Рисование дуги
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 100.0f, 100.0f);
//    CGContextAddArcToPoint(context, 100.0f, 200.0f, 300.0f ,200.0f, 100.0f);
//    CGContextStrokePath(context);
//}

//Рисование кубической кривой Безье
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 10.0f, 10.0f);
//    CGContextAddCurveToPoint(context, 0.0f, 50.0f, 300.0f, 250.0f, 300.0f, 400.0f);
//    CGContextStrokePath(context);
//}

//Рисование квадратной кривой Безье
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 4.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 10.0f, 200.0f);
//    CGContextAddQuadCurveToPoint(context, 150.0f, 10.0f, 300.0f, 200.0f);
//    CGContextStrokePath(context);
//}

//Пунктирная линия
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 20.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGFloat dashArray[] = {2.0f ,6.0f ,4.0f, 2.0f};
//    CGContextSetLineDash(context, 3.0f, dashArray, 4.0f);
//    CGContextMoveToPoint(context, 10.0f, 200.0f);
//    CGContextAddQuadCurveToPoint(context, 150.0f, 10.0f, 300.0f, 200.0f);
//    CGContextStrokePath(context);
//}

//- (void)drawRect:(CGRect)rect {
//    UIImage *myImage = [UIImage imageNamed:@"pets.jpg"];
//    CGPoint imagePoint = CGPointMake(0, 0);
//    [myImage drawAtPoint:imagePoint];
//}

//- (void)drawRect:(CGRect)rect {
//    UIImage *myImage = [UIImage imageNamed:@"pets.jpg"];
//    CGRect imageRect =[[UIScreen mainScreen] bounds];
//    [myImage drawInRect:imageRect];
//}

- (void)drawRect:(CGRect)rect
{
    UIImage *myimage = [UIImage imageNamed:@"pets.jpg"];
    CIImage *cimage = [[CIImage alloc] initWithImage:myimage];
    
    CIFilter *sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];
    [sepiaFilter setDefaults];
    [sepiaFilter setValue:cimage forKey:@"inputImage"];
    [sepiaFilter setValue:[NSNumber numberWithFloat:0.8f] forKey:@"inputIntensity"];
    
    CIImage *image = [sepiaFilter outputImage];
    CIContext *context = [CIContext contextWithOptions: nil];
    CGImageRef cgImage = [context createCGImage:image fromRect:image.extent];
    UIImage *resultUIImage = [UIImage imageWithCGImage:cgImage];
    
    CGRect imageRect =[[UIScreen mainScreen] bounds];
    [resultUIImage drawInRect:imageRect];
}

@end

