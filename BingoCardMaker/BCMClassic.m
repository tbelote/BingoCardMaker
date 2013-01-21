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

-(BCMCard*)generateCard {
    BCMCard *card = [[BCMCard alloc] init];
    NSMutableArray *B = [[NSMutableArray alloc] initWithCapacity:5];
    NSMutableArray *I = [[NSMutableArray alloc] initWithCapacity:5];
    NSMutableArray *N = [[NSMutableArray alloc] initWithCapacity:5];
    NSMutableArray *G = [[NSMutableArray alloc] initWithCapacity:5];
    NSMutableArray *O = [[NSMutableArray alloc] initWithCapacity:5];
    
    //Available options
    int maxNumber = 75;
    for (int i = 1; i <= maxNumber; i++) {
        if (i <= 15) {
            [B addObject:[NSNumber numberWithInt:((i-1)%15)]];
        } else if (i <= 30) {
            [I addObject:[NSNumber numberWithInt:((i-1)%15)]];
        } else if (i <= 45) {
            [N addObject:[NSNumber numberWithInt:((i-1)%15)]];
        } else if (i <= 60) {
            [G addObject:[NSNumber numberWithInt:((i-1)%15)]];
        } else if (i <= 75) {
            [O addObject:[NSNumber numberWithInt:((i-1)%15)]];
        }
    }
 
    //Remove until just 5 are left in each column to make the card
    for (int j = 0; j<10; j++) {
        [B removeObject:[B randomObject]];
        [I removeObject:[I randomObject]];
        [N removeObject:[N randomObject]];
        [G removeObject:[G randomObject]];
        [O removeObject:[O randomObject]];
    }
    //N only has 4 because the middle square is free
    [N removeObject:[N randomObject]];

    //put the columns onto the card
    card.B = [NSArray arrayWithObjects:
              [self.library objectAtIndex:[[B objectAtIndex:0] intValue]],
              [self.library objectAtIndex:[[B objectAtIndex:1] intValue]],
              [self.library objectAtIndex:[[B objectAtIndex:2] intValue]],
              [self.library objectAtIndex:[[B objectAtIndex:3] intValue]],
              [self.library objectAtIndex:[[B objectAtIndex:4] intValue]],
              nil];

    card.I = [NSArray arrayWithObjects:
              [self.library objectAtIndex:[[I objectAtIndex:0] intValue]],
              [self.library objectAtIndex:[[I objectAtIndex:1] intValue]],
              [self.library objectAtIndex:[[I objectAtIndex:2] intValue]],
              [self.library objectAtIndex:[[I objectAtIndex:3] intValue]],
              [self.library objectAtIndex:[[I objectAtIndex:4] intValue]],
              nil];

    card.N = [NSArray arrayWithObjects:
              [self.library objectAtIndex:[[N objectAtIndex:0] intValue]],
              [self.library objectAtIndex:[[N objectAtIndex:1] intValue]],
              [self.library objectAtIndex:[[N objectAtIndex:2] intValue]],
              [self.library objectAtIndex:[[N objectAtIndex:3] intValue]],
              nil];

    card.G = [NSArray arrayWithObjects:
              [self.library objectAtIndex:[[G objectAtIndex:0] intValue]],
              [self.library objectAtIndex:[[G objectAtIndex:1] intValue]],
              [self.library objectAtIndex:[[G objectAtIndex:2] intValue]],
              [self.library objectAtIndex:[[G objectAtIndex:3] intValue]],
              [self.library objectAtIndex:[[G objectAtIndex:4] intValue]],
              nil];

    card.O = [NSArray arrayWithObjects:
              [self.library objectAtIndex:[[O objectAtIndex:0] intValue]],
              [self.library objectAtIndex:[[O objectAtIndex:1] intValue]],
              [self.library objectAtIndex:[[O objectAtIndex:2] intValue]],
              [self.library objectAtIndex:[[O objectAtIndex:3] intValue]],
              [self.library objectAtIndex:[[O objectAtIndex:4] intValue]],
              nil];

    
    return card;
}

-(BCMResult*)call {
    BCMResult *result = [self.remainingResults randomObject];
    [self.remainingResults removeObject:result];
    [self.calledResults addObject:result];
    return result;
}


@end
