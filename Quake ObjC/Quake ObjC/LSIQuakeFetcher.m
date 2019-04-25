//
//  LSIQuakeFetcher.m
//  Quake ObjC
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIQuakeFetcher.h"
#import "LSICoordinateRegion.h"
#import "LSIQuake.h"

static NSString *baseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";

@interface LSICoordinateRegion (QueryItems)

- (NSArray *)queryItems;

@end

@implementation LSICoordinateRegion (QueryItems)

- (NSArray *) queryItems
{
    return @[[NSURLQueryItem queryItemWithName:@"minlongitude" value:@(self.minLongitude).stringValue],
             [NSURLQueryItem queryItemWithName:@"minlatitude" value:@(self.minLatitude).stringValue],
             [NSURLQueryItem queryItemWithName:@"maxlongitude" value:@(self.maxLongitude).stringValue],
             [NSURLQueryItem queryItemWithName:@"maxlatitude" value:@(self.maxLatitude).stringValue]];
}

@end

@implementation LSIQuakeFetcher

- (void) fetchQuakesInRegion:(LSICoordinateRegion *)region completetionBlock:(LSIQuakeFetcherCompletionBlock)completionBlock
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
                             [NSURLQueryItem queryItemWithName:@"starttime" value:@"2019-02-26T07:00:00Z"],
                              [NSURLQueryItem queryItemWithName:@"endtime" value:@"2019-03-05T07:00:00Z"]] mutableCopy];
    
    if (region){
        [queryItems addObjectsFromArray:region.queryItems];
    }
    
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetchinf quakes: %@",  error);
            completionBlock(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!dictionary) {
            NSLog(@"Error decoding json: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSArray *earhtquakeDictionaries = dictionary[@"features"];
        NSMutableArray *quakes = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in earhtquakeDictionaries)
        {
            LSIQuake *quake = [[LSIQuake alloc] initWithDIctionary: dict];
            [quakes addObject:quake];
        }
        completionBlock(quakes, nil);
        
    }]resume];
}

@end
