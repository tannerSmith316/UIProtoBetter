//
//  cLocationManagerTest.m
//  Interfacing
//
//  Created by McKenzie Kurtz on 2/7/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "cLocationManager.h"
@interface cLocationManagerTests : SenTestCase {
	cLocationManager *locMgr;
}
@end



@implementation cLocationManagerTests

- (void)setUp {
	locMgr = [[cLocationManager alloc] init];
}

- (void)tearDown {
	[locMgr release];
}

- (void)testUpdateLocation {
	STAssertTrue([locMgr updateLocation], @"Location updated"); 
}

- (void)testPostToWebServer {
	STAssertTrue(![locMgr postToWebServer], @"Posted to webserver");
}


		

@end
