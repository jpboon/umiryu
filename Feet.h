//
//  Feet.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feet : NSObject

@property (assign, nonatomic, readwrite) int feets_id;
@property (copy, nonatomic, readwrite) NSString *imagename;
@property (copy, nonatomic, readwrite) NSString *name;
@property (assign, nonatomic, readwrite) int grade;
@property (copy, nonatomic, readwrite) NSString *givenanswer;

- (id) initWithFeetsId: (int)feets_id
             imagename: (NSString *)imagename
                  name: (NSString *)name
                 grade: (int)grade;

@end
