//
//  UIGJoyStickReciever.h
//  UIGJoystickMaker
//
//  Created by stephen kaufer on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIGJoyStick.h"
@class UIGJoyStick;
@protocol UIGJoyStickReciever <NSObject>
@optional
-(void)joyStick:(UIGJoyStick*)joyStick didChangeAngle:(float)angle;
-(void)joyStick:(UIGJoyStick*)joyStick buttonTouchedWithEvent:(UIEvent*)event;
@end
