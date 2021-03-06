#import "Baddie.h"
#import "Bunker.h"

@implementation Baddie
-(id) init: (int) xcoord: (int) ycoord :(int) str{
    if ((self = [super init])) {
        baddie = [CCSprite spriteWithFile: @"baddie.png"];
        baddie.position = ccp(xcoord, ycoord);
        if ([self hasRetinaDisplay]) {
            baddie.scaleX = 2.0;
            baddie.scaleY = 2.0;
        }
        [self addChild:baddie];
        if (str == 1) health = 4;
        else health = 2;
        strength = str;
        [self setStrength :str];
        isAttacking = NO;
        pointOfEntry = ccp(CGFLOAT_MIN,CGFLOAT_MIN);
    }
    return self;
}

-(BOOL)hasRetinaDisplay
{
    // checks for iPhone 4. will return a false positive on iPads, so use the above function in conjunction with this to determine if it's a 3GS or below, or an iPhone 4.
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2)
        return YES;
    else
        return NO;
}

-(boolean_t) isAtPointOfEntry {
    if (pointOfEntry.x == CGFLOAT_MIN && pointOfEntry.y == CGFLOAT_MIN)
        return YES;
    else
        return NO;
}

-(void) setPointOfEntry {
    pointOfEntry = ccp([self getx], [self gety]);
}

-(void) setPointOfEntryToNull {
    pointOfEntry = ccp(CGFLOAT_MIN, CGFLOAT_MIN);
}

-(int) getPointOfEntryX {
    return pointOfEntry.x;
}

-(int) getPointOfEntryY {
    return pointOfEntry.y;
}

-(boolean_t) hasReachedTarget: (Bunker*) target {
    return CGRectContainsPoint([target getBoundingBox], [baddie position]);
   /* CGPoint pos = [target getPosition];
    
    return  (baddie.position.x >= pos.x &&
            baddie.position.y >= pos.y &&
            baddie.position.x <= (pos.x + 10) &&
            baddie.position.y <= (pos.y + 10));*/
 
}

-(int) getNearestBunker: (Bunkers*) bunkers {
    double shortestDistance = 723;
    int index = -1;
    
    for (int i=0; i < [bunkers count]; i++) {
        Bunker *cBunker = [bunkers getBunker:i];
        if (![cBunker getBunker].visible)
            {
                int bunkerX = [cBunker getx];
                int bunkerY = [cBunker gety];
    
                int baddieX = baddie.position.x;
                int baddieY = baddie.position.y;
        
                int dx = bunkerX - baddieX;
                int dy = bunkerY - baddieY;
        
                double distance = sqrtf(dx*dx + dy*dy);
                if (distance < shortestDistance) {
                    shortestDistance = distance;
                    index = i;
                }
            }
    }
    return index;
}
-(int) reduceHealth {
    return --health;
}
-(void) showHealth {
    if (health < 2)
    {
        CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:@"yellowBaddie.png"];
        [baddie setTexture: tex];
    }
}

-(CGRect) getBoundingBox {
    return baddie.boundingBox;
}

-(int) getx {
    return baddie.position.x;
}
-(int) gety {
    return baddie.position.y;
}
-(CGPoint) getPosition {
        return baddie.position;
    }
-(void) setPosition:(CGPoint) p {
    baddie.position = p;
}
-(void) setStrength:(int) str {
    if (str == 1) {
        if ([self hasRetinaDisplay]) {
            baddie.scaleX = 6;
            baddie.scaleY = 6;
        }
        else {
            baddie.scaleX = 3;
            baddie.scaleY = 3;
        }
    }
}
-(int) getStrength {
    return strength;
}

-(boolean_t) isAttacking {
    return isAttacking;
}

-(void) setAttacking:(boolean_t) attacking {
    isAttacking = attacking;
}

@end