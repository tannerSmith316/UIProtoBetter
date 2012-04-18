//
//  InterfacingAppDelegate.h
//  Interfacing
//
//  Created by McKenzie Kurtz on 2/6/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InterfacingViewController;

@interface InterfacingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    InterfacingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet InterfacingViewController *viewController;

@end

