//
//  ViewController.m
//  Pointers
//
//  Created by Iyin Raphael on 3/7/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    char *ptr = malloc(17);
    ptr = strcpy(ptr, "Hello, xxxxxxx");

    printf("%p\n", ptr);
    printf("%s\n", ptr);
    
    
    
    
    *(ptr+6) = 'I';
    *(ptr+7) = 'Y';
    *(ptr+8) = 'I';
    *(ptr+9) = 'N';
    *(ptr+10) = NULL;


    long value = 42;
    NSMutableString *string = [@"Hello" mutableCopy];
    [self someMethod:&value];
    [self someStringMethod:string];
    NSLog(@"%li", value);
    NSLog(@"%@", string);
    
//    NSLog(@"%c", letter5);
    
    printf("%s\n", ptr);
//    long value = 42;
//    NSLog(@"%li", value);
//    long *locationOFValue  = &value;
//    NSLog(@"%p", locationOFValue);
    
    
    
    
}

- (void)someStringMethod:(NSMutableString *)string
{
    [string setString:@"Goodbye"];
}

- (void)someMethod:(long *)value
{
    *value += 1;
}


@end
