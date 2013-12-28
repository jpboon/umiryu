//
//  Feet.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "Feet.h"

@implementation Feet

@synthesize feets_id = _feets_id;
@synthesize imagename = _imagename;
@synthesize name = _name;
@synthesize grade = _grade;
@synthesize givenanswer = _givenanswer;

-(id)initWithFeetsId:(int)feets_id imagename:(NSString *)imagename name:(NSString *)name grade:(int)grade {
    if (self = [super init]) {
        self.feets_id = feets_id;
        self.imagename = imagename;
        self.name = name;
        self.grade = grade;
        self.givenanswer = @"";
    }
    return self;
}

@end
