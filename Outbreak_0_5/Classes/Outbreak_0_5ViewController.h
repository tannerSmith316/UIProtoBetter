//
//  Outbreak_0_5ViewController.h
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/6/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cLocationManager.h"

@interface Outbreak_0_5ViewController : UIViewController {
	IBOutlet UILabel *_latLabel;
	IBOutlet UILabel *_lonLabel;
	


}

- (IBAction)UpdateLocButton:(id)sender;
- (IBAction)DisplayLocButton:(id)sender;
- (IBAction)NearbyButton:(id)sender;

@property (nonatomic, retain)IBOutlet UILabel *_latLabel;
@property (nonatomic, retain)IBOutlet UILabel *_lonLabel;

@end

