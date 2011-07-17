//
//  Entity.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 15/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <CoreData/CoreData.h>

@class categ;

@interface Entity :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * item;
@property (nonatomic, retain) NSSet* EntityToFeeds;
@property (nonatomic, retain) categ * EntityToCateg;

@end


@interface Entity (CoreDataGeneratedAccessors)
- (void)addEntityToFeedsObject:(NSManagedObject *)value;
- (void)removeEntityToFeedsObject:(NSManagedObject *)value;
- (void)addEntityToFeeds:(NSSet *)value;
- (void)removeEntityToFeeds:(NSSet *)value;

@end

