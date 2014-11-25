//
//  CatsManager.m
//  test-realm
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import "CatsManager.h"
#import "RLMRealm.h"
#import "RLMMigration.h"

@implementation CatsManager
{
    RLMRealm* m_realm;
}

static CatsManager* m_shared;
+(CatsManager*)shared
{
    if (!m_shared)
    {
        m_shared = [CatsManager new];
    }
    return m_shared;
}

-(id)init
{
    if (self = [super init])
    {
        [RLMRealm setSchemaVersion:4 withMigrationBlock:^(RLMMigration *migration, NSUInteger oldSchemaVersion) {
            
        }];
        m_realm = [RLMRealm defaultRealm];
    }
    return self;
}

- (void) changeCatRandomly:(Cat*)cat;
{
    [m_realm beginWriteTransaction];
    cat.name = [self randomCat].name;
    [m_realm commitWriteTransaction];
}

-(void) addRandomCat
{
    [m_realm beginWriteTransaction];
    [m_realm addObject:[self randomCat]];
    [m_realm commitWriteTransaction];
}

- (RLMResults *)catsSet
{
    return [Cat allObjects];
}


#pragma mark - private 

- (Cat*) randomCat
{
    Cat* _cat = [Cat new];
    _cat.name = [NSString stringWithFormat:@"cat_%d", rand()%100];
    _cat.hasOwner = rand()%2;
    _cat.age = (NSInteger)rand()%20;
    _cat.strangeProperty = @"STRRRRRANGE MIU";
    
    return _cat;
}

- (void) removeCatAtIndex:(NSInteger)index
{
    [m_realm beginWriteTransaction];
    [m_realm deleteObject:[self.catsSet objectAtIndex:index]];
    [m_realm commitWriteTransaction];
}

@end
