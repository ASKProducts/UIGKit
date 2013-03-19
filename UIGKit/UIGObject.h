//
//  UIGObject.h
//  UIGKit
//
//  Created by stephen kaufer on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGView.h"
#define END -123.456f

#define UIGColor(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]

#define UIGColorClear UIGColor(0.0,0.0,0.0,0.0)

#define UIGColorWhite UIGColor(1.0,1.0,1.0,1.0)
#define UIGColorLightGray UIGColor(0.75,0.75,0.75,1.0)
#define UIGColorGray UIGColor(0.5,0.5,0.5,1.0)
#define UIGColorDarkGray UIGColor(0.25,0.25,0.25,1.0)
#define UIGColorBlack UIGColor(0.0,0.0,0.0,1.0)

#define UIGColorRed UIGColor(1.0,0.0,0.0,1.0)
#define UIGColorGreen UIGColor(0.0,1.0,0.0,1.0)
#define UIGColorBlue UIGColor(0.0,0.0,1.0,1.0)

#define UIGColorYellow UIGColor(1.0,1.0,0.0,1.0)
#define UIGColorCyan UIGColor(0.0,1.0,1.0,0.0)
#define UIGColorMagenta UIColor(1.0,0.0,1.0,1.0)

#define UIGColorOrange UIGColor(1.0,0.5,0.0,1.0)
#define UIGColorPurple UIGColor(0.5,0.0,0.5,1.0)
#define UIGColorBrown UIGColor(0.6,0.4,0.2,1.0)

typedef char UIGObjectType;
#define UIGObjectTypeVertex 1
#define UIGObjectTypeImage 2

float distanceBetween(CGPoint p1,CGPoint p2);

@interface UIGObject : UIBezierPath
//@property(nonatomic,copy)UIColor *baseColor;
//@property(nonatomic,copy)UIColor *outlineColor;
@property(assign,nonatomic)CGFloat *verts;
@property(assign)UIGView *containerView;

@property(assign)float baseRed;
@property(assign)float baseGreen;
@property(assign)float baseBlue;
@property(assign)float baseAlpha;
@property(assign)float outlineRed;
@property(assign)float outlineGreen;
@property(assign)float outlineBlue;
@property(assign)float outlineAlpha;
@property(assign)UIGObjectType objectType;
@property(strong)UIImage *image;


+(UIGObject*)graphicsObject;
+(UIGObject*)graphicsObjectWithPoints:(CGFloat*)points andBaseColor:(UIColor*)bc andOutlineColor:(UIColor*)oc andOutlineWidth:(CGFloat)ow;
+(UIGObject*)graphicsObjectWithImage:(UIImage*)img;
enum toby{to,by};
-(void)attackVert:(int)vertNum doing:(enum toby)doing with:(CGPoint)with;

-(void)changeVerts:(CGFloat*)points;
-(void)updateVerts;
-(void)setBaseColor:(UIColor*)bc;

@end