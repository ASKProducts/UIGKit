//
//  UIGTouchableSprite.m
//  UIGButtonMaker
//
//  Created by stephen kaufer on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGTouchableSprite.h"
#import "UIGTouchReciever.h"

@implementation UIGTouchableSprite
@synthesize touchReciever;
-(id)initWithBaseObject:(UIGObject *)baseObject andTouchReciever:(NSObject<UIGTouchReciever>*)reciever{
    self = [super initWithBaseObject:baseObject];
    [self setTouchReciever:reciever];
    [self setOffscreenStatus:UIGOffscreenStatusAllow];
    return self;
}
-(id)initWithTouchReciever:(NSObject<UIGTouchReciever>*)reciever{
    self = [super init];
    self.touchReciever = reciever;
    [self setOffscreenStatus:UIGOffscreenStatusAllow];
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if([touchReciever respondsToSelector:@selector(spriteTouched:withEvent:)])
    [touchReciever spriteTouched:self withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if([touchReciever respondsToSelector:@selector(spriteTouched:withEvent:)])
    [touchReciever spriteTouched:self withEvent:event];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if([touchReciever respondsToSelector:@selector(spriteTouched:withEvent:)])
    [touchReciever spriteTouched:self withEvent:event];
}


@end
