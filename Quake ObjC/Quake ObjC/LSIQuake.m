//
//  LSIQuake.m
//  Quake ObjC
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIQuake.h"

@implementation LSIQuake

-  (instancetype)initWithDIctionary:(NSDictionary *)dictionary
{
    self = [super self];
    if (self) {
        _identifier = dictionary[@"id"];
        _magnitude = [dictionary[@"properties"][@"mag"] doubleValue];
        _place = dictionary[@"properties"][@"place"];
        long timestamp = [dictionary[@"properties"][@"time"]
                          longValue];
        NSTimeInterval timestampInSeconds = (NSTimeInterval) timestamp / 1000.0;
        _time = [NSDate dateWithTimeIntervalSince1970:timestampInSeconds];
        _alert = dictionary[@"properties"][@"alert"];
        NSArray *coordinatesArray = dictionary[@"geometry"][@"coordinates"];
        CLLocationDegrees longitude = [coordinatesArray[0] doubleValue];
        CLLocationDegrees latitude = [coordinatesArray[1] doubleValue];
        _location = CLLocationCoordinate2DMake(latitude, longitude);
    }
    
    return self;
}

@end
