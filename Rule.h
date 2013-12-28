//
//  Rule.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rule : NSObject

@property (assign, nonatomic, readwrite) int rules_id;
@property (copy, nonatomic, readwrite) NSString *dutch;
@property (copy, nonatomic, readwrite) NSString *english;


- (id) initWithRulesId: (int)rules_id
                 dutch: (NSString *)dutch
               english: (NSString *)english;

@end
