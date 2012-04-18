//
//  ViewTestingAppDelegate.h
//  ViewTesting
//
//  Created by McKenzie Kurtz on 10/28/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewTestingViewController;

@interface ViewTestingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ViewTestingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ViewTestingViewController *viewController;

@end

