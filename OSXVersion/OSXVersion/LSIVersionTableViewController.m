  //
//  LSIVersionTableViewController.m
//  OSXVersion
//
//  Created by Iyin Raphael on 3/5/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIVersionTableViewController.h"
#import "LSIOSXVersion.h"
#import "LSIVersionsController.h"

@interface LSIVersionTableViewController ()

@end

@implementation LSIVersionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[LSIVersionsController sharedController] fetchVersionsWithCompletionBlock:^(NSError *error)
      {
          if (error == nil) {
              dispatch_async(dispatch_get_main_queue(), ^{
                   [self.tableView reloadData];
              });
          }
      }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[LSIVersionsController sharedController] versions]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VersionCell" forIndexPath:indexPath];
    NSArray *versions = [[LSIVersionsController sharedController] versions];
    LSIOSXVersion *version = versions[indexPath.row];
    cell.textLabel.text = version.codename;
    cell.detailTextLabel.text = version.releaseDate;
    
    
    return cell;
}


@end
