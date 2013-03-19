//
//  UIGButtonReciever.h
//  UIGButtonMaker
//
//  Created by stephen kaufer on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIGTouchReciever.h"
@class UIGButton;
@protocol UIGButtonReciever <UIGTouchReciever>
@optional
-(void)buttonPressed:(UIGButton*)button;
@end
