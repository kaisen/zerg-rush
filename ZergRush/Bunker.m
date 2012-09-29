//
//  Bunker.m
//  ZergRush
//
//  Created by Steven D Lebioda on 9/29/12.
//
//

#import "Bunker.h"

@implementation Bunker
-(id) init:(int) xcoord: (int) ycoord {
    if ((self = [super init])) {
        bunker = [CCSprite spriteWithFile: @"bunker.png"];
        [bunker setPosition:ccp(xcoord, ycoord)];
        bunker.scaleX = 0.7;
        bunker.scaleY = 0.7;
        [self addChild:bunker];
        health = 60; // 60 fps * 5 baddies * 2 seconds for debug using 60, otherwise 600
    }
    return self;
}

-(CCSprite*) getBunker {
    return bunker;
}


-(CGRect) getBoundingBox {
    return bunker.boundingBox;
}


-(int) getx {
    return bunker.position.x;
}
-(int) gety {
    return bunker.position.y;
}

-(CGPoint) getPosition {
    return bunker.position;
}
-(int) reduceHealth:(int) str{
    if (str ==0) {
        return --health;
    }
    return (health-=2);
}

//returns 1 for north, 2 for east, 3 for south, 4 for west
-(int) getWhichSideOfBunker:(CGPoint) p {
    int originX = bunker.boundingBox.origin.x;
    int originY = bunker.boundingBox.origin.y;
    
    int topY = originY + 57;
    int rightX = originX + 63;
    
    int px = p.x;
    int py = p.y;
    
    if (px <= originX && py <= topY && py >= originY) {
        return 4;
    }
    else if (px >= rightX && py <= topY && py >= originY) {
        return 2;
    }
    else if (py <= originY && px >= originX && px <= rightX) {
        return 3;
    }
    else if (py >= topY && px >= originX && px <= rightX) {
        return 1;
    }
    else {
        return 2;
    }
}
@end
