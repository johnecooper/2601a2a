//
//  NoEventHandler.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import "NoEventHandler.h"

@implementation NoEventHandler
-(void)raise{
    NSException *e;
    e=[NSException exceptionWithName:@"No Event Handler Exception" reason:@"No handler for the event was found." userInfo:nil];
    [e raise];
    
}

@end
