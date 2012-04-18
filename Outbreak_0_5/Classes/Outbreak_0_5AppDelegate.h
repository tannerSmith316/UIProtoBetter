//
//  Outbreak_0_5AppDelegate.h
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/6/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Outbreak_0_5ViewController;


@interface Outbreak_0_5AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *startOutbreakNC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *startOutbreakNC;

@end

