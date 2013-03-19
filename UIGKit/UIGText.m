//
//  UIGText.m
//  UIGCollisionTest
//
//  Created by stephen kaufer on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGText.h"
#import "UIGObject.h"

@implementation UIGText
@synthesize text,fontSize,red,green,blue,alpha,alignment,fontName;
+(id)textWithText:(NSString*)text andSize:(float)size andColor:(UIColor*)color andAlignment:(UITextAlignment)alignment{
    UIGText *t = [[UIGText alloc] init];
    [t setText:text];
    [t setFontSize:size];
    const float *c = CGColorGetComponents([color CGColor]);
    if(CGColorGetNumberOfComponents([color CGColor]) == 4){
        t.red = c[0];
        t.green = c[1];
        t.blue = c[2];
        t.alpha = c[3];
    }
    else if(CGColorGetNumberOfComponents([color CGColor]) == 2) {
        t.red = t.green = t.blue = c[2];
        t.alpha = c[3];
    }
    else t.red = t.green = t.blue = t.alpha = 1.0;
    [t setAlignment:alignment];
    [t setFontName:@"Helvetica"];
    [t setBackgroundColor:[UIColor clearColor]];
    t.offscreenStatus = UIGOffscreenStatusAllow;
    return t;
}
+(id)textWithText:(NSString*)text andSize:(float)size{
    return [self textWithText:text andSize:size andColor:UIGColor(0.0, 0.0, 0.0, 1.0) andAlignment:UITextAlignmentLeft];
}
+(id)textWithText:(NSString*)text{
    return [self textWithText:text andSize:17.0];
}
+(id)text{
    return [self textWithText:@""];
}

-(void)setColor:(UIColor*)color{
    const float *c = CGColorGetComponents([color CGColor]);
    if(CGColorGetNumberOfComponents([color CGColor]) == 4){
        self.red = c[0];
        self.green = c[1];
        self.blue = c[2];
        self.alpha = c[3];
    }
    else if(CGColorGetNumberOfComponents([color CGColor]) == 2) {
        self.red = self.green = self.blue = c[2];
        self.alpha = c[3];
    }
    else self.red = self.green = self.blue = self.alpha = 1.0;
    [self updateView];
}

-(void)drawRect:(CGRect)rect{
    [UIGColor(red, green, blue, alpha) setFill];
    [self.text drawInRect:rect withFont:[UIFont fontWithName:self.fontName size:self.fontSize] lineBreakMode:UILineBreakModeTailTruncation alignment:self.alignment];
}

-(void)setText:(NSString *)newText{
    text = newText;
    [self updateView];
}

-(void)updateView{
    [self setNeedsDisplay];
}
@end
