//
//  LSIVersionController.m
//  OSXVersion
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIVersionsController.h"
#import "LSIOSXVersion.h"

NSString *baseURL = @"https://osx-versions.firebaseio.com/.json";

@implementation LSIVersionsController


+ (LSIVersionsController *)sharedController 
{
    static LSIVersionsController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[LSIVersionsController alloc] init];
    });
    return sharedController;
}

- (void)fetchVersionsWithCompletionBlock:(void (^)(NSError *))completionBlock
{

    NSURL *url = [NSURL URLWithString:baseURL];
    NSURLSessionDataTask *dataTask =  [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching versions data: %@", error);
            completionBlock(error);
            return;
        }
        NSArray *versionDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (versionDictionaries == nil) {
            NSLog(@"Error decoding versions JSON: %@", error);
            completionBlock(error);
            return;
        }
        
        NSMutableArray *versions = ([[NSMutableArray alloc]init]);
        for (NSDictionary *dictionary in versionDictionaries)
        {
            LSIOSXVersion *version = [[LSIOSXVersion alloc] initWithDictionary:dictionary];
            if (version  != nil) {
                [versions addObject:version];
            }
        }
        
        self.versions = versions;
        completionBlock(nil);
    }];
    
    [dataTask resume];
}

@end
