//
//  BCMClassic.h
//  BingoCardMaker
//
//  Created by Thomas Belote on 1/18/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCMResult.h"
#import "BCMCard.h"

@interface BCMClassic : NSObject


-(BCMCard*)generateCard;

-(BCMResult*)call;


@property NSMutableArray *calledResults;
@property NSMutableArray *remainingResults;

/**
 * Is the library big enough (75 or more) to have library be split up into B - I - N - G - O columns
 * If not them the call results will just be the word and not have a column prefix.
 */
@property (nonatomic) BOOL columnOriented;
@property (nonatomic, strong) NSArray *library;


@end
