//
//  XMLTestAppDelegate.m
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/7/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import "XMLTestAppDelegate.h"
#import "XMLTestViewController.h"
#import "Player.h"
#import "SpreadVictims.h"
#import "PlayerParser.h"


@implementation XMLTestAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize m_players;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	self.m_players = [PlayerParser loadSpreadVictims];
	if (m_players != nil)
	{
		[m_players.m_spreadVictims addObject:[[[Player alloc] initWithName:@"Tanner" lat:99.99999999 longit:88.89898888]autorelease]];
		for(Player *player in m_players.m_spreadVictims)
		{
			NSLog(@"%@\n", player.m_name);
			NSLog(@"%@\n", player.m_lat);
			NSLog(@"%@", player.m_longit);
		}
		
	}
    // Override point for customization after application launch.

	// Set the view controller as the window's root view controller and display.
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	[PlayerParser saveSpreadVictims:m_players];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
