//
//  GetPlayersViewController.m
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 1/4/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "GetPlayersViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"


 

@implementation GetPlayersViewController
@synthesize xmlTextView;
@synthesize rangeLabel;
@synthesize rangeSlider;

- (IBAction)back
{
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)getPlayersFromServer
{
	//NSURL *url = [NSURL URLWithString:@"http://outbreakjp.99k.org/getPlayers.php"];
	NSString *range = [NSString stringWithFormat:@"%.1f", [rangeSlider value]];
	NSURL *url = [NSURL URLWithString:@"http://68.118.171.136/getNearby.php"];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setPostValue:@"Tanner" forKey:@"device_id"];
	[request setPostValue:@"42.25588" forKey:@"latitude"];
	[request setPostValue:@"-121.788341" forKey:@"longitude"];
	[request setPostValue:range forKey:@"range"];
	[request setDelegate:self];
	[request startAsynchronous];
}

- (IBAction)rangeChanged:(UISlider *)sender
{
	rangeLabel.text = [NSString stringWithFormat:@"%.1fm", [sender value]];
}

- (void)requestFinished: (ASIHTTPRequest *)request
{
	if(request.responseStatusCode == 200)
	{
		xmlTextView.text = [request responseString];;
	}
}

- (void)requestFailed: (ASIHTTPRequest *)requestt
{
	NSError *error = [requestt error];
	xmlTextView.text = [error localizedDescription];
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
