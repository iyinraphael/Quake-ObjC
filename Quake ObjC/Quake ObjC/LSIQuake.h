//
//  LSIQuake.h
//  Quake ObjC
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIQuake : NSObject

- (instancetype)initWithDIctionary: (NSDictionary *) dictionary;

@property (readonly) double magnitude;
@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *place;
@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, copy, readonly) NSString *alert;
@property (nonatomic) CLLocationCoordinate2D location;
@end

NS_ASSUME_NONNULL_END
