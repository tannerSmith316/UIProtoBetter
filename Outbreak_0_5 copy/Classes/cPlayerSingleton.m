//
//  cPlayerSingleton.m
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/19/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "cPlayerSingleton.h"

static cPlayerSingleton *_player = nil;

@implementation cPlayerSingleton
@synthesize _infectedWith;
@synthesize _name;
@synthesize _currentVirus;
@synthesize _latitude;
@synthesize _longitude;
@synthesize _serverIP;
@synthesize _updateLocationTimer;

+ (cPlayerSingleton *)GetInstance {
	@synchronized(self) {
		if (_player == nil)
		{
			_player = [[super allocWithZone:NULL] init];
		}
	}
	return _player;
}

- (id)init {
	
	if (self = [super init])
	{
		self._serverIP = [NSString stringWithFormat:@"http://192.168.10.200/"];
		_updateLocationTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(locationTimerFired:) userInfo:nil repeats:YES];
	}
	return self;
}


- (void)locationTimerFired:(NSTimer *)theTimer {
	NSLog(@"10seconds right?");
}

+ (id)allocWithZone:(NSZone *)zone {
	return [[self GetInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}

- (id)retain
{
	return self;
}

- (unsigned)retainCount {

	return UINT_MAX;
}

- (void)release {

	//do nothing
}

- (id)autorelease {
	
	return self;
}


- (void)dealloc {
	[_name release];
	[super dealloc];
}

@end
