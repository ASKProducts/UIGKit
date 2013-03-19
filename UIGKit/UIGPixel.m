//
//  UIGPixel.m
//  UIGPixelBoardTest
//
//  Created by stephen kaufer on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGPixel.h"

@implementation UIGPixel
@synthesize pixelSize,outlined;
+(UIGPixel*)pixelWithSize:(CGSize)pixelSize andColor:(UIColor*)bc andOutline:(CGFloat)ow{
    CGFloat points[] = {
        0,0,
        pixelSize.width,0,
        pixelSize.width,pixelSize.height,
        0,pixelSize.height,
        END
    };
   /* UIGPixel *p = (UIGPixel*)[UIGPixel graphicsObjectWithPoints:verts andBaseColor:bc andOutlineColor:UIGColor(0.0, 0.0, 0.0, 1.0) andOutlineWidth:ow];
   // [(UIGPixel*)p setOutlined:ow];
   // [(UIGPixel*)p setPixelSize:pixelSize];
    */
    UIGPixel *o = [[UIGPixel alloc] init];
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

    o.outlineRed = o.outlineGreen = o.outlineBlue = 0.0;
    o.outlineAlpha = 1.0;
    
    o.lineWidth = ow;
    if(points==nil)return o;
    o.verts = points;
    [o moveToPoint:CGPointMake(points[0], points[1])];
    for (int i = 1; points[i*2] != END; i++) {
        int pos = i*2;
        [o addLineToPoint:CGPointMake(points[pos], points[pos+1])];
    }
    [o closePath];
    [(UIGPixel*)o setOutlined:ow];
    [(UIGPixel*)o setPixelSize:pixelSize];
    [o setObjectType:UIGObjectTypeVertex];
    return o;
}
@end
