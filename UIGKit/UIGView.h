//
//  UIGView.h
//  UIGKit
//
//  Created by stephen kaufer on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIGObject;
@interface UIGView : UIView
@property(strong)NSMutableArray *objects;
-(UIGObject*)addUIGObject:(UIGObject*)obj;
-(UIGObject*)removeUIGObject:(UIGObject*)obj;
-(NSArray*)checkForDirectCollisions;
-(NSArray*)checkForCollisionsWithOffset:(CGPoint)offset;
@end
