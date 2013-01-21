//
//  BCMCard.h
//  BingoCardMaker
//
//  Created by Thomas Belote on 1/20/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BCMResult.h"

@interface BCMCard : NSObject


-(BOOL)isBingo;

-(BOOL)isResultOnCard:(BCMResult*)result;

-(void)addResultIfOnCard:(BCMResult*)result;

//Results representing the columns of the card
@property (nonatomic, strong) NSArray *B;
@property (nonatomic, strong) NSArray *I;
@property (nonatomic, strong) NSArray *N;
@property (nonatomic, strong) NSArray *G;
@property (nonatomic, strong) NSArray *O;

//Results that have been called that are on this card.
@property (nonatomic, strong) NSMutableArray *markings;

@end
