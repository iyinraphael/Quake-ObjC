//
//  LSIOSXVersion.h
//  OSXVersion
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIOSXVersion : NSObject

@property NSString *codename;
@property NSString *releaseDate;

- (instancetype) initWithCodename: (NSString *)codename releaseDate: (NSString *)releaseDate;


@end

NS_ASSUME_NONNULL_END
