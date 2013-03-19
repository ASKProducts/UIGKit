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

CGSize resizeBasedOnScale(CGSize size,CGSize prevScreenSize,CGSize currentScreenSize);
CGSize resizeAndKeepAspectRatio(CGSize size,float prevScreenSize,float currentScreenSize);
CGPoint resizePointBasedOnScale(CGPoint point,CGSize prevScreenSize,CGSize currentScreenSize);
CGPoint resizePointAndKeepAspectRatio(CGPoint point,float prevScreenSize,float currentScreenSize);
CGFloat resizeNumberBasedOnScale(CGFloat num,CGFloat prev,CGFloat current);
#define IPHONE_PORTRAIT_SIZE CGSizeMake(320,460)
#define IPHONE_PORTRAIT_SIZE_NO_STATUS CGSizeMake(320,480)

@interface UIGViewController : UIViewController
@property(nonatomic,retain)UIGView *graphicsView;
@end