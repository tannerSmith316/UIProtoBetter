//
//  cLocationManager.m
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/6/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "cLocationManager.h"
#import "cPlayerSingleton.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "cVictim.h"
#import "JSONKit.h"

@implementation cLocationManager
@synthesize GetNearbyCallBack;


- (id)init {
	self = [super init];
	
	return self;
}

//Gets triggered by update timer
- (void)UpdateCoordinates {

	cPlayerSingleton *player = [cPlayerSingleton GetInstance];
	//start core location updater
	//-->on CLupdaters Success = save coordinates, call PersistLocation
	//OR
	//-->on CLupdaters Failure = Alert user and disable infection screen

}

- (void)PersistLocation {
	
	cPlayerSingleton *player = [cPlayerSingleton GetInstance];
	player._name = [NSString stringWithFormat:@"kyle"];
	NSString *urlappended = [NSString stringWithFormat:@"%@updateLocation.php", player._serverIP];
	NSURL *url = [NSURL URLWithString:@"http://192.168.10.200/updateLocation.php"];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setDidFinishSelector:@selector(PersistLocationFinished:)];
	[request setPostValue:player._name forKey:@"device_id"];
	[request setPostValue:player._latitude forKey:@"latitude"];
	[request setPostValue:player._longitude forKey:@"longitude"];
	[request setDelegate:self];
	[request startAsynchronous];
	
}


- (void)GetNearby {
	//STUBBED  *****************************************************
	//takes virus range via instant spread
	
	//[self GetNearbyFinished];
	NSNumber *range = [NSNumber numberWithInt:99999999];
	//sends to php
	cPlayerSingleton *player = [cPlayerSingleton GetInstance];
	NSString *urlappended = [NSString stringWithFormat:@"%@getNearby.php", player._serverIP];
	NSURL *url = [NSURL URLWithString:urlappended];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setDidFinishSelector:@selector(GetNearbyFinished:)];
	[request setPostValue:player._name forKey:@"device_id"];
	[request setPostValue:player._latitude forKey:@"latitude"];
	[request setPostValue:player._longitude forKey:@"longitude"];
	[request setPostValue:range forKey:@"range"];
	[request setDelegate:self];
	[request startAsynchronous];
	//recieve json
	//return array of playes
	 

	
}

- (void)PersistLocationFinished: (ASIHTTPRequest *)request
{
	//Request will hold data of a virus the user is infected with
	NSString *response = [NSString stringWithString:[request responseString]];
	if ( [response isEqualToString:@"[]"] )
	{
		//Do Nothing
	}
	else
	{
		//STUBBED - GET JSON PARSER****************************************************
		cVirus *infectee = [[cVirus alloc] init];
		infectee._virusName = [NSString stringWithFormat:@"Kyle's Flu"];
		cPlayerSingleton *player = [cPlayerSingleton GetInstance];
		player._infectedWith = infectee;
	}

	
}

- (void)requestFailed: (ASIHTTPRequest *)request
{
	//NSError *error = [request error];	
}

/*
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self.delegate locationUpdate:newLocation];
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self.delegate locationError:error];
	}
}
*/

- (void)GetNearbyFinished:(ASIHTTPRequest *)request
{
	
							
	
	NSString *jsonString = [NSString stringWithString:[request responseString]];
	//Parse the json
	NSDictionary *deserializedData = [[NSDictionary alloc] init];
	deserializedData = [jsonString objectFromJSONString];
	
	//Make array
	NSMutableArray *victims = [[NSMutableArray alloc] init];
	//Retrieve information from the deserialized json string
	for (NSDictionary * dataDict in deserializedData) {
		NSString * victimName = [dataDict objectForKey:@"device_id"];
		NSString * victimDistance = [dataDict objectForKey:@"distance"];
		
		cVictim *aVictim = [[cVictim alloc] init];
		aVictim._name = victimName;
		aVictim._distance = victimDistance;
		[victims addObject:aVictim];
		
		[aVictim release];
	}

	//Post Array to viewcontroller delegate for table update
	[GetNearbyCallBack UpdateVictimTable:victims];
	
	[victims release];
}


- (void)dealloc {
	
	[super dealloc];
}

@end
