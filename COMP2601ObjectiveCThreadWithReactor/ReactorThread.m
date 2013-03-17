//
//  ReactorThread.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import "ReactorThread.h"
#import "NoEventHandler.h"

@implementation ReactorThread
-(id)init{
    self = [super init];
    if (self){
#ifdef VERBOSE
        NSLog(@"ReactorThread: Initalised");
#endif
        running=false;
        reactor = [[Reactor alloc]init];
    }
    return self;
}
-(id)initWithSource:(EventSource*)s{
    self = [super init];
    if (self){
#ifdef VERBOSE
    NSLog(@"ReactorThread: Initalised");
#endif
    eventSource=s;
    running=false;
    reactor = [[Reactor alloc]init];
    }
    return self;
}
-(void)quit{
#ifdef VERBOSE
    NSLog(@"ReactorThread: Quit");
#endif
    running=false;
}
-(void)run{
#ifdef VERBOSE
    NSLog(@"ReactorThread: Running");
#endif
    running=true;
    while(running){
        Event *e = [eventSource getEvent];
        if(e!=NULL){
            if(![reactor dispatch:e]){
                    //Error Handling
            #ifdef VERBOSE
                NSLog(@"ReactorThread: Handle Failed.");
            #endif
#ifdef QUIT_ON_HANDLE_ERROR
                NSLog(@"Break On handle Error defined, stopping run.");
                running=false;
                break;
#endif
            }
        }
    }
}
-(void)registerHandler:(EventHandler *)handler forType:(NSString *)type;{
#ifdef VERBOSE
    NSLog(@"ReactorThread: Handler Registered");
#endif
    [reactor registerHandler:handler forType:type];
}
-(void)deregisterHandler:(NSString *)type{
    [reactor deregisterHandler:type];
}
-(void)dispatch:(Event *)e{
#ifdef VERBOSE
    NSLog(@"ReactorThread: Event Dispatched");
#endif
    [reactor dispatch:e];
}
@end
