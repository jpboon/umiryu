//
//  History.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

@property (assign, nonatomic, readwrite) int history_id;
@property (copy, nonatomic, readwrite) NSString *username;
@property (copy, nonatomic, readwrite) NSString *date;
@property (assign, nonatomic, readwrite) int score;
@property (assign, nonatomic, readwrite) int grade;
@property (assign, nonatomic, readwrite) int subgrades;

- (id) initWithHistoryUsername: (NSString *)username
                          date: (NSString *)date
                         score: (int)score
                         grade: (int)grade
                     subgrades: (int)subgrades;

@end
