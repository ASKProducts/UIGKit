//
//  UIGPixelBoard.h
//  UIGPixelBoardTest
//
//  Created by stephen kaufer on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGSprite.h"
#import "UIGPixel.h"
#import "UIGViewController.h"
@interface UIGPixelBoard : UIGSprite
@property(nonatomic,strong)NSMutableArray *pixels;
@property(nonatomic,assign)CGSize gridSize;
@property(nonatomic,strong)NSMutableArray *touched;
@property(nonatomic,strong)UIGViewController *delegate;
-(UIGPixelBoard*)initWithSize:(CGSize)boardSize andGridDimensions:(CGSize)gridDimensions andDefaultPixel:(UIGPixel*)defaultP;
-(UIGPixel*)pixelAtCoord:(CGPoint)coord;
-(void)redraw;
//-(void)setTouchHandler:(NSObject<UIGTouchHandler>*)handler;
@end
