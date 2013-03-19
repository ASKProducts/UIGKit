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
