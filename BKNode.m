//
//  BKNode.m
//
//  Created by Fabio Batista on 11/23/12.
//  Copyright (c) 2012 Fabio Batista. All rights reserved.
//  @fbatista & @webreakstuff

#import "BKNode.h"


@implementation BKNode

@synthesize value;
@synthesize children;

- (id)init
{
    if (self = [super init]) {
        self.children = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initWithValue:(id<BKHashableValue>)theValue
{
    if (self = [self init]) {
        self.value = theValue;
    }
    return self;
}

/*
 Returns the number of inserted nodes (0 or 1)
*/
- (NSUInteger)insertValue:(id<BKHashableValue>)candidate
{
    NSUInteger dist = [self.value distanceToValue:candidate];
    // If the distance is zero, they're the same objects so don't insert
    if (dist != 0) {
        //If there is already a child with the same distance, insert it on that child
        BKNode* child = nil;
        NSNumber* distKey = [NSNumber numberWithInt:dist];
        if ((child = [children objectForKey:distKey]) != nil) {
            return [child insertValue:candidate];
        } else {
            // our candidate found a home as one of our children!
            [children setObject:[[BKNode alloc] initWithValue:candidate] forKey:distKey];
            return 1;
        }
        
    }
    return 0;
}

- (NSArray*)find:(id<BKHashableValue>)candidate withThreshold:(NSUInteger)threshold
{
    NSUInteger dist = [self.value distanceToValue:candidate];
    [self.value setScore:dist];
    NSMutableArray* results = [[NSMutableArray alloc] init];
    if (dist <= threshold) {
        [results addObject:self.value];
    }
    
    NSInteger dmin = dist - threshold;
    NSInteger dmax = dist + threshold;

    for (int i = dmin; i <= dmax; i++) {
        BKNode* child = nil;
        NSNumber* i_key = [[NSNumber alloc]initWithInt:i];
        if ((child = [children objectForKey:i_key]) != nil) {
            [results addObjectsFromArray:[child find:candidate withThreshold:threshold]];
        }
    }

    return results;
}

@end
