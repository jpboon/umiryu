//
//  Exam.h
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exam : NSObject

@property (assign, nonatomic) int grade;
@property (assign, nonatomic) BOOL kihon;
@property (assign, nonatomic) BOOL words;
@property (assign, nonatomic) BOOL feets;
@property (assign, nonatomic) BOOL subs;

- (id)initWithFeets:(BOOL)feets kihon:(BOOL)kihon words:(BOOL)words subs:(BOOL)subs;

@end
