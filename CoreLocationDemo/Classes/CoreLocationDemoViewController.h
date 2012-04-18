//
//  CoreLocationDemoViewController.h
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 11/1/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocationController.h"


@interface CoreLocationDemoViewController : UIViewController <CoreLocationControllerDelegate> 
{
	CoreLocationController *CLController;
	NSMutableArray *playerLocs;
	IBOutlet UILabel *latitudeLabel;
	IBOutlet UILabel *longitudeLabel;
	IBOutlet UILabel *errorLabel;

	IBOutlet UITableView *savedLocationsT;
}

@property (nonatomic, retain) NSMutableArray *playerLocs;
@property (nonatomic, retain) CoreLocationController *CLController;
@property (nonatomic, retain) IBOutlet UITableView *savedLocationsT;

- (IBAction)goGetPlayers;
- (IBAction)saveLocation;

@end

