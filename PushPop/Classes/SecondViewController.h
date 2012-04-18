//
//  SecondViewController.h
//  PushPop
//
//  Created by McKenzie Kurtz on 10/29/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController {
	IBOutlet UILabel *textLabel;
	NSString *label;
}

@property (copy) NSString *label;

@end
