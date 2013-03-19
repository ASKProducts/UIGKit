//
//  UIGObject.m
//  UIGKit
//
//  Created by stephen kaufer on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGObject.h"
float distanceBetween(CGPoint p1,CGPoint p2){
    return sqrt(
                ((p2.x-p1.x)*(p2.x-p1.x)) +
                ((p2.y-p1.y)*(p2.y-p1.y))
                );
}
@implementation UIGObject
@synthesize /*outlineColor,*/verts,containerView,baseBlue,baseRed,baseGreen,outlineRed,outlineGreen,outlineBlue,baseAlpha,outlineAlpha,objectType,image;
#pragma mark - generating objects
+(UIGObject*)graphicsObject{
    return [[UIGObject alloc] init];
}
+(UIGObject*)graphicsObjectWithPoints:(CGFloat*)points andBaseColor:(UIColor*)bc andOutlineColor:(UIColor*)oc andOutlineWidth:(CGFloat)ow{
    UIGObject *o = [[UIGObject alloc] init];
    //NSLog(@"%lu",CGColorGetNumberOfComponents([bc CGColor]));
    const float *c = CGColorGetComponents([bc CGColor]);
    if(CGColorGetNumberOfComponents([bc CGColor]) == 4){
        o.baseRed = c[0];
        o.baseGreen = c[1];
        o.baseBlue = c[2];
        o.baseAlpha = c[3];
    }
    else if(CGColorGetNumberOfComponents([bc CGColor]) == 2) {
        o.baseRed = o.baseGreen = o.baseBlue = c[2];
        o.baseAlpha = c[3];
    }
    else o.baseRed = o.baseGreen = o.baseBlue = o.baseAlpha = 1.0;
    
    const float *oco = CGColorGetComponents([oc CGColor]);
    if(CGColorGetNumberOfComponents([oc CGColor]) == 4){
        o.outlineRed = oco[0];
        o.outlineGreen = oco[1];
        o.outlineBlue = oco[2];
        o.outlineAlpha = oco[3];
    }
    else{
        o.outlineRed = o.outlineGreen = o.outlineBlue = oco[2];
        o.outlineAlpha = oco[3];
    }
    
    o.lineWidth = ow;
    if(points==nil)return o;
    o.verts = points;
    [o moveToPoint:CGPointMake(points[0], points[1])];
    for (int i = 1; points[i*2] != END; i++) {
        int pos = i*2;
        [o addLineToPoint:CGPointMake(points[pos], points[pos+1])];
    }
    [o closePath];
    o.objectType = UIGObjectTypeVertex;
    return o;
}
+(UIGObject*)graphicsObjectWithImage:(UIImage*)img{
    CGSize pixelSize = CGSizeMake([img size].width, [img size].height);
    CGFloat points[] = {
        0,0,
        pixelSize.width,0,
        pixelSize.width,pixelSize.height,
        0,pixelSize.height,
        END
    };
    UIGObject *o = [UIGObject graphicsObjectWithPoints:points andBaseColor:UIGColorClear andOutlineColor:UIGColorClear andOutlineWidth:0.0];
    o.image = img;
    o.objectType = UIGObjectTypeImage;
    
    
    return o;
}
#pragma mark - transforming verts

-(void)changeVerts:(CGFloat*)points{
    [self removeAllPoints];
    self.verts = points;
    [self moveToPoint:CGPointMake(points[0], points[1])];
    for (int i = 1; points[i*2] != END; i++) {
        int pos = i*2;
        [self addLineToPoint:CGPointMake(points[pos], points[pos+1])];
    }
    [self closePath];
    [self.containerView setNeedsDisplay];
}
-(void)updateVerts{
    [self changeVerts:self.verts];
}

-(void)attackVert:(int)vertNum doing:(enum toby)doing with:(CGPoint)with{
    int pos = vertNum*2;
    switch (doing) {
        case to:
            self.verts[pos]=with.x;
            self.verts[pos+1]=with.y;
            break;
        case by:
            self.verts[pos]+=with.x;
            self.verts[pos+1]+=with.y;
            break;
            
        default:
            break;
    }
}

-(void)setBaseColor:(UIColor*)bc{
    const float *c = CGColorGetComponents([bc CGColor]);
    if(CGColorGetNumberOfComponents([bc CGColor]) == 4){
        self.baseRed = c[0];
        self.baseGreen = c[1];
        self.baseBlue = c[2];
        self.baseAlpha = c[3];
    }
    else if(CGColorGetNumberOfComponents([bc CGColor]) == 2) {
        self.baseRed = self.baseGreen = self.baseBlue = c[2];
        self.baseAlpha = c[3];
    }
    else self.baseRed = self.baseGreen = self.baseBlue = self.baseAlpha = 1.0;
}

@end
