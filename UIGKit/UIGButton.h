//
//  UIGButton.h
//  UIGButtonMaker
//
//  Created by stephen kaufer on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGTouchableSprite.h"
#import "UIGButtonReciever.h"
#import "UIGText.h"

typedef char UIGButtonState;
#define UIGButtonStateOpen 0
#define UIGButtonStateTouch 1
#define UIGButtonStateRelease 2

@interface UIGButton : UIGTouchableSprite 
@property(nonatomic,strong)NSObject<UIGButtonReciever>* buttonReciever;
@property(nonatomic,strong)UIGText *label;
@property(nonatomic,strong)UIGObject *normalObject,*selectedObject;
@property(nonatomic)UIGButtonState buttonState;
-(id)initWithBaseObject:(UIGObject *)baseObject andSelectedObject:(UIGObject*)selectedObject andButtonReciever:(NSObject<UIGButtonReciever>*)reciever andLabel:(UIGText*)lab;
@end
