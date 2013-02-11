//
//  BKTree.h
//
//  Created by Fabio Batista on 11/23/12.
//  Copyright (c) 2012 Fabio Batista. All rights reserved.
//  @fbatista & @webreakstuff

#import <Foundation/Foundation.h>
#import "BKNode.h"

typedef NSComparisonResult (^ScoreComparator)(id, id);

@interface BKTree : NSObject <Insertable, Searchable>

@property (nonatomic, strong) BKNode* root;
@property (nonatomic) NSUInteger count;

+ (ScoreComparator)getScoreComparator;

@end
