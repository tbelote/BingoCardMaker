//
//  BCMDocument.h
//  BingoCardMaker
//
//  Created by Thomas Belote on 12/31/12.
//  Copyright (c) 2012 Thomas Belote. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BCMDocument : NSDocument {
    NSTextField *debug;
}

@property IBOutlet NSTextField* debug;
@end
