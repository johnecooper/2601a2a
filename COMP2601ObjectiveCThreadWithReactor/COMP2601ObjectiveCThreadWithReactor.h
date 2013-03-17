//
//  COMP2601ObjectiveCThreadWithReactor.h
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-17.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

//Maybe I misunderstood this class, but the instructions were vauge... Basically a blank holder for a ReactorThread

#import <Foundation/Foundation.h>
#import "ReactorThread.h"

@class ReactorThread;

@interface COMP2601ObjectiveCThreadWithReactor : NSObject{
    ReactorThread * reactor;
}

@end
