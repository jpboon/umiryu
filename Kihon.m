//
//  Kihon.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "Kihon.h"

@implementation Kihon

@synthesize kihon_id = _kihon_id;
@synthesize imagename = _imagename;
@synthesize name = _name;
@synthesize grade = _grade;
@synthesize givenanswer = _givenanswer;

-(id)initWithKihonId:(int)kihon_id imagename:(NSString *)imagename name:(NSString *)name grade:(int)grade {
    if (self = [super init]) {
        self.kihon_id = kihon_id;
        self.imagename = imagename;
        self.name = name;
        self.grade = grade;
        self.givenanswer = @"";
    }
    return self;
}

@end
