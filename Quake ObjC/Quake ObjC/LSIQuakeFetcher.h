//
//  LSIQuakeFetcher.h
//  Quake ObjC
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSICoordinateRegion.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIQuakeFetcher : NSObject

typedef void (^LSIQuakeFetcherCompletionBlock)(NSArray *, NSError *);

- (void) fetchQuakesInRegion:(LSICoordinateRegion *)region completetionBlock: (LSIQuakeFetcherCompletionBlock)completionBlock;


@end

NS_ASSUME_NONNULL_END
