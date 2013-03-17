//
//  main.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "EventHandler.h"
#import "ReactorThread.h"
#import "Event.h"
#import "Definitions.h"

@interface LoginHandler : NSObject  <EventHandler>
@end
@implementation LoginHandler
-(void)handleEvent:(Event*) e{
    NSLog(@"Login Event Handled");
}
@end

@interface TestHandler : NSObject <EventHandler>
@end
@implementation TestHandler
    -(void)handleEvent:(Event*)e{
        NSLog(@"Test Event Handler Called");
    }
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        LoginHandler *lH = [[LoginHandler alloc]init];
        TestHandler *tH = [[TestHandler alloc]init];
        
        ReactorThread *r = [[ReactorThread alloc ]init];
        [r registerHandler:(EventHandler*)lH forType:@"login"];
        [r registerHandler:(EventHandler*)tH forType:@"test"];
        
        Event* e1 = [[Event alloc]initWithType:@"test"];
        Event* e2 = [[Event alloc]initWithType:@"login"];
        Event* e3 = [[Event alloc]initWithType:@"test"];
        
        [r dispatch:e1];
        [r dispatch:e2];
        [r dispatch:e3];

    }
    return 0;
}

