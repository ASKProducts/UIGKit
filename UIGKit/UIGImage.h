//
//  UIGImage.h
//  UIGKit
//
//  Created by stephen kaufer on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGSprite.h"

@interface UIGImage : UIGSprite
@property(strong)UIImage *image;
-(id)initWithImage:(UIImage*)aimage;
@end
