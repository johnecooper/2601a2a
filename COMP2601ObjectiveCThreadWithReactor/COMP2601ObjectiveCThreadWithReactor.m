//
//  COMP2601ObjectiveCThreadWithReactor.m
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-17.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import "COMP2601ObjectiveCThreadWithReactor.h"

@implementation COMP2601ObjectiveCThreadWithReactor
-(id)init{
    self=[super init];
    if(self){
        reactor = [[ReactorThread alloc]init];
    }
    return self;
}
@end
