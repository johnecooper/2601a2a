//
//  main.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

//TestHarness: Tests the handling capabilities.



#import <Foundation/Foundation.h>
#import "EventHandler.h"
#import "ReactorThread.h"
#import "Event.h"
#import "Definitions.h"


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
        
        TestHandler *tH = [[TestHandler alloc]init];
        ReactorThread *r = [[ReactorThread alloc ]init];
        [r registerHandler:(EventHandler*)tH forType:@"test"];
        
        Event* e1 = [[Event alloc]initWithType:@"test"];
        
        [r dispatch:e1];

    }
    return 0;
}

