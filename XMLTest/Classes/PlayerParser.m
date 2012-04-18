//
//  PlayerParser.m
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/7/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import "PlayerParser.h"
#import "Player.h"
#import "SpreadVictims.h"
#import "GDataXMLNode.h"

@implementation PlayerParser

+(NSString *)dataFilePath:(BOOL)forSave
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
														 NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentsPath = [documentsDirectory
							   stringByAppendingPathComponent:@"Party.xml"];
    if (forSave || 
        [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) 
	{
        return documentsPath;
    } 
	else 
	{
        return [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    }
}

+(SpreadVictims *)loadSpreadVictims
{
	NSString *filePath = [self dataFilePath:FALSE];//Change to true for saved xml
	NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
	NSError *error;
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
	
	if(doc == nil)
	{
		return nil;
	}
	
	//NSLog(@"%@", doc.rootElement);

	SpreadVictims *spreadVictims = [[[SpreadVictims alloc] init] autorelease];
	NSArray *allPlayers = [doc.rootElement elementsForName:@"Player"];
	
	for(GDataXMLElement *aPlayer in allPlayers)
	{
		NSString *name;
		double lat;
		double longit;
		
		NSArray *names = [aPlayer elementsForName:@"Name"];
		if( names.count > 0 )
		{
			GDataXMLElement *firstName = (GDataXMLElement *) [names objectAtIndex:0];
			name = firstName.stringValue;
		} else continue;
		
		NSArray *lats = [aPlayer elementsForName:@"Lat"];
		if( lats.count > 0 )
		{
			GDataXMLElement *firstLat = (GDataXMLElement *) [lats objectAtIndex:0];
			lat = firstLat.stringValue.doubleValue;
		} else continue;
		
		NSArray *longits = [aPlayer elementsForName:@"Longit"];
		if( longits.count > 0 )
		{
			GDataXMLElement *firstLongit = (GDataXMLElement *) [longits objectAtIndex:0];
			longit = firstLongit.stringValue.doubleValue;
		} else continue;
		
		Player *aPlayer = [[Player alloc] initWithName:name lat:lat longit:longit];
		[spreadVictims.m_spreadVictims addObject:aPlayer];
		
	}
	
	
	
	[doc release];
	[xmlData release];
	
	return spreadVictims;
}

+ (void)saveSpreadVictims:(SpreadVictims *)victims
{
	GDataXMLElement * victimElement = [GDataXMLNode elementWithName:@"SpreadVictims"];
	
	for( Player *player in victims.m_spreadVictims)
	{
		GDataXMLElement *playerElement = [GDataXMLNode elementWithName:@"Player"];
		GDataXMLElement *nameElement = [GDataXMLNode elementWithName:@"Name" stringValue: player.m_name];
		GDataXMLElement *latElement = [GDataXMLNode elementWithName:@"Lat" stringValue:[NSString stringWithFormat:@"%d", player.m_lat]];
		GDataXMLElement *longitElement = [GDataXMLNode elementWithName:@"Longit" stringValue:[NSString stringWithFormat:@"%d", player.m_longit]];
		
		[playerElement addChild:nameElement];
		[playerElement addChild:latElement];
		[playerElement addChild:longitElement];
		
		[victimElement addChild:playerElement];
	}
	
	GDataXMLDocument *document = [[[GDataXMLDocument alloc] initWithRootElement:victimElement] autorelease];
	NSData *xmlData = document.XMLData;
	
	NSString *filePath = [self dataFilePath:TRUE];
	NSLog(@"Saving xml data to %@...", filePath);
	[xmlData writeToFile:filePath atomically:YES];
}

@end
