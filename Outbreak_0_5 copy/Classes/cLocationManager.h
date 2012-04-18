//
//  cLocationManager.h
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/6/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/*
@protocol CoreLocationControllerDelegate
@required

- (void)locationUpdate:(CLLocation *) location;
- (void)locationError:(NSError *)error;

@end
*/

@interface cLocationManager : NSObject <CLLocationManagerDelegate> {
	//CLLocationManager *locMgr;
	
	//View controller for passing array for table updates
	id GetNearbyCallBack;

}

@property (nonatomic, retain)id GetNearbyCallBack;

//Changes playersingleton classes latitude/longitude attributes
- (void)UpdateCoordinates;

//Retrieves all possible victims within user's virus spread range
//Data is retrieved through a post to the web server
- (void)GetNearby;

//Sends location to php server for database transactions
//Also checks for returned virus object from php
- (void)PersistLocation;
/*
@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, assign) id delegate;
*/

@end
