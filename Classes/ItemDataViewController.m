    //
//  ItemDataViewController.m
//  CoreDataMsster
//
//  Created by Manuel Betancurt on 14/07/11.
//  Copyright 2011 HYPER. All rights reserved.
//

#import "ItemDataViewController.h"
#import "svdFeeds.h"
#import "Parser.h"
#import "RSSdetail.h"
#import "CustomHeader.h"
#import "CustomCellBackground.h"

#import <QuartzCore/QuartzCore.h>


@interface ItemDataViewController (PrivateMethods)
- (void)loadData;
@end 


@implementation ItemDataViewController

@synthesize ViewDataReceive;
@synthesize textName;
@synthesize activityIndicator, items;
@synthesize tableViewRSS;
@synthesize loadMore;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"arrive: %@", ViewDataReceive);
	//NameLbl.text = ViewDataReceive;
	textName.text = ViewDataReceive;
 	
	/*
	UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	indicator.hidesWhenStopped = YES;
	[indicator stopAnimating];
	self.activityIndicator = indicator;
	[indicator release];
	
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:indicator];
	self.navigationItem.rightBarButtonItem = rightButton;
	[rightButton release];
 */
	
	tableViewRSS = [[UITableView alloc] initWithFrame:CGRectMake(51, 182, 438, 293)
					  //					  
												  style:UITableViewStylePlain];
	
    tableViewRSS.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	
    tableViewRSS.delegate = self;
	
    tableViewRSS.dataSource = self;
	
    //[tableView reloadData];
	
	
 	
    [self.view addSubview: tableViewRSS];
	
	[tableViewRSS release];
	
	[self animate];
	
	
	 }


- (void)viewDidAppear:(BOOL)animated {
	[self loadData];
    [super viewDidAppear:animated];
}

- (void)loadData {
	if (items == nil) {
		[activityIndicator startAnimating];
		
		Parser *rssParser = [[Parser alloc] init];
		[rssParser parseRssFeed:@"http://feeds2.feedburner.com/TheMdnShow" withDelegate:self];
		
		//[rssParser parseRssFeed:@"http://feeds.feedburner.com/hyperprogram/ngmM" withDelegate:self];
		
		[rssParser release];
		
	} else {
		[tableViewRSS reloadData];
 	}
	

}

- (void)receivedItems:(NSArray *)theItems {
	items = theItems;
	[tableViewRSS reloadData];
	[activityIndicator stopAnimating];
	NSLog(@"cuenta de mirra: %d", [items count]);

}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [items count];
	
	
	//for pagination!
	if([items count]>= 20)
	{
		return [items count]+1;
	}
	else
	{
		return [items count];
		
	}
	
	//return 10;

}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
    static NSString *CellIdentifier = @"Cell";
    
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		cell.backgroundView = [[[CustomCellBackground alloc] init] autorelease];
        cell.selectedBackgroundView = [[[CustomCellBackground alloc] init] autorelease];
        ((CustomCellBackground *)cell.selectedBackgroundView).selected = YES;
	}
    
	// Configure the cell.
	/*
	if( indexPath.row >= 9 ) {
        cell.textLabel.text = @"Show More...";
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.detailTextLabel.text = @"touch cell";

     }*/
	/*
	if( indexPath.row <= 8 ) {
	*/
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] objectForKey:@"title"];
	
	// Format date
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];	
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
	cell.detailTextLabel.text = [dateFormatter stringFromDate:[[items objectAtIndex:indexPath.row] objectForKey:@"date"]];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	//}
	
    return cell;
		

 	
	
}




// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary *theItem = [items objectAtIndex:indexPath.row];
	//RSSdetail *nextController = [[RSSdetail alloc] initWithItem:theItem];
	//[self.navigationController pushViewController:nextController animated:YES];
	//[nextController release];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	  
	RSSdetail *viewControllerData = [[RSSdetail alloc] initWithNibName:nil bundle:nil];
	
	//	viewControllerData.ViewDataReceive = MessageToViewData; //send the message to the viewController
	viewControllerData.item = theItem; //send the message to the viewController
	
	
	viewControllerData.modalPresentationStyle = UIModalPresentationFormSheet;
	[self presentModalViewController:viewControllerData animated:YES];
	
	/*
	
	if (indexPath.row < 9) {
		
		//load the view in a modal window sliding up!
		RSSdetail *viewControllerData = [[RSSdetail alloc] initWithNibName:nil bundle:nil];
		
		//	viewControllerData.ViewDataReceive = MessageToViewData; //send the message to the viewController
		viewControllerData.item = theItem; //send the message to the viewController
		
		
		viewControllerData.modalPresentationStyle = UIModalPresentationFormSheet;
		[self presentModalViewController:viewControllerData animated:YES];
		
	}
	
	if(indexPath.row == 9)
	{
		NSLog(@"undio");
		[tableViewRSS reloadData];

	}
	*/
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	/*
	if (tableView == tableViewCateg) {
		return @"Categories";
		
	}
	
	if (tableView == tableViewItem) {
		return @"Items";	
	}*/
	return @" RSS FEEDS ";
}


-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeader *header = [[[CustomHeader alloc] init] autorelease];        
    header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    if (section == 1) {
        header.lightColor = [UIColor colorWithRed:147.0/255.0 green:105.0/255.0 blue:216.0/255.0 alpha:1.0];
        header.darkColor = [UIColor colorWithRed:72.0/255.0 green:22.0/255.0 blue:137.0/255.0 alpha:1.0];
    }
    return header;
}

-(IBAction) saveFeed:(id) sender{
	NSLog(@"sasasa");	
}


-(IBAction) cancel:(id) sender {
	[self dismissModalViewControllerAnimated:YES];
	
}

-(IBAction) ShowSaved:(id)sender {
	NSLog(@"muestre pues");
	
	svdFeeds *viewControllerData = [[svdFeeds alloc] initWithNibName:nil bundle:nil];
	
 	//viewControllerData.item = theItem; //send the message to the viewController
	
	
	viewControllerData.modalPresentationStyle = UIModalPresentationFormSheet;
	[self presentModalViewController:viewControllerData animated:YES];
}

-(void) animate{
	UIImage *cloudImage = [UIImage imageNamed:@"owl.png"];
	
	CALayer *cloud = [CALayer layer];
	cloud.contents = (id)cloudImage.CGImage;
	cloud.bounds = CGRectMake(0, 0, cloudImage.size.width, cloudImage.size.height);
	cloud.position = CGPointMake(self.view.bounds.size.width / 2,
								 cloudImage.size.height / 2);
	[self.view.layer addSublayer:cloud];
	
	CGPoint startPt = CGPointMake(self.view.bounds.size.width + cloud.bounds.size.width / 2,
								  cloud.position.y);
	CGPoint endPt = CGPointMake(cloud.bounds.size.width / -2,
								cloud.position.y);
	
	CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
	anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	anim.fromValue = [NSValue valueWithCGPoint:startPt];
	anim.toValue = [NSValue valueWithCGPoint:endPt];
	anim.repeatCount = HUGE_VALF;
	anim.duration = 8.0;
	[cloud addAnimation:anim forKey:@"position"];
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
