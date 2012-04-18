//
//  SpreadVictims.m
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/8/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import "SpreadVictims.h"


@implementation SpreadVictims
@synthesize m_spreadVictims;

- (id) init
{
	if(self = [super init] )
	{
		self.m_spreadVictims = [[[NSMutableArray alloc] init] autorelease];
	}
	return self;
}
- (void)dealloc
{
	[super dealloc];
	//[m_spreadVictims release];
}

@end
