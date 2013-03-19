//
//  UIGJoyStick.m
//  UIGJoystickMaker
//
//  Created by stephen kaufer on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGJoyStick.h"

@implementation UIGJoyStick
@synthesize backgroundObject,buttonSprite,angle,joyStickReciever,sticksToEdge,snapsBack,startingLocation;


-(id)initWithBackgroundObject:(UIGObject *)aBackgroundObject andButtonObject:(UIGObject*)aButtonObject andStartingButtonLocation:(CGPoint)astartingLocation{
    self = [super initWithBaseObject:aBackgroundObject];
    UIGTouchableSprite *bsprite = [[UIGTouchableSprite alloc] initWithBaseObject:aButtonObject andTouchReciever:self];
    self.buttonSprite = bsprite;
    [self.buttonSprite setSize:CGSizeMake(aButtonObject.bounds.size.width, aButtonObject.bounds.size.height)];
    [self.buttonSprite setCenter:astartingLocation];
    self.startingLocation = astartingLocation;
    self.backgroundObject = aBackgroundObject;
     self.buttonSprite.offscreenStatus=UIGOffscreenStatusStay;
    [self addSubview:self.buttonSprite];
    self.offscreenStatus = UIGOffscreenStatusAllow;
    self.sticksToEdge = NO;
    return self;
}
-(void)spriteTouched:(UIGSprite *)touchedSprite withEvent:(UIEvent *)event{
    [self touchesMoved:nil withEvent:event];
    if([self.joyStickReciever respondsToSelector:@selector(joyStick:buttonTouchedWithEvent:)])
    [self.joyStickReciever joyStick:self buttonTouchedWithEvent:event];
    if([event.allTouches.anyObject phase] == UITouchPhaseEnded && self.snapsBack)[self.buttonSprite setCenter:self.startingLocation];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
    if([event.allTouches.anyObject phase] == UITouchPhaseEnded && self.snapsBack)[self.buttonSprite setCenter:self.startingLocation];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if([(UITouch*)event.allTouches.anyObject phase] == UITouchPhaseMoved){
        CGPoint currentCenter = CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2);
        CGPoint touchedLocation = [event.allTouches.anyObject locationInView:self];
        CGPoint deltaPos = CGPointMake(touchedLocation.x-currentCenter.x, touchedLocation.y-currentCenter.y);
        self.angle = atan2f(deltaPos.y, deltaPos.x)*57.396f+90;
        
        float dist = distanceBetween(currentCenter, touchedLocation);
        
        CGPoint final;
        if(dist>(self.bounds.size.width/2) || self.sticksToEdge)
        final = CGPointMake((self.bounds.size.width/2)+deltaPos.x/dist*(self.bounds.size.width/2), (self.bounds.size.height/2)+deltaPos.y/dist*(self.bounds.size.height/2));
        else 
            final = touchedLocation;

        [self.buttonSprite setCenter:final];
        if([self.joyStickReciever respondsToSelector:@selector(joyStick:didChangeAngle:)])
        [self.joyStickReciever joyStick:self didChangeAngle:self.angle];
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.snapsBack)[self.buttonSprite setCenter:startingLocation];
}
@end
