//
//  PlayerLocation.m
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 12/9/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import "PlayerLocation.h"


@implementation PlayerLocation
@synthesize latitude;
@synthesize longitude;

- (id)initWithLat:(NSString *)aLatitude andLongit:(NSString *)aLongit
{
	[super init];
	latitude = [[NSString alloc] init];
	longitude = [[NSString alloc] init];;
	self.latitude = aLatitude;
	self.longitude = aLongit;
	
	return self;
	
}

- (void)dealloc
{
	[super dealloc];
	[latitude release];
	[longitude release];
}
@end
