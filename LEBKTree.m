//
//  BKTree.m
//
//  Created by Fabio Batista on 11/23/12.
//  Copyright (c) 2012 Fabio Batista. All rights reserved.
//  @fbatista & @webreakstuff

#import "BKTree.h"

@implementation BKTree

@synthesize root;
@synthesize count;

- (NSMutableArray *)find:(id<BKHashableValue>)candidate withThreshold:(NSUInteger)threshold
{
    if (self.root == nil) {
        return [[NSMutableArray alloc] init];
    } else {
        NSArray* results = [[self.root find:candidate withThreshold:threshold] sortedArrayUsingComparator:[BKTree getScoreComparator]];
        
        return [NSMutableArray arrayWithArray:results];
    }
}

/*
 returns total number of nodes in tree after insert
 */
- (NSUInteger)insertValue:(id<BKHashableValue>)candidate
{
    if (self.root == nil) {
        self.root = [[BKNode alloc] initWithValue:candidate];
        self.count = 1;
    } else {
        self.count += [self.root insertValue:candidate];
    }
    return self.count;
}

+ (ScoreComparator)getScoreComparator
{
    return ^(id a, id b) {
        if ([a getScore] > [b getScore]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([a getScore] < [b getScore]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
}

@end
