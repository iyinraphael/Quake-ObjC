//
//  LSIVersionController.m
//  OSXVersion
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIVersionController.h"
#import "LSIOSXVersion.h"

NSString *baseURL = @"https://project/osx-versions.firebaseio.com/.json";

@implementation LSIVersionController


- (void)fetchVersionsWithCompletionBlock:(void (^)(NSError *))completionBlock
{
    
    NSURL *url = [NSURL URLWithString:baseURL];
    
    NSURLSessionDataTask *dataTask =  [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching versions data: %@", error);
            completionBlock(error);
            return;
        }
        
        
    }];
}

@end
