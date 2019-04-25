//
//  LSIContactCOntroller.h
//  Contatcs
//
//  Created by Iyin Raphael on 3/10/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;

NS_SWIFT_NAME(ContactController)
@interface LSIContactCOntroller : NSObject

//Ligthweight generics
@property (nonatomic, readonly, nonnull) NSArray<Contact *> *contacts;

@end 


