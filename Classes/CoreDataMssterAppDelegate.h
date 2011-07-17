//
//  CoreDataMssterAppDelegate.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 9/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "RootViewController.h"

@interface CoreDataMssterAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
	RootViewController *viewController;
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet 	RootViewController *viewController;


@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;



- (NSURL *)applicationDocumentsDirectory;

@end

