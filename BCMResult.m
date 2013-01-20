//
//  BCMResult.m
//  BingoCardMaker
//
//  Created by Thomas Belote on 1/18/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import "BCMResult.h"

@implementation BCMResult {
    NSView *_view;
}

-(id)initWith:(NSString *)_text column:(NSString*)_column view:(NSView*)view {
    self = [super init];
    if (self) {
        [self setText:_text];
        [self setColumn:_column];
        [self setView:view];
    }
    return self;
}

-(NSString *) toString {
    if (self.column) {
        return [NSString stringWithFormat:@"%@%@", self.column, self.text];
    }
    return self.text;
}


@dynamic view;
@synthesize text;
@synthesize column;

-(void)setView:(NSView *)view {
    _view = view;
}

-(NSView*)getView {
    return _view;
}


@end
