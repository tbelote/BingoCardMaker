//
//  BCMCard.m
//  BingoCardMaker
//
//  Created by Thomas Belote on 1/20/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import "BCMCard.h"

@implementation BCMCard

-(BOOL)isBingo {
    for (int i=0; i<5; i++) {
        int indexForN = i;
        if (i>2) {
            indexForN = i-1;
        }
        
        //N is free don't count it on the middle row
        if (i == 2) {
            if ([markings indexOfObject:[B objectAtIndex:i]] != NSNotFound
                && [markings indexOfObject:[I objectAtIndex:i]] != NSNotFound
                && [markings indexOfObject:[G objectAtIndex:i]] != NSNotFound
                && [markings indexOfObject:[O objectAtIndex:i]] != NSNotFound
                ) {
                return YES;
            }
        } else {
            if ([markings indexOfObject:[B objectAtIndex:i]] != NSNotFound
                && [markings indexOfObject:[I objectAtIndex:i]] != NSNotFound
                && [markings indexOfObject:[N objectAtIndex:indexForN]] != NSNotFound
                && [markings indexOfObject:[G objectAtIndex:i]] != NSNotFound
                && [markings indexOfObject:[O objectAtIndex:i]] != NSNotFound
                ) {
                return YES;
            }
        }
    }
    return NO;
}

-(BOOL)isResultOnCard:(BCMResult*)result {
    if ([self.B indexOfObject:result] != NSNotFound
        || [self.I indexOfObject:result] != NSNotFound
        || [self.N indexOfObject:result] != NSNotFound
        || [self.G indexOfObject:result] != NSNotFound
        || [self.O indexOfObject:result] != NSNotFound) {
        return YES;
    }
    return NO;
}

-(void)addResultIfOnCard:(BCMResult*)result {
    if ([self isResultOnCard:result]) {
        [self.markings addObject:result];
    }
}


@synthesize B;
@synthesize I;
@synthesize N;
@synthesize G;
@synthesize O;

@synthesize markings;

@end
