//
//  CatsManager.h
//  test-realm
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMResults.h"
#import "Cat.h"

@interface CatsManager : NSObject

+(CatsManager*) shared;

- (void) addRandomCat;
- (void) changeCatRandomly:(Cat*)cat;
- (void) removeCatAtIndex:(NSInteger)index;

@property (nonatomic, readonly) RLMResults* catsSet;

@end
