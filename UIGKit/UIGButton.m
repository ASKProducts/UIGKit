//
//  UIGButton.m
//  UIGButtonMaker
//
//  Created by stephen kaufer on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGButton.h"
#import "UIGObject.h"

@implementation UIGButton
@synthesize buttonReciever,label,normalObject,selectedObject,buttonState;
-(id)initWithBaseObject:(UIGObject *)baseObject andSelectedObject:(UIGObject*)aselectedObject andButtonReciever:(NSObject<UIGButtonReciever>*)reciever andLabel:(UIGText*)lab{
    self = [super initWithBaseObject:baseObject];
    self.normalObject = baseObject;
    self.selectedObject = aselectedObject;
    self.label = lab;
    self.buttonState = UIGButtonStateOpen;
    self.buttonReciever = reciever;
    self.offscreenStatus = UIGOffscreenStatusAllow;
    label.center = self.center;
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(CGRectContainsPoint(self.frame,[touches.anyObject locationInView:self.superview])){
        self.baseObject = self.selectedObject;
        [self removeUIGObject:self.normalObject];
        [self addUIGObject:self.selectedObject];
        [self setNeedsDisplay];
        self.buttonState = UIGButtonStateTouch;
        if([buttonReciever respondsToSelector:@selector(buttonPressed:)])
            [buttonReciever buttonPressed:self];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(CGRectContainsPoint(self.frame,[touches.anyObject locationInView:self.superview])){
        self.buttonState = UIGButtonStateRelease;
        if([buttonReciever respondsToSelector:@selector(buttonPressed:)])
            [buttonReciever buttonPressed:self];
        self.buttonState = UIGButtonStateOpen;
    }
    else{
        self.buttonState = UIGButtonStateOpen;
    }
    self.baseObject = self.normalObject;
    [self removeUIGObject:self.selectedObject];
    [self addUIGObject:self.normalObject];
    [self setNeedsDisplay];
    
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [UIGColor(label.red, label.green, label.blue, label.alpha) setFill];
    [self.label.text drawInRect:self.bounds withFont:[UIFont fontWithName:self.label.fontName size:self.label.fontSize] lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentCenter];
}
@end