//
//  cInstantSpreadViewController.h
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/20/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface cInstantSpreadViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	
	IBOutlet UITableView *_victimTable;
	NSMutableArray *_victimArray;
}

@property (nonatomic, retain)NSMutableArray *_victimArray;
@property (nonatomic, retain)IBOutlet UITableView *_victimTable;

- (IBAction)RefreshVictimList;

@end
