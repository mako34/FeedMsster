//
//  ItemDataViewController.h
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 14/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import <UIKit/UIKit.h>
 

@interface ItemDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	UIActivityIndicatorView *activityIndicator;
	NSArray *items;
	
	
	
	NSString *ViewDataReceive;
 	
	IBOutlet UITextField *textName;
	IBOutlet UILabel *loadMore;
	IBOutlet UIButton *bckBtn;
	IBOutlet UILabel *pageNr;


	
 	
}
@property (nonatomic, readwrite) int RSSPage;


@property (nonatomic, retain) UITableView *tableViewRSS;


@property (retain, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (retain, nonatomic) NSArray *items;

@property (retain) NSString *ViewDataReceive; //getter n setter
@property (retain) 	IBOutlet UITextField *textName;
@property (retain) 	IBOutlet UILabel *loadMore;
@property (nonatomic, retain) IBOutlet UIButton *bckBtn;
@property (retain) 	IBOutlet UILabel *pageNr;
 



-(IBAction) cancel:(id) sender;
-(IBAction) saveFeed:(id) sender;
-(IBAction) ShowSaved:(id)sender;
-(IBAction) backBtn:(id)sender;
-(IBAction) nextBtn:(id)sender;

-(void) animate;


@end
