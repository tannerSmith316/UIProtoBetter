//
//  iLocationManager.h
//  Interfacing
//
//  Created by McKenzie Kurtz on 2/7/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol iLocationManager
@required

- (BOOL)updateLocation;
- (BOOL)postToWebServer;

@end

