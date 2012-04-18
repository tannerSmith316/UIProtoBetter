//
//  Outbreak_0_5ViewController.m
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/6/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "Outbreak_0_5ViewController.h"
#import "cPlayerSingleton.h"
//#import "cInstantSpreadViewController.h"

@implementation Outbreak_0_5ViewController
@synthesize _lonLabel;
@synthesize _latLabel;

- (id)init {

	self = [super init];
	if (self)
	{
		
	}
	return self;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
/*
- (IBAction)DisplayLocButton:(id)sender
{
	cPlayerSingleton *_player = [cPlayerSingleton GetInstance];
	_latLabel.text = _player._latitude;
	_lonLabel.text = _player._longitude;
}
 */

- (IBAction)UpdateLocButton:(id)sender {
	cLocationManager *locMgr = [[cLocationManager alloc] init];
	[locMgr PersistLocation];
	[locMgr release];
}

- (IBAction)NearbyButton:(id)sender {

	//cInstantSpreadViewController *vc = [[cInstantSpreadViewController alloc] init];
	//vc.title = @"Infection Spread";
	//[self.navigationController pushViewController:vc animated:YES];
	//[vc release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[_lonLabel release];
	[_latLabel release];
    [super dealloc];
}

@end
