//
//  cVirusCreationViewController.m
//  Outbreak_0_9
//
//  Created by McKenzie Kurtz on 3/10/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import "cVirusCreationViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "cPlayerSingleton.h"
#import "cVirus.h"


@implementation cVirusCreationViewController

@synthesize _instantSlider;
@synthesize _zoneSlider;
@synthesize _helpTextView;
@synthesize _virusNameField;
@synthesize _typeSwitcher;
@synthesize _instantValue;
@synthesize _zoneValue;
@synthesize _virusName;
@synthesize _instantPoints;
@synthesize _zonePoints;
@synthesize _virusType;
@synthesize _createButton;

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
	
	int progressAsInt = (int)(_instantSlider.value + 0.5f);
	NSString *newText = [[NSString alloc] initWithFormat:@"%d",progressAsInt];
	_instantValue.text = newText;
	[newText release];
	
	int progressAsInt1 = (int)(_zoneSlider.value + 0.5f);
	NSString *newText2 = [[NSString alloc] initWithFormat:@"%d",progressAsInt1];
	_zoneValue.text = newText2;
	[newText2 release];
	
	self._helpTextView.editable = FALSE;
	
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


-(IBAction)instantSliderChanged:(id)sender
{
	//Update label and 
	UISlider *slider = (UISlider *)sender;
	int progressAsInt = (int)slider.value;
	NSString *newText = [[NSString alloc] initWithFormat:@"%d",progressAsInt];
	_instantValue.text = newText;
	[newText release];
	
	//change zoneSlider acrodingly
	[_zoneSlider setValue: 100 - progressAsInt];
	NSString *newText2 = [[NSString alloc] initWithFormat:@"%d",(100 - progressAsInt)];
	_zoneValue.text = newText2;
	[newText2 release];
	
}

-(IBAction)zoneSliderChanged:(id)sender
{
	//Update label and 
	UISlider *slider = (UISlider *)sender;
	int progressAsInt = (int)slider.value;
	NSString *newText = [[NSString alloc] initWithFormat:@"%d",progressAsInt];
	_zoneValue.text = newText;
	[newText release];
	
	//change instantSlider acrodingly
	[_instantSlider setValue: 100 - progressAsInt];
	NSString *newText2 = [[NSString alloc] initWithFormat:@"%d",(100 - progressAsInt)];
	_instantValue.text = newText2;
	[newText2 release];
}

- (IBAction)CreateButtonPressed {
	
	//TODO: Need to check name against list of users current viruses locally
	if ([self._virusNameField.text length] == 0)
	{
		self._helpTextView.text = [NSString stringWithString:@"Please enter a virus name"];
	}
	else
	{
		//Save all ui fields to view controller variables
		self._zonePoints =  [NSString stringWithFormat:@"%d", (int)self._zoneSlider.value];
		self._instantPoints = [NSString stringWithFormat:@"%d", (int)self._instantSlider.value];
		self._virusName = [NSString stringWithString:self._virusNameField.text];
		self._virusType = [NSString stringWithString: [self._typeSwitcher titleForSegmentAtIndex:[self._typeSwitcher selectedSegmentIndex]]];
		
		//disable button
		self._createButton.enabled = FALSE;
		
		//post call
		cPlayerSingleton *player = [cPlayerSingleton GetInstance];
		NSString *urlstring = [NSString stringWithFormat:@"%@createVirus.php",player._serverIP];
		NSURL *url = [NSURL URLWithString:urlstring];
		
		ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
		[request setPostValue:player._username forKey:@"device_id"];
		[request setPostValue:self._virusName forKey:@"virus_name"];
		[request setPostValue:self._instantPoints forKey:@"instant_points"];
		[request setPostValue:self._zonePoints forKey:@"zone_points"];
		[request setPostValue:self._virusType forKey:@"virus_type"];
		
		[request setDidFinishSelector:@selector(CreationDidFinished:)];
		[request setDidFailSelector:@selector(CreationDidFailed:)];
		
		[request setDelegate:self];
		[request startAsynchronous];
		NSLog(@"Post: Virus Creation");
	}

}

- (void)CreationDidFinished:(ASIHTTPRequest *)request {

	cPlayerSingleton *player = [cPlayerSingleton GetInstance];
	self._createButton.enabled = TRUE;
	NSString *virusMade = [NSString stringWithString:[request responseString]];
	
	//Virus was created succesfully
	if ([virusMade isEqualToString:@"TRUE"])
	{
		cVirus *newVirus = [[cVirus alloc] init];
		newVirus._virusName = self._virusName;
		newVirus._instantPoints = [NSNumber numberWithInt:[self._instantPoints intValue]];
		newVirus._zonePoints = [NSNumber numberWithInt:[self._zonePoints intValue]];
		newVirus._virusType = self._virusType;
		newVirus._owner = player._username;
		
		//Save to playersingleton array of viruses
		
		[player._viruses addObject:newVirus];
		
		[newVirus release];
		NSLog(@"Post: Virus Creation - Succesful:Added Virus to players Array");
		[self.navigationController popViewControllerAnimated:YES];
	}
	//The request account name is already in use, advise user to choose another
	else
	{
		self._helpTextView.text = [NSString stringWithString:virusMade];
	}
	
}

- (void)CreationDidFailed:(ASIHTTPRequest *)request {
	
	self._helpTextView.text = [NSString stringWithString:@"Cannot Connect to SERVER"];
	self._createButton.enabled = TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return NO;
}

- (IBAction)HelpButtonPressed:(id)sender {
	
	//Instant Help
	if ([sender tag] == 1 )
	{
		self._helpTextView.text = [NSString stringWithString:@"More instant points means farther range and higher rate for succesful infections on instant spread attempts"];
	}
	else if( [sender tag] == 2 )
	{
		self._helpTextView.text = [NSString stringWithString:@"More zone points means hotspots get laid more often and stay around longer "];
	}
	else if( [sender tag] == 3 )
	{
		self._helpTextView.text = [NSString stringWithString:@"RNA viruses are easier healed but can mutate on succesful infection\nDNA viruses dont mutate but are much harder to create vaccines from"];
	}
}

@end
