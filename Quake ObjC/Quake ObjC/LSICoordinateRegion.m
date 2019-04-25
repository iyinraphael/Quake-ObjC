//
//  LSICoordinateRegion.m
//  Quake ObjC
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSICoordinateRegion.h"

@implementation LSICoordinateRegion

- (instancetype)initWithMinLongitude:(double)minLonigitude
                         minLatitude:(double)minLatitude
                        maxLongitude:(double)maxLongitude
                         maxLatitude:(double)maxLatitude
{
    self = [super init];
    if (self) {
        _minLongitude = minLonigitude;
        _minLatitude = minLatitude;
        _maxLongitude = maxLongitude;
        _maxLatitude = maxLatitude;
    }
    return self;
}

- (instancetype)initWithMapRect:(MKMapRect)mapRect
{
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(mapRect);
    double minLongitude = region.center.longitude - region.span.longitudeDelta/2.0;
    double minLatitude = region.center.latitude - region.span.latitudeDelta/2.0;
    double maxLongitude = region.center.longitude + region.span.longitudeDelta/2.0;
    double maxLatitude = region.center.latitude +  region.span.latitudeDelta/2.0;
    return [self initWithMinLongitude:minLongitude minLatitude:minLatitude maxLongitude:maxLongitude maxLatitude:maxLatitude];
}

@end
