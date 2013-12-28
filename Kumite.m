//
//  Kumite.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "Kumite.h"

@implementation Kumite

@synthesize kumite_id = _kumite_id;
@synthesize kumitesequence = _kumitesequence;
@synthesize imagename = _imagename;
@synthesize attack = _attack;
@synthesize defend = _defend;

-(id)initWithKumiteId:(int)kumite_id kumitesequence:(int)kumitesequence imagename:(NSString *)imagename attack:(NSString *)attack defend:(NSString *)defend {
    
    if (self = [super init]) {
        self.kumite_id = kumite_id;
        self.kumitesequence = kumitesequence;
        self.imagename = imagename;
        self.attack = attack;
        self.defend = defend;
    }
    return self;    
}

@end
