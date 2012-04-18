//
//  Item.h
//  FailedBanksCD
//
//  Created by McKenzie Kurtz on 3/12/12.
//  Copyright 2012 Oregon Institute of Technology. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Item :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * description;

@end



