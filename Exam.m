//
//  Exam.m
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "Exam.h"

@implementation Exam

@synthesize grade = _grade;
@synthesize feets = _feets;
@synthesize words = _words;
@synthesize kihon = _kihon;
@synthesize subs = _subs;


-(id)initWithFeets:(BOOL)feets kihon:(BOOL)kihon words:(BOOL)words subs:(BOOL)subs {
    if (self = [super init]) {
        self.grade = 0;
        self.feets = feets;
        self.words = words;
        self.kihon = kihon;
        self.subs = subs;
    }
    return self;
}


@end
