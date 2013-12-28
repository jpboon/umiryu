//
//  Word.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (assign, nonatomic, readwrite) int words_id;
@property (copy, nonatomic, readwrite) NSString *japanese;
@property (copy, nonatomic, readwrite) NSString *dutch;
@property (copy, nonatomic, readwrite) NSString *english;
@property (assign, nonatomic, readwrite) int grade;
@property (copy, nonatomic, readwrite) NSString *givenanswer;

- (id) initWithWordsId: (int)words_id
              japanese: (NSString *)japanese
                 dutch: (NSString *)dutch
               english: (NSString *)english
                 grade: (int)grade;


@end
