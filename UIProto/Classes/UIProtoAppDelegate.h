//
//  UIProtoAppDelegate.h
//  UIProto
//
//  Created by McKenzie Kurtz on 10/27/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIProtoViewController;

@interface UIProtoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIProtoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIProtoViewController *viewController;

@end

