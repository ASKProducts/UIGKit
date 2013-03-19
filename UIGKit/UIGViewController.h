//
//  UIGViewController.h
//  UIGKit
//
//  Created by stephen kaufer on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define draw_shape(verts,color,outline,lineWidth) [self.graphicsView addUIGObject:[UIGObject graphicsObjectWithPoints:verts andBaseColor:color andOutlineColor:outline andOutlineWidth:lineWidth]]
#define UIGViewAutoResizingLocation UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin
#define UIGViewAutoResizingSize UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
@class UIGView;
@class UIGObject;



@interface UIGViewController : UIViewController
@property(nonatomic,retain)UIGView *graphicsView;
@end