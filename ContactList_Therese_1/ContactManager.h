//
//  ContactManager.h
//  ContactList_Therese_1
//
//  Created by therese tom on 2016-03-20.
//  Copyright © 2016 therese tom. All rights reserved.
//

#import "Contact.h"
#import <Foundation/Foundation.h>

@interface ContactManager : NSObject


@property(strong,nonatomic) NSMutableArray  *contactList;
@property (strong,nonatomic) NSDictionary *contact_json;
-(NSMutableArray *) convertToContactObj: (NSData *) contactJsonData;
-(NSData *) fetchJsonDataFromApi;


@end
