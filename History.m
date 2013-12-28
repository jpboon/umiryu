//
//  History.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "History.h"

@implementation History

@synthesize username = _username;
@synthesize date = _date;
@synthesize score = _score;
@synthesize grade = _grade;
@synthesize subgrades = _subgrades;

-(id)initWithHistoryUsername:(NSString *)username date:(NSString *)date score:(int)score grade:(int)grade subgrades:(int)subgrades {
    
    if (self = [super init]) {
        self.username = username;
        self.date = date;
        self.score = score;
        self.grade = grade;
        self.subgrades = subgrades;
    }
    return self;
}

@end
