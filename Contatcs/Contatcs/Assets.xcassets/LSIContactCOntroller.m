//
//  LSIContactCOntroller.m
//  Contatcs
//
//  Created by Iyin Raphael on 3/10/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIContactCOntroller.h"

//Allows Objective-C recognize switf class
#import "Contatcs-Swift.h"


@implementation LSIContactCOntroller

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contacts = @[
                    [[Contact alloc] initWithName: @"Iyin" relationship: @"Myself"],
                    [[Contact alloc] initWithName:@"Liz" relationship:@"Wife"],
                    [[Contact alloc] initWithName:@"Demi" relationship:@"Daughter"]];
    }
    return self;
}

@end
