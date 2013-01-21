//
//  BCMResult.h
//  BingoCardMaker
//
//  Created by Thomas Belote on 1/18/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMResult : NSObject

-(id)initWith:(NSString *)text column:(NSString*)column view:(NSView*)view;

-(NSString *) toString;

@property (nonatomic, strong) NSView *view;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *column;

@end
