//
//  UIGPixel.h
//  UIGPixelBoardTest
//
//  Created by stephen kaufer on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGObject.h"

@interface UIGPixel : UIGObject
@property(nonatomic,assign)CGSize pixelSize;
@property(nonatomic,assign)CGFloat outlined;
+(UIGPixel*)pixelWithSize:(CGSize)pixelSize andColor:(UIColor*)bc andOutline:(CGFloat)ow;
@end
