//
//  UIGJoyStick.h
//  UIGJoystickMaker
//
//  Created by stephen kaufer on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGKit.h"
#import "UIGJoyStickReciever.h"
@interface UIGJoyStick : UIGSprite <UIGTouchReciever>
@property(nonatomic,strong)UIGObject *backgroundObject;
@property(nonatomic,strong)UIGTouchableSprite *buttonSprite;
@property(nonatomic)float angle;
@property(nonatomic)BOOL sticksToEdge;
@property(nonatomic)BOOL snapsBack;
@property(nonatomic)CGPoint startingLocation;


@property(nonatomic,strong)NSObject<UIGJoyStickReciever>* joyStickReciever;
-(id)initWithBackgroundObject:(UIGObject *)aBackgroundObject andButtonObject:(UIGObject*)aButtonObject andStartingButtonLocation:(CGPoint)startingLocation;
@end
