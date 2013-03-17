//
//  EventSource.h
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@protocol EventSource <NSObject>
    -(Event) getEvent;
@end
