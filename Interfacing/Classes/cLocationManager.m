//
//  cLocationManager.m
//  Interfacing
//
//  Created by McKenzie Kurtz on 2/7/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "cLocationManager.h"


@implementation cLocationManager

- (BOOL)updateLocation
{
	NSLog(@"Your current location has been aquired");
	return TRUE;
}

- (BOOL)postToWebServer
{
	NSLog(@"Posting Location to Web Server");
	return TRUE;
}


@end
