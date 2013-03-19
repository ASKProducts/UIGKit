//
//  UIGView.m
//  UIGKit
//
//  Created by stephen kaufer on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGView.h"
#import "UIGObject.h"
#import "UIGSprite.h"

@implementation UIGView
@synthesize objects;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *m = [NSMutableArray arrayWithCapacity:500];
        self.objects = m;
        //[self setCenter:CGPointMake(([UIScreen mainScreen].bounds.size.width)/2, ([UIScreen mainScreen].bounds.size.height-20)/2)];
    }
    return self;
}

-(UIGObject*)addUIGObject:(UIGObject *)obj{
    [self.objects addObject:obj];
    obj.containerView = self;
    return obj;
}
-(UIGObject*)removeUIGObject:(UIGObject*)obj{
    [self.objects removeObject:obj];
    //obj.containerView = self;
    return obj;
}
// Only override drawRect: if you perform custom drawing.

- (void)drawRect:(CGRect)rect
{
    for (UIGObject *o in objects) {
        //[o updateVerts];
        //NSLog(@"%f,%f,%f,%f",o.baseRed,o.baseGreen,o.baseBlue,o.baseAlpha);
        if(o.objectType == UIGObjectTypeVertex){
            [[UIColor colorWithRed:o.baseRed green:o.baseGreen blue:o.baseBlue alpha:o.baseAlpha] setFill];
            [[UIColor colorWithRed:o.outlineRed green:o.outlineGreen blue:o.outlineBlue alpha:o.outlineAlpha] setStroke];
            [o fill];
            [o stroke];
        }
        else if(o.objectType == UIGObjectTypeImage){
            [o.image drawInRect:rect];
        }
    }
}

-(NSArray*)checkForDirectCollisions{
    return [self checkForCollisionsWithOffset:CGPointZero];
}

-(NSArray*)checkForCollisionsWithOffset:(CGPoint)offset{
    NSMutableArray *collidingObjects = [[NSMutableArray alloc] init];
    for (UIView *spr1 in [self subviews]) {
        if(![spr1 isKindOfClass:[UIGSprite class]])continue;
        [spr1 setColliders:[[NSMutableArray alloc] init]];
        for (UIGSprite *spr2 in [self subviews]) {
            if(![spr2 isKindOfClass:[UIGSprite class]])continue;
            if(spr1 == spr2)continue;
            if(CGRectIntersectsRect(
                                    CGRectMake(spr1.frame.origin.x+(0-offset.x/2), spr1.frame.origin.y+(0-offset.y/2), spr1.frame.size.width+offset.x,spr1.frame.size.height+offset.y),
                                    CGRectMake(spr2.frame.origin.x+(0-offset.x/2), spr2.frame.origin.y+(0-offset.y/2), spr2.frame.size.width+offset.x,spr2.frame.size.height+offset.y)
                                    )){
                if(![spr2.colliders containsObject:spr1]){
                    [spr1.colliders addObject:spr2];
                }
                
            }
            
        }
        if([spr1.colliders count] > 0)[collidingObjects addObject:spr1];
    }
    return collidingObjects;
}

@end
