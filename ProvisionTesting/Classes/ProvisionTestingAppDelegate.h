//
//  ProvisionTestingAppDelegate.h
//  ProvisionTesting
//
//  Created by McKenzie Kurtz on 2/28/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProvisionTestingViewController;

@interface ProvisionTestingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ProvisionTestingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ProvisionTestingViewController *viewController;

@end

