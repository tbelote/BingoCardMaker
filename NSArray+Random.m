#import "NSArray+Random.h"

@implementation NSArray (Random)

-(id)randomObject {
    uint32_t rnd = arc4random_uniform((uint32_t)[self count]);
    return [self objectAtIndex:rnd];
}

@end