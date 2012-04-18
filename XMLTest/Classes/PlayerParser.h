//
//  PlayerParser.h
//  XMLTest
//
//  Created by McKenzie Kurtz on 12/7/11.
//  Copyright 2011 Oregon Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;
@class SpreadVictims;
@interface PlayerParser : NSObject {

}

//Returns an array of players
+(SpreadVictims *)loadSpreadVictims;

+ (void)saveSpreadVictims:(SpreadVictims *)victims;

@end
