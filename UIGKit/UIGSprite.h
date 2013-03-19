//
//  UIGSprite.h
//  UIGKit
//
//  Created by stephen kaufer on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIGView.h"

typedef enum{
    UIGOffscreenAbilityStay = 0,
    UIGOffscreenAbilityAllow,
    UIGOffscreenAbilityWrap
}UIGOffscreenAbility;
typedef enum{
    UIGWrapStatusNone = 0,
    UIGWrapStatusX,
    UIGWrapStatusY,
    UIGWrapStatusXY
}UIGWrapStatus;
typedef enum{
    UIGWrapAmountNone = 0,
    UIGWrapAmountHalf,
    UIGWrapAmountFull
}UIGWrapAmount;
typedef struct{
    UIGOffscreenAbility offscreenAbility;
    UIGWrapStatus wrapStatus;
    UIGWrapAmount wrapAmount;
}UIGOffscreenStatus;
#define offscreenStatusMake(ability,wrapStatus,wrapAmount) (UIGOffscreenStatus){ability,wrapStatus,wrapAmount}
#define UIGOffscreenStatusStay offscreenStatusMake(0,0,0)
#define UIGOffscreenStatusAllow offscreenStatusMake(1,0,0)
#define UIGOffscreenStatusWrap(direction,wrapAmount) offscreenStatusMake(2,UIGWrapStatus##direction,wrapAmount)
#define UIGOffscreenStatusWrapAll(wrapAmount) offscreenStatusMake(2,3,wrapAmount)

typedef CGFloat UIGSpeed; //pixelsPerSecond
#define pixelsPerSecond(pps) ((UIGSpeed)pps)
typedef CGFloat UIGDirection; // degrees
#define degrees(pps) ((UIGDirection)pps)


typedef struct{
    UIGSpeed speed;
    UIGDirection direction;
}UIGVelocity;
#define UIGVelocityMake(speed,direction) ((UIGVelocity){(speed),(direction)})

typedef struct{
    UIGSpeed speed;
    UIGDirection direction;
}UIGAcceleration;
#define UIGAccelerationMake(speed,direction) ((UIGAcceleration){pixelsPerSecond(speed),degrees(direction)})


@interface UIGSprite : UIGView
@property(assign,nonatomic)CGSize size;
@property(strong)UIGObject *baseObject;
@property(strong,nonatomic)NSMutableArray *colliders;
@property(nonatomic)UIGOffscreenStatus offscreenStatus;
/*
 @property(nonatomic)CGFloat direction; // degrees
 @property(nonatomic)CGFloat directionChange;
 @property(nonatomic)CGFloat speed; // pixels per seconds
 */
@property(nonatomic,readwrite)UIGVelocity velocity;
@property(nonatomic,readwrite)UIGAcceleration acceleration;

@property(nonatomic,getter = isMoving)BOOL moving;


-(id)initWithBaseObject:(UIGObject*)baseObject;
-(BOOL)collidesWith:(UIGSprite*)other;
-(BOOL)collidesWith:(UIGSprite *)other offset:(CGPoint)offset;

-(void)startMoving;
-(void)updatePosition;
-(void)stopMoving;

@end