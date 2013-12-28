//
//  Word.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "Word.h"

@implementation Word

@synthesize words_id = _words_id;
@synthesize japanese = _japanese;
@synthesize dutch = _dutch;
@synthesize english = _english;
@synthesize grade = _grade;
@synthesize givenanswer = _givenanswer;

-(id)initWithWordsId:(int)words_id japanese:(NSString *)japanese dutch:(NSString *)dutch english:(NSString *)english grade:(int)grade {
    
    if (self = [super init]) {
        self.words_id = words_id;
        self.japanese = japanese;
        self.dutch = dutch;
        self.english = english;
        self.grade = grade;
        self.givenanswer = @"";
    }
    return self;
}

@end
