//
//  OfflineViewControllerAppDelegate.h
//  OfflineViewController
//
//  Created by McKenzie Kurtz on 10/29/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfflineViewControllerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *offlineTBC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

