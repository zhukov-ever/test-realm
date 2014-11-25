//
//  Cat.h
//  test-realm
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import "RLMObject.h"
#import "RLMArray.h"

@interface Cat : RLMObject

@property NSString* name;
@property NSInteger age;
@property BOOL hasOwner;
@property NSString* strangeProperty;
@property NSString* newPropAgain;

@end
