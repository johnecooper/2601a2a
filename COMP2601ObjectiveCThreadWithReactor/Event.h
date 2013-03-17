//
//  Event.h
//  COMP2601ObjectiveCThreadWithReactor
//
//  Created by infinitas on 2013-03-16.
//  Copyright (c) 2013 John Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
{
    @private
NSString* type;
NSMutableDictionary* map;
}
-(NSString*) getType;
-(id) initWithType:(NSString*)t;
-(void) setType:(NSString*) s;
-(void) put:(id)value at:(NSString*) key;
-(id)get:(NSString*)key;
@end


