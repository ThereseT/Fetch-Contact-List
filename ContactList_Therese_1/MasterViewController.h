//
//  MasterViewController.h
//  ContactList_Therese_1
//
//  Created by therese tom on 2016-03-20.
//  Copyright © 2016 therese tom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactManager.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong,nonatomic) ContactManager *manager;

@property (strong,nonatomic) NSData *contactJsondata;

-(void) loadJsonContacts;





@end

