//
//  XMLTestAppDelegate.h
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/7/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"

@class Player;
@class SpreadVictims;
@class XMLTestViewController;

@interface XMLTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    XMLTestViewController *viewController;
	SpreadVictims *m_players;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet XMLTestViewController *viewController;
@property (nonatomic, retain) SpreadVictims *m_players;

@end

