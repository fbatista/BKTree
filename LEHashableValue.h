//
//  BKHashableValue.h
//
//  Created by Fabio Batista on 11/23/12.
//  Copyright (c) 2012 Fabio Batista. All rights reserved.
//  @fbatista & @webreakstuff

#import <Foundation/Foundation.h>
#import "LEHasher.h"

@protocol BKHashableValue <NSObject>

- (void)setScore:(NSUInteger)score;
- (NSUInteger)getScore;
- (NSUInteger)distanceToValue:(id<BKHashableValue>)candidate;

@end
