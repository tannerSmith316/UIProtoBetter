//
//  cVirus.h
//  Outbreak_0_5
//
//  Created by McKenzie Kurtz on 2/19/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface cVirus : NSObject {
	
	NSString *_virusName;
	NSString *_uniqueIDNumber;
}

@property (nonatomic, retain)NSString *_uniqueIDNumber;
@property (nonatomic, retain)NSString *_virusName;

@end
