//
//  ContactManager.m
//  ContactList_Therese_1
//
//  Created by therese tom on 2016-03-20.
//  Copyright © 2016 therese tom. All rights reserved.
//

#import "ContactManager.h"

#define result_count  100
#define nationality  "ca"

@implementation ContactManager
{
    Contact *contact;
}

//fetch Contact List in Json format From Api
-(NSData *) fetchJsonDataFromApi
{
    
    NSString *url = [NSString stringWithFormat: @"https://randomuser.me/api/?results=%i&nat=%s" , result_count , nationality] ;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    return response;
}

//convert JSON data to Contact Objects
-(NSMutableArray *) convertToContactObj: (NSData *) contactJsonData
{
        
    NSArray *contact_ser = [NSJSONSerialization JSONObjectWithData:contactJsonData options:0 error:nil];
    NSDictionary *resultsDict = (NSDictionary*)contact_ser;
    NSArray *results = resultsDict[@"results"];
    self.contactList = [[NSMutableArray alloc]init];

    for(int i =0 ;i< [results count] ; i++) {
        
        contact =[[Contact alloc]init];
        contact.name = [[results[i] valueForKeyPath:@"user.name.first"] capitalizedString];
        contact.lastname = [[results[i] valueForKeyPath:@"user.name.last"] capitalizedString];
        contact.email = [results[i] valueForKeyPath:@"user.email"];
        contact.phone = [results[i] valueForKeyPath:@"user.phone"];
        contact.cell = [results[i] valueForKeyPath:@"user.cell"];
        contact.dob = [results[i] valueForKeyPath:@"user.dob"];
        contact.street = [results[i] valueForKeyPath:@"user.location.street"];
        contact.city = [[results[i] valueForKeyPath:@"user.location.city"] capitalizedString];
        contact.state = [[results[i] valueForKeyPath:@"user.location.state"] capitalizedString];
        NSString *zipcode = [NSString stringWithFormat:@"%@",[results[i] valueForKeyPath:@"user.location.zip"]];
        contact.zip = zipcode;
        contact.image_large = [results[i] valueForKeyPath:@"user.picture.thumbnail"];
        contact.image_thumbnail = [results[i] valueForKeyPath:@"user.picture.thumbnail"];
         contact.image_medium = [results[i] valueForKeyPath:@"user.picture.medium"];
        [self.contactList addObject:self->contact];
    }
    return self.contactList;

    
}


@end
