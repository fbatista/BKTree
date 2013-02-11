//
//  BKNode.h
//
//  Created by Fabio Batista on 11/23/12.
//  Copyright (c) 2012 Fabio Batista. All rights reserved.
//  @fbatista & @webreakstuff

#import <Foundation/Foundation.h>
#import "BKHashableValue.h"

@protocol Insertable <NSObject>

- (NSUInteger)insertValue:(id<BKHashableValue>)candidate;

@end

@protocol Searchable <NSObject>

- (NSMutableArray*)find:(id<BKHashableValue>)candidate withThreshold:(NSUInteger)threshold;

@end

@interface BKNode : NSObject <Insertable, Searchable>

@property (nonatomic, strong) id<BKHashableValue> value;
@property (nonatomic, strong) NSMutableDictionary* children;

- (id)init;
- (id)initWithValue:(id<BKHashableValue>)theValue;

@end