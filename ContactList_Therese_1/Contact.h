//
//  Contact.h
//  ContactList_Therese_1
//
//  Created by therese tom on 2016-03-20.
//  Copyright © 2016 therese tom. All rights reserved.
//

#import <Foundation/Foundation.h>

//creation of contact object with respective fields for API

@interface Contact : NSObject

@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSString *lastname;
@property(strong,nonatomic) NSString *phone;
@property(strong,nonatomic) NSString *cell;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSString *dob;
@property(strong,nonatomic) NSString *image_thumbnail;
@property(strong,nonatomic) NSString *image_large;
@property(strong,nonatomic) NSString *image_medium;
@property(strong,nonatomic) NSString *street;
@property(strong,nonatomic) NSString *city;
@property(strong,nonatomic) NSString *state;
@property(strong,nonatomic) NSString *zip;

@end
