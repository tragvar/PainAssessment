//
//  PAAppDelegate.h
//  PainAssessment
//
//  Created by Admin on 1/9/13.
//  Copyright (c) 2013 Tragvar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PAViewController;

@interface PAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PAViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;


@end
