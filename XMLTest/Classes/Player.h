//
//  Player.h
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/7/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Player : NSObject {
	NSString *m_name;
	NSNumber *m_lat;
	NSNumber *m_longit;
	
}

@property (nonatomic, copy) NSString *m_name;
@property (nonatomic, copy) NSNumber *m_lat;
@property (nonatomic, copy) NSNumber *m_longit;

-(id)initWithName:(NSString *)name lat:(double)lat longit:(double)longit;

@end
