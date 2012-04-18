//
//  LocationDeatilViewController.m
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 12/10/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import "LocationDeatilViewController.h"
#import "PlayerLocation.h"
#import "GDataXMLNode.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation LocationDeatilViewController
@synthesize playerLoc;
@synthesize latitudeLabel;
@synthesize longitLabel;
@synthesize xmlTextView;


- (IBAction)postLocationToWebServer
{
	NSString *device_id = [NSString stringWithFormat:@"Tanner"];

	//NSURL *url = [NSURL URLWithString:@"http://outbreakjp.99k.org/updateLocation.php"];
	NSURL *url = [NSURL URLWithString:@"http://75.142.137.120/updateLocation.php"];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setPostValue:device_id forKey:@"device_id"];
	[request setPostValue:playerLoc.latitude forKey:@"latitude"];
	[request setPostValue:playerLoc.longitude forKey:@"longitude"];
	[request setDelegate:self];
	[request startAsynchronous];
}

- (void)requestFinished: (ASIHTTPRequest *)request
{
	if(request.responseStatusCode == 200)
	{
		xmlTextView.text = @"Updated location succesful";
	}
}

- (void)requestFailed: (ASIHTTPRequest *)request
{
	NSError *error = [request error];
	xmlTextView.text = [error localizedDescription];
}

- (IBAction)makeAndDisplayXML
{
	GDataXMLElement * playerElement = [GDataXMLNode elementWithName:@"Player"];
	
	
	GDataXMLElement *latElement = [GDataXMLNode elementWithName:@"Lat" stringValue:playerLoc.latitude];
	GDataXMLElement *longitElement = [GDataXMLNode elementWithName:@"Longit" stringValue:playerLoc.longitude];
		
	[playerElement addChild:latElement];
	[playerElement addChild:longitElement];
	
	
	GDataXMLDocument *document = [[[GDataXMLDocument alloc] initWithRootElement:playerElement] autorelease];
	NSData *xmlData = document.XMLData;
	NSString *xmlText = [NSString stringWithUTF8String:[xmlData bytes]];
	
	xmlTextView.text = xmlText;
}

- (IBAction)backButton
{
	[self dismissModalViewControllerAnimated:YES];
}

- (id)init
{
	self = [super initWithNibName:@"LocationDeatilViewController" bundle:nil];
	
	if (self != nil)
	{
		
	}
	return self;
	
}
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	latitudeLabel.text = playerLoc.latitude;
	longitLabel.text = playerLoc.longitude;
	
	xmlTextView.editable = FALSE;
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}


@end
