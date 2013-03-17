	//
//  Event.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import "Event.h"

@implementation Event

-(id)initWithType:(NSString*)t{
    self = [super init];
    if(self){
        type=t;
        map = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(NSString*) getType{
    return type;
}

-(void) setType:(NSString*) s{
    type=s;
}

-(void) put:(id)value at:(NSString*) key{
    [map setObject:value forKey:key];
}

-(id)get:(NSString*)key{
    return [map objectForKey:key];
}
@end
