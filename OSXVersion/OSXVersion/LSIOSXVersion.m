//
//  LSIOSXVersion.m
//  OSXVersion
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIOSXVersion.h"

@implementation LSIOSXVersion

- (instancetype)initWithCodename:(NSString *)codename releaseDate:(NSString *)releaseDate
{
    self = [super self];
    if (self)
    {
        self.codename = codename;
        self.releaseDate = releaseDate;
    }
    return self;
}

@end
