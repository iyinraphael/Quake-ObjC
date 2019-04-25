//
//  LSITask.m
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSITask.h"

@implementation LSITask

- (instancetype)initWithName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate
{
    self = [super self];
    if (self) {
        _name = name;
        _notes = notes;
        _dueDate = dueDate;
    }
    
    return self;
}

@end
