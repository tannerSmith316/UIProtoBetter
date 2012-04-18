//
//  PlayerLocation.h
//  CoreLocationDemo
//
//  Created by McKenzie Kurtz on 12/9/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlayerLocation : NSObject {
	NSString *latitude;
	NSString *longitude;
}

@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;

-(id)initWithLat:(NSString *)aLatitude andLongit:(NSString *)aLongit;

@end
