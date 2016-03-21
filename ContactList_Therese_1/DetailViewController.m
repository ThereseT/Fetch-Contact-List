//
//  DetailViewController.m
//  ContactList_Therese_1
//
//  Created by therese tom on 2016-03-20.
//  Copyright © 2016 therese tom. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *cell;
@property (weak, nonatomic) IBOutlet UILabel *fullname;
@property (weak, nonatomic) IBOutlet UILabel *street;
@property (weak, nonatomic) IBOutlet UILabel *city_state;
@property (weak, nonatomic) IBOutlet UILabel *phone_label;
@property (weak, nonatomic) IBOutlet UILabel *cell_label;
@property (weak, nonatomic) IBOutlet UILabel *email_label;
@property (weak, nonatomic) IBOutlet UILabel *address_label;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *state;
@property (weak, nonatomic) IBOutlet UILabel *zip_code;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DetailViewController

NSString *fullname;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.contactDetail)
    {
        self.fullname.text = fullname;
        self.cell.text = self.contactDetail.cell;
        self.phone.text = self.contactDetail.phone;
        self.email.text = self.contactDetail.email;
        self.street.text = self.contactDetail.street;
        self.city_state.text = self.contactDetail.city;
        self.zip_code.text = self.contactDetail.zip;
        self.state.text = self.contactDetail.state;
        self.imageview.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.contactDetail.image_medium ]]];
       
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    fullname = [NSString stringWithFormat:@"%@ %@", self.contactDetail.name,self.contactDetail.lastname ];
    self.title = fullname;
     [self configureView]; //configuring the contact details in the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
