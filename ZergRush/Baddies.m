#import "Baddies.h"

@implementation Baddies
-(id) init {
    if ((self = [super init])) {
        baddies = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addBaddie:(int)i :(int)str{
 //   Baddie *baddie = [[Baddie alloc] init:50:480];
 //   [self addChild:baddie];
 //   [baddies addObject:baddie];
 //   for (int i = 0; i < 10; i++) {
        Baddie *baddie;
        if (i == 0)
            baddie = [[Baddie alloc] init:(random() % 320) : 480 :str];
        else baddie = [[Baddie alloc] init:0 : (random() % 480) :str];
        [self addChild:baddie];
        [baddies addObject:baddie];
        /*CCSprite *baddie = [CCSprite spriteWithFile: @"baddie.png"];
         baddie.position = ccp(100, 100);
         [self addChild:baddie];
         [baddies addObject:baddie];*/
   // }
    
}
-(void) addBaddie:(int)str {
    Baddie *baddie = [[Baddie alloc] init:(random() % 320) : 480 :str];
    [self addChild:baddie];
    [baddies addObject:baddie];
}


-(void) addBaddieWithPosition:(int)xCoor :(int)yCoor :(int)str{
    Baddie *baddie;
    baddie = [[Baddie alloc] init:xCoor :yCoor :str];
    [self addChild:baddie];
    [baddies addObject:baddie];
    
}


-(void) draw {
    for (int i=0; i < [baddies count]; i++) {
        
    }
}

-(int) count {
    return [baddies count];
}

-(void) removeBaddie:(id)baddie {
    [baddies removeObject:baddie];
    [self removeChild:baddie cleanup:YES];
   // [baddie release];
}

-(Baddie *) getBaddie:(int)index {
    return [baddies objectAtIndex:index];
}

-(void) replace:(int) i: (Baddie*) newbaddie{
    [baddies replaceObjectAtIndex:i withObject:newbaddie];
}

-(void) setAllAttacking:(boolean_t) attacking {
    for (int i=0; i < [baddies count]; i++ ) {
        Baddie *baddie = [baddies objectAtIndex:i];
        [baddie setAttacking:attacking];
    }
}

-(void) setPointOfEntryToNullForBunker:(Bunker *) bunker {
    for (int i=0; i < [baddies count]; i++) {
        Baddie *baddie = [baddies objectAtIndex:i];
        if (CGRectContainsPoint([bunker getBoundingBox], [baddie getPosition])) {
            [baddie setPointOfEntryToNull];
        }
    }
}

@end