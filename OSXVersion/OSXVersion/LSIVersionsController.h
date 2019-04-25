//
//  LSIVersionController.h
//  OSXVersion
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIVersionsController : NSObject

@property (class, readonly) LSIVersionsController *sharedController;

- (void)fetchVersionsWithCompletionBlock:(void (^)(NSError *error))completionBlock;
@property NSArray *versions;


@end

NS_ASSUME_NONNULL_END
