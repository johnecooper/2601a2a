//
//  main.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventHandler.h"
#import "Reactor.h"
#import "Event.h"

@interface LoginHandler : NSObject  <EventHandler>
@end
@implementation LoginHandler
-(void)handleEvent:(Event*) e{
    NSLog(@"Login Event Handled");
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        LoginHandler *h = [[LoginHandler alloc]init];
        Reactor *r = [[Reactor alloc ]init];
        [r registerHandler:(EventHandler*)h forType:@"login"];
        
        Event* e = [[Event alloc]initWithType:@"login"];
        [r dispatch:e];
        
       // NSLog(@"Hello, World!");
        
    }
    return 0;
}

