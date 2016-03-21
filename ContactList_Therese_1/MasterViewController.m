//
//  MasterViewController.m
//  ContactList_Therese_1
//
//  Created by therese tom on 2016-03-20.
//  Copyright © 2016 therese tom. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController
{
     NSMutableArray *contactObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[ContactManager alloc]init];
    contactObjects = [[NSMutableArray alloc]init];
    [self loadJsonContacts ]; //load contacts from API through Contact Manager
    [self sortNames ]; //sort the loaded contacts

    
}

//load contacts from API through Contact Manager
-(void) loadJsonContacts
{
    self.contactJsondata = self.manager.fetchJsonDataFromApi;
    contactObjects = [self.manager convertToContactObj:self.contactJsondata];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues
//Connecting to the Contact Detail Page
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.contactDetail = [[Contact alloc]init];
        controller.contactDetail = [contactObjects objectAtIndex:indexPath.row];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//Number of Rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contactObjects.count;
}

//Table Cell Details
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Contact *cont = [[Contact alloc]init];
    cont=  [contactObjects objectAtIndex:indexPath.row];
    
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", cont.name,cont.lastname ];
    cell.textLabel.text = fullname;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:cont.image_thumbnail ]]];
    return cell;
}

//Displaying the contact list in alphabetical order
-(void) sortNames{
    
    NSArray *sortedArray;
    sortedArray = [contactObjects sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(Contact*)a name];
        NSString *second = [(Contact*)b name];
        return [first compare:second];
    }];
    
    contactObjects = [NSMutableArray arrayWithArray:sortedArray];
    
}



@end
