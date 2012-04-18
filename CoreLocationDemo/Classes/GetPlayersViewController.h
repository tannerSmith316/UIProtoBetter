//
//  GetPlayersViewController.h
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 1/4/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GetPlayersViewController : UIViewController {

	IBOutlet UITextView *xmlTextView;
	IBOutlet UILabel *rangeLabel;
	IBOutlet UISlider *rangeSlider;
}
@property (nonatomic, retain) IBOutlet UITextView *xmlTextView;
@property (nonatomic, retain) IBOutlet UILabel *rangeLabel;
@property (nonatomic, retain) IBOutlet UISlider *rangeSlider;
- (IBAction)rangeChanged:(id)sender;
- (IBAction)getPlayersFromServer;
- (IBAction)back;
@end
