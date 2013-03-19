//
//  UIGPixelBoard.m
//  UIGPixelBoardTest
//
//  Created by stephen kaufer on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGPixelBoard.h"

@implementation UIGPixelBoard
@synthesize pixels,gridSize,touched,delegate;
-(UIGPixelBoard*)initWithSize:(CGSize)boardSize andGridDimensions:(CGSize)gridDimensions andDefaultPixel:(UIGPixel*)defaultP{
    
    UIGPixel *mainPixel = [UIGPixel pixelWithSize:boardSize andColor:UIGColor(0,0,0,0) andOutline:0];
    UIGPixelBoard *p = [[UIGPixelBoard alloc] initWithBaseObject:mainPixel];
    
    p.pixels = [NSMutableArray arrayWithCapacity:gridDimensions.width*gridDimensions.height];
    
    for(int y = 0;y<gridDimensions.height;y++){
        for (int x = 0;x<gridDimensions.width; x++) {
            UIGPixel *pi = [UIGPixel pixelWithSize:CGSizeMake(boardSize.width/gridDimensions.width, boardSize.height/gridDimensions.height) andColor:UIGColor(defaultP.baseRed, defaultP.baseGreen, defaultP.baseBlue, defaultP.baseAlpha) andOutline:defaultP.outlined];
            CGSize pixSize = CGSizeMake(boardSize.width/gridDimensions.width,boardSize.height/gridDimensions.height);
            CGFloat piVerts[] = {
                pixSize.width*x,pixSize.height*y,
                pixSize.width*x+pixSize.width,pixSize.height*y,
                pixSize.width*x+pixSize.width,pixSize.height*y+pixSize.height,
                pixSize.width*x,pixSize.height*y+pixSize.height,
                END
                
            };
            // NSLog(@"\n%f,%f,\n%f,%f,\n%f,%f,\n%f,%f,\n",piVerts[0],piVerts[1],piVerts[2],piVerts[3],piVerts[4],piVerts[5],piVerts[6],piVerts[7]);
            [pi changeVerts:piVerts];
            [p.pixels addObject:pi];
            [p addUIGObject:pi];
            
        }
    }
    [p setOffscreenStatus:UIGOffscreenStatusAllow];
    p.gridSize = gridDimensions;
    return p;
    //UIGColor(defaultP.baseRed, defaultP.baseGreen, defaultP.baseBlue, defaultP.baseAlpha)
}
-(UIGPixel*)pixelAtCoord:(CGPoint)coord{
    return (UIGPixel*)[self.pixels objectAtIndex:coord.y*self.gridSize.width+coord.x];
}
- (void)drawRect:(CGRect)rect
{
    for (UIGPixel *o in self.pixels) {
        //[o updateVerts];
        //NSLog(@"%f,%f,%f,%f",o.baseRed,o.baseGreen,o.baseBlue,o.baseAlpha);
        [[UIColor colorWithRed:o.baseRed green:o.baseGreen blue:o.baseBlue alpha:o.baseAlpha] setFill];
        [[UIColor colorWithRed:o.outlineRed green:o.outlineGreen blue:o.outlineBlue alpha:o.outlineAlpha] setStroke];
        [o fill];
        [o stroke];
    }
}
-(void)redraw{
    [self setNeedsDisplay];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.touched = [NSMutableArray array];
    CGPoint po = [[touches anyObject] locationInView:self];
    if(!CGRectContainsPoint(self.bounds, po))return;
    for (UIGObject *p in self.pixels) {
        if([p containsPoint:po]){
            
            [self.touched addObject:p];
            
        }
    }
    if([(UITouch*)[event.allTouches anyObject] phase] == UITouchPhaseBegan)
        [delegate touchesBegan:touches withEvent:event];
    if([(UITouch*)[event.allTouches anyObject] phase] == UITouchPhaseMoved)
        [delegate touchesMoved:touches withEvent:event];
    if([(UITouch*)[event.allTouches anyObject] phase] == UITouchPhaseEnded)
        [delegate touchesEnded:touches withEvent:event];
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan:touches withEvent:event];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan:touches withEvent:event];
}
@end
