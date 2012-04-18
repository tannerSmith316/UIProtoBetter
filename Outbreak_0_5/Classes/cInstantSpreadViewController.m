//
//  cInstantSpreadViewController.m
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/20/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "cInstantSpreadViewController.h"
#import "cLocationManager.h"
#import "cVictim.h"

@implementation cInstantSpreadViewController
@synthesize _victimArray;
@synthesize _victimTable;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)init {

	self = [super init];
	if (self)
	{
		_victimArray = [[NSMutableArray alloc] init];
	}
	return self;
}

/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) 
	{
	// Custom initialization.
		 
	}
	 return self;
 }
*/
 

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
*/
 

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */



// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_victimArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
    // Configure the cell.
	cVictim *theVictim = [[cVictim alloc] initWithVictim:[_victimArray objectAtIndex:indexPath.row]];
	NSString *str = [NSString stringWithFormat:@"%@ \t %@", theVictim._name, theVictim._distance];
    cell.textLabel.text = str;

	
    return cell;
}



//Victim has been chosen for infection attempt
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//run virus defenses
	BOOL infectionSucces = [self RunVictimDefenses];
	//POST Infect to web server if success
	if (infectionSucces)
	{
		
	}
}

- (BOOL)RunVictimDefenses {

	return YES;
}
 

- (IBAction)RefreshVictimList {
	
	cLocationManager *locMgr = [[cLocationManager alloc] init];
	
	//Allows for callback for updating the UITableView
	locMgr.GetNearbyCallBack = self;
	
	//Will collect data and call cInstantSpread UpdateVictimTable with
	//new victim array
	[locMgr GetNearby];
}

- (void)UpdateVictimTable:(NSArray *)victimArray {
	
	//Insert Victims into table view
	[self._victimArray setArray:victimArray];
	[_victimTable reloadData];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
}


- (void)dealloc {
	[_victimArray release];
	[_victimTable release];
    [super dealloc];
	
}

@end
