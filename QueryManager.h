//
//  queryManager.h
//  project3
//
//  Created by johan on 12/9/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseManager.h"
#import "User.h"
#import "Kihon.h"
#import "Word.h"
#import "Feet.h"
#import "History.h"
#import "Rule.h"

@interface QueryManager : NSObject

+(User *)getUser:(NSString *)username;
+(void)addUser:(User *)user;
+(void)changePassword:(NSString *)password ofUser:(NSString *)username;
+(NSMutableArray *)getKihonsFromGrade:(int)grade withSubGrades:(BOOL)subGrades;
+(void)saveHistory:(History *)history;
+(NSArray *)getHistoryFromUser:(NSString *)username;
+(NSMutableArray *)getWordsFromGrade:(int)grade withSubGrades:(BOOL)subGrades;
+(NSMutableArray *)getFeetsFromGrade:(int)grade withSubGrades:(BOOL)subGrades;
+(NSArray *)getRules;

@end
