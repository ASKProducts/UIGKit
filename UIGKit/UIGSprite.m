//
//  UIGSprite.m
//  UIGKit
//
//  Created by stephen kaufer on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGSprite.h"
#import "UIGObject.h"

@implementation UIGSprite
@synthesize baseObject,size,colliders,offscreenStatus,moving,velocity,acceleration;
-(id)initWithBaseObject:(UIGObject *)abaseObject{
    self = [super initWithFrame:[abaseObject bounds]];
    [self setBaseObject:abaseObject];
    [self addUIGObject:abaseObject];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setColliders:[[NSMutableArray alloc] init]];
    [self setOffscreenStatus:UIGOffscreenStatusAllow];
    return self;
}
-(void)setCenter:(CGPoint)center{
    switch (self.offscreenStatus.offscreenAbility) {
        case UIGOffscreenAbilityStay:
            if(center.x > self.superview.frame.size.width) center.x = self.superview.frame.size.width;
            if(center.x < 0) center.x = 0;
            if(center.y > self.superview.frame.size.height) center.y = self.superview.frame.size.height;
            if(center.y < 0) center.y = 0;
            break;
        case UIGOffscreenAbilityWrap:
            switch (self.offscreenStatus.wrapStatus) {
                case UIGWrapStatusX:
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountHalf){
                        if(center.x > self.superview.frame.size.width) center.x = 0;
                        if(center.x < 0)center.x = self.superview.frame.size.width;
                    }
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountNone){
                        if(center.x > (self.superview.frame.size.width-self.bounds.size.width/2)) center.x = self.bounds.size.width/2;
                        if(center.x < self.bounds.size.width/2)center.x = (self.superview.frame.size.width-self.bounds.size.width/2);
                    }
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountFull){
                        if(center.x > (self.superview.frame.size.width+self.bounds.size.width/2)) center.x = 0-self.bounds.size.width/2;
                        if(center.x < 0-self.bounds.size.width/2)center.x = (self.superview.frame.size.width+self.bounds.size.width/2);
                    }
                    break;
                case UIGWrapStatusY:
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountHalf){
                        if(center.y > self.superview.frame.size.height)center.y = 0;
                        if(center.y < 0) center.y = self.superview.frame.size.height;
                    }
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountNone){
                        if(center.y > (self.superview.frame.size.height-self.bounds.size.height/2)) center.y = self.bounds.size.height/2;
                        if(center.y < self.bounds.size.height/2)center.y = (self.superview.frame.size.height-self.bounds.size.height/2);
                    }
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountFull){
                        if(center.y > (self.superview.frame.size.height+self.bounds.size.height/2)) center.y = 0-self.bounds.size.height/2;
                        if(center.y < 0-self.bounds.size.height/2)center.y = (self.superview.frame.size.height+self.bounds.size.height/2);
                    }
                    break;
                case UIGWrapStatusXY:
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountHalf){
                        if(center.x > self.superview.frame.size.width) center.x = 0;
                        if(center.x < 0)center.x = self.superview.frame.size.width;
                        if(center.y > self.superview.frame.size.height)center.y = 0;
                        if(center.y < 0) center.y = self.superview.frame.size.height;
                    }
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountNone){
                        if(center.x > (self.superview.frame.size.width-self.bounds.size.width/2)) center.x = self.bounds.size.width/2;
                        if(center.x < self.bounds.size.width/2)center.x = (self.superview.frame.size.width-self.bounds.size.width/2);
                        if(center.y > (self.superview.frame.size.height-self.bounds.size.height/2)) center.y = self.bounds.size.height/2;
                        if(center.y < self.bounds.size.height/2)center.y = (self.superview.frame.size.height-self.bounds.size.height/2);
                    }
                    if(self.offscreenStatus.wrapAmount == UIGWrapAmountFull){
                        if(center.x > (self.superview.frame.size.width+self.bounds.size.width/2)) center.x = 0-self.bounds.size.width/2;
                        if(center.x < 0-self.bounds.size.width/2)center.x = (self.superview.frame.size.width+self.bounds.size.width/2);
                        if(center.y > (self.superview.frame.size.height+self.bounds.size.height/2)) center.y = 0-self.bounds.size.height/2;
                        if(center.y < 0-self.bounds.size.height/2)center.y = (self.superview.frame.size.height+self.bounds.size.height/2);
                    }
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    [super setCenter:center];
}
-(void)setSize:(CGSize)asize{
    size = asize;
    [self setBounds:CGRectMake(0, 0, asize.width, asize.height)];
}
-(void)setBounds:(CGRect)bounds{
    [super setBounds:bounds];
    
    for (UIGObject *obj in self.objects)
        [obj applyTransform:CGAffineTransformMakeScale(bounds.size.width/self.baseObject.bounds.size.width, bounds.size.height/self.baseObject.bounds.size.height)];
}

-(BOOL)collidesWith:(UIGSprite *)other{
    return [self collidesWith:other offset:CGPointZero];
}

-(BOOL)collidesWith:(UIGSprite *)other offset:(CGPoint)offset{
    if([self.colliders containsObject:other] || [other.colliders containsObject:self])return YES;
    return NO;
}
-(void)startMoving{
    self.moving = YES;
    [self updatePosition];
}
-(void)updatePosition{
    CGPoint new = CGPointMake(self.center.x, self.center.y);
    CGFloat distanceToGo = self.velocity.speed * (1.0/30.0);
    new.x += distanceToGo*cosf((self.velocity.direction-90.0)*M_PI/180.0);
    new.y += distanceToGo*sinf((self.velocity.direction-90.0)*M_PI/180.0);
    
    [self setCenter:new];
    self.velocity = UIGVelocityMake(self.velocity.speed + self.acceleration.speed/30.0, self.velocity.direction + self.acceleration.direction/30.0);
    if(self.moving)[NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self selector:@selector(updatePosition) userInfo:nil repeats:NO];
}
-(void)stopMoving{
    self.moving = NO;
}
@end