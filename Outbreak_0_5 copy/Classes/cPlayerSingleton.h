//
//  cPlayerSingleton.h
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/19/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cVirus.h"

@interface cPlayerSingleton : NSObject {
	
	//This may be a virus that the user has contracted
	cVirus *_infectedWith;
	
	//Players game name
	NSString *_name;
	
	//This is the virus the player is currently playing with
	cVirus *_currentVirus;
	
	//These variables hold the players GPS coordinates
	NSString *_latitude;
	NSString *_longitude;
	
	//this variable holds the server ip adress
	NSString *_serverIP;
	
	NSTimer *_updateLocationTimer;
}

@property (nonatomic, retain)cVirus *_infectedWith;
@property (nonatomic, retain)NSString *_name;
@property (nonatomic, retain)cVirus *_currentVirus;
@property (nonatomic, retain)NSString *_latitude;
@property (nonatomic, retain)NSString *_longitude;
@property (nonatomic, retain)NSString *_serverIP;
@property (nonatomic, retain)NSTimer *_updateLocationTimer;

//Public accesor for singleton class
+ (cPlayerSingleton *)GetInstance;



@end
