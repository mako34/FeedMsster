//
//  categ.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 15/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Entity;

@interface categ :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * categ_name;
@property (nonatomic, retain) NSSet* CategToEntity;

@end


@interface categ (CoreDataGeneratedAccessors)
//- (void)addCategToEntityObject:(Entity *)value;
- (void)addCategToEntityObject:(NSManagedObject *)value;
//- (void)removeCategToEntityObject:(Entity *)value;
- (void)removeCategToEntityObject:(NSManagedObject *)value;

- (void)addCategToEntity:(NSSet *)value;
- (void)removeCategToEntity:(NSSet *)value;

@end

