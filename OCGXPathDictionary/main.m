//
//  main.m
//  OCGXPathDictionary
//
//  Created by Oguzhan Gungor on 16/9/17.
//  Copyright © 2017 Aslan-Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCGXPathDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dictionary = @{
                               @"Level1": @{
                                       @"Level2": @{
                                               @"Level3": @{
                                                       @"Level4": @"I want this"
                                                       }
                                               }
                                       },
                               };
    
        NSLog(@"%@", [dictionary parseDictionaryWithComponents:@"Level1", @"Level2", nil]);
        NSLog(@"%@", [dictionary parseDictionaryWithComponents:@"Level1", @"Level2", @"Level3", @"Level4", nil]);

        NSLog(@"%@", [dictionary parseDictionaryWithXPath:@"Level1/Level2"]);
        NSLog(@"%@", [dictionary parseDictionaryWithXPath:@"Level1/Level2/Level3/Level4"]);
        
        NSLog(@"%@", [dictionary parseDictionaryWithObjects:@[@"Level1", @"Level2"]]);
        NSLog(@"%@", [dictionary parseDictionaryWithObjects:@[@"Level1", @"Level2", @"Level3", @"Level4"]]);
        
    }
    return 0;
}
