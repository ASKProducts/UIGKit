//
//  UIGTouchableSprite.h
//  UIGButtonMaker
//
//  Created by stephen kaufer on 1/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIGSprite.h"
#import "UIGTouchReciever.h"
@interface UIGTouchableSprite : UIGSprite
@property(nonatomic,retain)NSObject<UIGTouchReciever>* touchReciever;
-(id)initWithTouchReciever:(NSObject<UIGTouchReciever>*)reciever;
-(id)initWithBaseObject:(UIGObject *)baseObject andTouchReciever:(NSObject<UIGTouchReciever>*)reciever;
@end
