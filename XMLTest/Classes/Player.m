//
//  Player.m
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/7/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import "Player.h"


@implementation Player
@synthesize m_name;
@synthesize m_lat;
@synthesize m_longit;

-(id)initWithName:(NSString *)name lat:(double)lat longit:(double)longit
{
	if(self == [super init])
	{
		self.m_name = name;
		self.m_lat = [[NSNumber alloc] initWithDouble:lat];
		self.m_longit = [[NSNumber alloc] initWithDouble:longit];
	}
	return self;
	
}

-(void) dealloc
{
	self.m_name = nil;
	[super dealloc];
}

@end
