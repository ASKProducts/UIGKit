//
//  UIGViewController.m
//  UIGKit
//
//  Created by stephen kaufer on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGViewController.h"
#import "UIGObject.h"
#import "UIGView.h"

CGSize resizeBasedOnScale(CGSize size,CGSize prevScreenSize,CGSize currentScreenSize){
    CGSize new;
    new.width = size.width * (currentScreenSize.width/prevScreenSize.width);
    new.height = size.height * (currentScreenSize.height/prevScreenSize.height);
    return new;
}

CGSize resizeAndKeepAspectRatio(CGSize size,float prevScreenSize,float currentScreenSize){
    CGSize new;
    new.width = size.width * (currentScreenSize/prevScreenSize);
    new.height = size.height * (currentScreenSize/prevScreenSize);
    return new;
}

CGPoint resizePointBasedOnScale(CGPoint point,CGSize prevScreenSize,CGSize currentScreenSize){
    CGPoint new;
    new.x = point.x * (currentScreenSize.width/prevScreenSize.width);
    new.y = point.y * (currentScreenSize.height/prevScreenSize.height);
    return new;
}

CGPoint resizePointAndKeepAspectRatio(CGPoint point,float prevScreenSize,float currentScreenSize){
    CGPoint new;
    new.x = point.x * (currentScreenSize/prevScreenSize);
    new.y = point.y * (currentScreenSize/prevScreenSize);
    return new;
}

CGFloat resizeNumberBasedOnScale(CGFloat num,CGFloat prev,CGFloat current){
    CGFloat new;
    new = num * (current/prev);
    return new;
}

@implementation UIGViewController
@synthesize graphicsView;
-(id)init{
    self = [super init];
    UIGView *gv = [[UIGView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [gv setFrame:CGRectMake(gv.frame.origin.x, gv.frame.origin.y, gv.frame.size.width, gv.frame.size.height-20)];
    self.graphicsView = gv;
    [self.view addSubview:self.graphicsView];
    [self.graphicsView setBackgroundColor:[UIColor lightGrayColor]];
    self.graphicsView.autoresizingMask = UIGViewAutoResizingSize;
    return self;
}
/*
 -(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
 [self.graphicsView removeFromSuperview];
 //self.graphicsView.frame = [[UIScreen mainScreen] applicationFrame];
 if([[UIApplication sharedApplication] isStatusBarHidden])
 self.graphicsView.bounds = CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.height, [[UIScreen mainScreen] applicationFrame].size.width);
 else
 self.graphicsView.bounds = CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.height+20, [[UIScreen mainScreen] applicationFrame].size.width-20);
 [self.view addSubview:self.graphicsView];
 
 //[self.graphicsView setNeedsDisplay];
 }
 */
@end
