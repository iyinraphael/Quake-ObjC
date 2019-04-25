//
//  LSITask.h
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSITask : NSObject

- (instancetype) initWithName: (NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *notes;
@property (nonatomic) NSDate *dueDate;

@end

NS_ASSUME_NONNULL_END
