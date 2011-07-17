//
//  RSSdetail.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 15/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entity;
@class Feeds;

@interface RSSdetail : UIViewController {

	Entity *entity_;
	
	NSDictionary *item;
	
	IBOutlet UILabel *titleLbl;
	IBOutlet UILabel *SummaryLbl;
	IBOutlet UILabel *linkLbl;
	IBOutlet UILabel *dateLbl;

 	NSManagedObjectContext *context;
	NSManagedObjectContext *managedObjectContext; // para buscar item! 


}

@property(nonatomic, retain) 	Entity *entity_;
 //ojo crea el objeto y getters n setters

@property (retain, nonatomic) NSDictionary *item;

@property (retain, nonatomic) IBOutlet UILabel *titleLbl;
@property (retain, nonatomic) IBOutlet UILabel *SummaryLbl;
@property (retain, nonatomic) IBOutlet UILabel *linkLbl;
@property (retain, nonatomic) IBOutlet UILabel *dateLbl;


- (id)initWithItem:(NSDictionary *)theItem;

-(IBAction) Back:(id) sender;
-(IBAction) SaveFeed:(id) sender;


-(void) PopulateLbls;


@end
