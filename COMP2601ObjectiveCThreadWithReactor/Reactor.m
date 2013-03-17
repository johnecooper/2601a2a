//
//  Reactor.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import "Reactor.h"
#import "NoEventHandler.h"
#import "Definitions.h"


@implementation Reactor
-(id)init{
#ifdef VERBOSE
    NSLog(@"Reactor: Initalised");
#endif
    self = [super init];
    if(self){
        map = [[NSMutableDictionary alloc]init];
    }
    return self;
}
-(void)registerHandler:(EventHandler*)handler forType:(NSString*)type{
#ifdef VERBOSE
    NSLog(@"Reactor: HandlerRegistered");
#endif
    [map setObject:handler forKey:type];
}
-(void)deregisterHandler:(NSString*)type{
    [map removeObjectForKey:type];
}
-(Boolean)dispatch:(Event*)e{
#ifdef VERBOSE
    NSLog(@"Reactor: Event Dispatched");
#endif
    id h = [map objectForKey:[e getType]];
    if(h!=NULL){
        if([h conformsToProtocol:@protocol(EventHandler)]){
#ifdef VERBOSE
            NSLog(@"Reactor: Handler conforms to EventHandler Protocol");
#endif
            [h handleEvent:e];
            return true;
        }
        else{
#ifdef VERBOSE
            NSLog(@"Reactor: Passed Handler does not conform to EventHandler Protocol");
#endif
            NSException * e = [NSException exceptionWithName:@"BadHandlerProtocol" reason:@"Found handler does not comply with handler protocol." userInfo:nil];
            @try{
                [e raise];
            }
            @catch(NSException* e){
                return false;
            }

        }
    }
    else{
#ifdef VERBOSE
        NSLog(@"Reactor: No Event Handler Found: Returning Null");
#endif
       
        /*
         //After a lot of research and learning how NSExceptions should only be used on fatal errors I decided to use the more common practive of returning false instead. 
         //Raising the Exception leaves little room for recoverability, and this is certinly a recoverable error.   
         //Also, I couldn't get the parent to catch the thrown exception.
        */
        NSException * e = [NoEventHandler exceptionWithName:@"NoEventHandler" reason:@"No handler found for  passed event." userInfo:nil];
       @try{
           [e raise];
        }
        @catch(NoEventHandler* e){
            return false;
        }
    
        
    }
}
@end
