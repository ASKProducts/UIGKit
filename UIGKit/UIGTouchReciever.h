//
//  UIGTouchReciever.h
//  UIGButtonMaker
//
//  Created by stephen kaufer on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIGSprite.h"

@protocol UIGTouchReciever <NSObject>
@optional
-(void)spriteTouched:(UIGSprite*)touchedSprite withEvent:(UIEvent*)event;
@end
