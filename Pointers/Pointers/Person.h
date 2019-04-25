//
//  Person.h
//  Pointers
//
//  Created by Iyin Raphael on 3/7/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//Bridging ObjC with Swift 
@interface Person : NSObject

-(instancetype)initWithFirstName:(NSString *)firstName lastName: (nullable NSString *)lastName employer: (nullable NSString *)employer;

//Nullability Anotation
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy, nullable) NSString *lastName;
@property (nonatomic, copy, nullable) NSString *emplopyer;


@end

NS_ASSUME_NONNULL_END
