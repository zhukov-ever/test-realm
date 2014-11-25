//
//  Cat.m
//  test-realm
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import "Cat.h"

@implementation Cat
@synthesize newPropAgain = _newPropAgain;

-(NSString *)newPropAgain
{
    @synchronized(self) {
        if (!_newPropAgain)
        {
            _newPropAgain = @"";
        }
        return _newPropAgain;
    }
}

-(void)setNewPropAgain:(NSString *)newPropAgain
{
    @synchronized(self) {
        _newPropAgain = newPropAgain;
    }
}

@end
