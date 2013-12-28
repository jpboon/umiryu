//
//  User.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize username = _username;
@synthesize firstname = _firstname;
@synthesize lastname = _lastname;
@synthesize password = _password;

- (id) initWithUsername: (NSString *)username firstname: (NSString *)firstname lastname: (NSString *)lastname password: (NSString *)password{
    
    if (self = [super init]) {
        self.username = username;
        self.firstname = firstname;
        self.lastname = lastname;
        self.password = password;
    }
    return self;
}

@end
