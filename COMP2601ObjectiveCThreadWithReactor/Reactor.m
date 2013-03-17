//
//  Reactor.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import "Reactor.h"
#import "NoEventHandler.h"



@implementation Reactor
-(id)init{
#ifdef VERBOSE
    NSLog(@"Reactor Initalised");
#endif
    self = [super init];
    if(self){
        map = [[NSMutableDictionary alloc]init];
    }
    return self;
}
-(void)registerHandler:(EventHandler*)handler forType:(NSString*)type{
#ifdef VERBOSE
    NSLog(@"HandlerRegistered");
#endif
    [map setObject:handler forKey:type];
}
-(void)deregisterHandler:(NSString*)type{
    [map removeObjectForKey:type];
}
-(void)dispatch:(Event*)e{
#ifdef VERBOSE
    NSLog(@"Event Dispatched");
#endif
    id h = [map objectForKey:[e getType]];
    if(h!=NULL){
        if([h conformsToProtocol:@protocol(EventHandler)]){
#ifdef VERBOSE
            NSLog(@"Handler conforms to EventHandler Protocol");
#endif
            [h handleEvent:e];
        }
        else{
#ifdef VERBOSE
            NSLog(@"Passed Handler does not conform to EventHandler Protocol");
#endif
            ;//Throw a tantrum //TODO
        }
    }
    else{
#ifdef VERBOSE
        NSLog(@"No Event Handler Found: Raising an exception");
#endif
        //TODO
      //  NoEventHandler *h;
      //[h raise];
    }
}
@end
