//
//  ReactorThread.h
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactorInterface.h"
#import "Reactor.h"
#import "EventSource.h"
#import "Definitions.h"

@class EventSource;
@interface ReactorThread : NSObject <ReactorInterface>{
    Boolean running;
    id eventSource;
    Reactor *reactor;
}
-(id)init;
-(id)initWithSource:(EventSource*)s;
-(void)quit;
-(void)run;
-(void)registerHandler:(EventHandler *)handler forType:(NSString *)type;
-(void)deregisterHandler:(NSString *)type;
-(void)dispatch:(Event *)e;
@end
