//
//  Kumite.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Kumite : NSObject

@property (assign, nonatomic, readwrite) int kumite_id;
@property (assign, nonatomic, readwrite) int kumitesequence;
@property (copy, nonatomic, readwrite) NSString *imagename;
@property (copy, nonatomic, readwrite) NSString *attack;
@property (copy, nonatomic, readwrite) NSString *defend;


- (id) initWithKumiteId: (int)kumite_id
         kumitesequence: (int)kumitesequence
              imagename: (NSString *)imagename
                 attack: (NSString *)attack
                 defend: (NSString *)defend;

@end
