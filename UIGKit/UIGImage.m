//
//  UIGImage.m
//  UIGKit
//
//  Created by stephen kaufer on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGImage.h"

@implementation UIGImage
@synthesize image;
-(id)initWithImage:(UIImage *)aimage{
    self = [super initWithFrame:CGRectMake(0, 0, [aimage size].width, [aimage size].height)];
    self.image = aimage;
    self.offscreenStatus = UIGOffscreenStatusAllow;
    self.backgroundColor = [UIColor clearColor];
    return self;
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self.image drawInRect:rect];
}
@end
