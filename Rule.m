//
//  Rule.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "Rule.h"

@implementation Rule

@synthesize rules_id = _rules_id;
@synthesize dutch = _dutch;
@synthesize english = _english;

-(id)initWithRulesId:(int)rules_id dutch:(NSString *)dutch english:(NSString *)english {
    
    if (self = [super init]) {
        self.rules_id = rules_id;
        self.dutch = dutch;
        self.english = english;
    }
    return self;
}

@end
