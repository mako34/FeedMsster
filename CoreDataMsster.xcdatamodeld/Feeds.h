//
//  Feeds.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 15/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Entity;

@interface Feeds :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * dateFeed;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) Entity * FeedsToEntity;

@end



