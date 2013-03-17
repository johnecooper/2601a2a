//
//  ReactorInterface.h
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventHandler.h"
#import "Event.h"
@class EventHandler;
@protocol ReactorInterface <NSObject>
-(void)registerHandler:(EventHandler*)handler forType:(NSString*)type;
-(void)deregisterHandler:(NSString*)type;
-(void)dispatch:(Event*) e;
@end
