//
//  RootViewController.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 9/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <UIKit/UIKit.h>


//@protocol coreDataMs //ya veremos si se necesita que sea delegado en algo!
@class categ; //ojo mira como es class del entity
@class Entity;// a final de cuentas que es que sea class!

@class ItemDataViewController;

//ojo delegatdo de fetch1!
@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate, NSFetchedResultsControllerDelegate>{ //que hace el textfield??, para si le da done que salve!
@private //para que private??
	categ *categ_; //objetos de los Entities
	
	Entity *entity_;
	
	//Entity 
	
		
	NSString *CategRef;
	
	NSString *entityName;

	NSString *MessageToViewData;

	
	UITextField *nameTextField;
	UITextField *ItemTextField;
	
	IBOutlet UIButton *saveCategBtn;
	IBOutlet UIButton *newCategBtn;
	IBOutlet UIButton *newItemBtn;
	IBOutlet UIButton *saveItemBtn;
	IBOutlet UIButton *cancelCateg;
	IBOutlet UIButton *cancelItem;



	
 	NSManagedObjectContext *context;
	NSManagedObjectContext *managedObjectContext; // para buscar item! 

	
	NSFetchedResultsController *fetchedResultsController; //para la busqueda!

	NSMutableArray *entityArray;

}

@property (assign) IBOutlet UIImageView *eyeTop;
@property (assign) IBOutlet UIImageView *eyeBottom;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController; //de la busqueda!!
 

@property(nonatomic, retain) NSString *CategRef;

@property (nonatomic, retain) NSString *entityName; //pa busqueda???


@property(nonatomic, retain) categ *categ_; //ojo crea el objeto y getters n setters
@property(nonatomic, retain) Entity *entity_; //ojo crea el objeto y getters n setters

@property(nonatomic, retain) IBOutlet UITextField *nameTextField;
@property(nonatomic, retain) IBOutlet UITextField *ItemTextField; 
@property(nonatomic, retain) IBOutlet UIButton *saveCategBtn;
@property(nonatomic, retain) IBOutlet UIButton *newCategBtn;
@property(nonatomic, retain) IBOutlet UIButton *saveItemBtn;
@property(nonatomic, retain) IBOutlet UIButton *newItemBtn;
@property(nonatomic, retain) IBOutlet UIButton *cancelCateg;
@property(nonatomic, retain) IBOutlet UIButton *cancelItem;



 

@property (nonatomic, retain) UITableView *tableViewCateg;
@property (nonatomic, retain) UITableView *tableViewItem;

@property (nonatomic, retain) NSMutableArray *CateglistArray;
@property (nonatomic, retain) NSMutableArray *ItemlistArray;


@property (nonatomic, retain) NSMutableArray *entityArray;



-(IBAction) saveCateg:(id) sender;
-(IBAction) saveItem:(id) sender;
-(IBAction) newItem:(id) sender;

-(IBAction) appearSaveCateg;
-(IBAction) appearSaveItem;
-(IBAction) cancelItemAc;
- (IBAction) cancelCategAc;


- (void)save;
-(void) fetchRecordsCateg;
-(void) fetchRecordsItem;
- (void) animation;



@end
