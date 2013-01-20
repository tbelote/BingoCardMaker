//
//  BCMClassic.m
//  BingoCardMaker
//
//  Created by Thomas Belote on 1/18/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import "BCMClassic.h"

@implementation BCMClassic

@synthesize columnOriented;
@synthesize library;
@synthesize calledResults;
@synthesize remainingResults;

-(id) init {
    self = [super init];
    if (self) {
        int maxNumber = 75;
        NSMutableArray * tempLibary = [[NSMutableArray alloc] initWithCapacity:maxNumber];
        
        for (int i = 1; i <= maxNumber; i++) {
            if (i <= 15) {
                [tempLibary addObject:[[BCMResult alloc] initWith:[NSString stringWithFormat:@"%d", i]
                                                           column:@"B"
                                                             view:nil]];
            } else if (i <= 30) {
                [tempLibary addObject:[[BCMResult alloc] initWith:[NSString stringWithFormat:@"%d", i]
                                                           column:@"I"
                                                             view:nil]];
            } else if (i <= 45) {
                [tempLibary addObject:[[BCMResult alloc] initWith:[NSString stringWithFormat:@"%d", i]
                                                           column:@"N"
                                                             view:nil]];
            } else if (i <= 60) {
                [tempLibary addObject:[[BCMResult alloc] initWith:[NSString stringWithFormat:@"%d", i]
                                                           column:@"G"
                                                             view:nil]];
            } else if (i <= 75) {
                [tempLibary addObject:[[BCMResult alloc] initWith:[NSString stringWithFormat:@"%d", i]
                                                           column:@"O"
                                                             view:nil]];
            }
        }
        
        [self setLibrary:tempLibary];
        [self setCalledResults:[[NSMutableArray alloc] initWithCapacity:maxNumber]];
        [self setRemainingResults:[[NSMutableArray alloc] initWithCapacity:maxNumber]];
        [self.remainingResults addObjectsFromArray:self.library];

    }
    return self;
}

-(BCMResult*)call {
    BCMResult *result = [self.remainingResults randomObject];
    [self.remainingResults removeObject:result];
    [self.calledResults addObject:result];
    return result;
}


@end
