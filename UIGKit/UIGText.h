//
//  UIGText.h
//  UIGCollisionTest
//
//  Created by stephen kaufer on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGSprite.h"

@interface UIGText : UIGSprite
@property(nonatomic,strong)NSString *text;
@property(nonatomic)float fontSize;
@property(nonatomic)float red,green,blue,alpha;
@property(nonatomic)UITextAlignment alignment;
@property(nonatomic,strong)NSString *fontName;
+(id)textWithText:(NSString*)text andSize:(float)size andColor:(UIColor*)color andAlignment:(UITextAlignment)alignment;
+(id)textWithText:(NSString*)text andSize:(float)size;
+(id)textWithText:(NSString*)text;
+(id)text;
-(void)setColor:(UIColor*)new;
-(void)updateView;
@end
