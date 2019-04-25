//
//  LSICoordinateRegion.h
//  Quake ObjC
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/Mapkit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSICoordinateRegion : NSObject

- (instancetype)initWithMinLongitude:(double)minLonigitude
                         minLatitude:(double)minLatitude
                        maxLongitude:(double)maxLongitude
                         maxLatitude:(double)maxLatitude NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithMapRect:(MKMapRect)mapRect;

@property (nonatomic) double minLongitude;
@property (nonatomic) double minLatitude;
@property (nonatomic) double maxLongitude;
@property (nonatomic) double maxLatitude;
@end

NS_ASSUME_NONNULL_END
