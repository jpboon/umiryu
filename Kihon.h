//
//  Kihon.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Kihon : NSObject

@property (assign, nonatomic, readwrite) int kihon_id;
@property (copy, nonatomic, readwrite) NSString *imagename;
@property (copy, nonatomic, readwrite) NSString *name;
@property (assign, nonatomic, readwrite) int grade;
@property (copy, nonatomic, readwrite) NSString *givenanswer;

- (id) initWithKihonId: (int)kihon_id
             imagename: (NSString *)imagename
                  name: (NSString *)name
                 grade: (int)grade;

@end
