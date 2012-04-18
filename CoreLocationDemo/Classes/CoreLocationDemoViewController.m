//
//  CoreLocationDemoViewController.m
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CoreLocationDemoViewController.h"
#import "PlayerLocation.h"
#import "LocationDeatilViewController.h"
#import "GetPlayersViewController.h"

@implementation CoreLocationDemoViewController

@synthesize CLController;
@synthesize savedLocationsT;
@synthesize playerLocs;

- (IBAction)goGetPlayers
{
	GetPlayersViewController *vc = [[GetPlayersViewController alloc] init];
	[self presentModalViewController:vc animated:YES];
	[vc release];
}

- (IBAction)saveLocation
{
	PlayerLocation *locToSave = [[PlayerLocation alloc] initWithLat:latitudeLabel.text andLongit:longitudeLabel.text];
	
	[playerLocs addObject:locToSave];

	[self.savedLocationsT reloadData];
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [playerLocs count];
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
    cell.textLabel.text = [NSString stringWithFormat:@"Save:%d", indexPath.row];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	LocationDeatilViewController *modalDetails = [[LocationDeatilViewController alloc] init];
	modalDetails.playerLoc = [playerLocs objectAtIndex:indexPath.row];
	[self presentModalViewController:modalDetails animated:YES];
	
	[modalDetails release];
     
}
- (void)viewDidLoad {
    [super viewDidLoad];
	
	CLController = [[CoreLocationController alloc] init];
	CLController.delegate = self;
	[CLController.locMgr startUpdatingLocation];
	playerLocs = [[NSMutableArray alloc] init];

}

- (void)locationUpdate:(CLLocation *)location {
	latitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
	longitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
	
}

- (void)locationError:(NSError *)error {
	errorLabel.text = [error description];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)viewDidUnload {
}

- (void)dealloc {
	[CLController release];
    [super dealloc];
}

@end
