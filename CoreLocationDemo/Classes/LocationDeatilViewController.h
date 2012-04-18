//
//  LocationDeatilViewController.h
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 12/10/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlayerLocation;

@interface LocationDeatilViewController : UIViewController {
	PlayerLocation *playerLoc;
	IBOutlet UILabel *latitudeLabel;
	IBOutlet UILabel *longitLabel;
	IBOutlet UITextView *xmlTextView;
}

@property (nonatomic, retain) IBOutlet UITextView *xmlTextView;
@property (nonatomic, retain) PlayerLocation *playerLoc;
@property (nonatomic, retain) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, retain) IBOutlet UILabel *longitLabel;

- (IBAction)getPlayersFromServer;
- (IBAction)postLocationToWebServer;
- (IBAction)makeAndDisplayXML;
- (IBAction)backButton;

@end
