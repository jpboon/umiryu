//
//  queryManager.m
//  project3
//
//  Created by johan on 12/9/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "QueryManager.h"

@implementation QueryManager

// get a set of rules
+(NSArray *)getRules {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM rules"];
    FMResultSet *result = [DatabaseManager executeQuery:sql];
    
    while ([result next]) {
        Rule *rule = [[Rule alloc]initWithRulesId:[result intForColumn:@"rules_id"]
                                             dutch:[result stringForColumn:@"dutch"]
                                           english:[result stringForColumn:@"english"]];
        [arr addObject:rule];
    }
    
    return arr;
}

// get a set of feetobjects
+(NSMutableArray *)getFeetsFromGrade:(int)grade withSubGrades:(BOOL)subGrades {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSString *withSubs;
    if (subGrades) {
        withSubs = @">=";
    } else {
        withSubs = @"=";
    }
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM feets WHERE grade %@ %d",withSubs, grade];
    FMResultSet *result = [DatabaseManager executeQuery:sql];
    
    while ([result next]) {
        Feet *feet = [[Feet alloc]initWithFeetsId:[result intForColumn:@"feets_id"]
                                        imagename:[result stringForColumn:@"imagename"]
                                             name:[result stringForColumn:@"name"]
                                            grade:[result intForColumn:@"grade"]];
        
        [arr addObject:feet];
    }
    return arr;
}

// get a set of wordobjects
+(NSMutableArray *)getWordsFromGrade:(int)grade withSubGrades:(BOOL)subGrades {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSString *withSubs;
    if (subGrades) {
        withSubs = @">=";
    } else {
        withSubs = @"=";
    }
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM words WHERE grade %@ %d",withSubs, grade];
    FMResultSet *result = [DatabaseManager executeQuery:sql];
    
    while ([result next]) {
        Word *word = [[Word alloc]initWithWordsId:[result intForColumn:@"words_id"]
                                         japanese:[result stringForColumn:@"japanese"]
                                            dutch:[result stringForColumn:@"dutch"]
                                          english:[result stringForColumn:@"english"]
                                            grade:[result intForColumn:@"grade"]];
        
        [arr addObject:word];
    }
    return arr;
}

// get history from a user
+(NSArray *)getHistoryFromUser:(NSString *)username {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM history WHERE username = '%@' ORDER BY history_id DESC LIMIT 15",username];
    FMResultSet *result = [DatabaseManager executeQuery:sql];
    
    while ([result next]) {
        History *history = [[History alloc] initWithHistoryUsername:username
                                                               date:[result stringForColumn:@"date"]
                                                              score:[result intForColumn:@"score"]
                                                              grade:[result intForColumn:@"grade"]
                                                          subgrades:[result intForColumn:@"subgrades"]];

        [arr addObject:history];
    }
    
    
    return arr;
}

// save a history object
+(void)saveHistory:(History *)history {
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO history ('username', 'date', 'score', 'grade', 'subgrades') VALUES ('%@', '%@', %d, %d, %d)", history.username, history.date, history.score, history.grade, history.subgrades];
    [DatabaseManager updateQuery:sql];
}

// get a set of kihonobjects
+(NSMutableArray *)getKihonsFromGrade:(int)grade withSubGrades:(BOOL)subGrades {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSString *withSubs;
    if (subGrades) {
        withSubs = @">=";
    } else {
        withSubs = @"=";
    }
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM kihon WHERE grade %@ %d",withSubs, grade];
    FMResultSet *result = [DatabaseManager executeQuery:sql];
    
    while ([result next]) {
        Kihon *kihon = [[Kihon alloc]initWithKihonId:[result intForColumn:@"kihon_id"]
                                           imagename:[result stringForColumn:@"imagename"]
                                                name:[result stringForColumn:@"name"]
                                               grade:[result intForColumn:@"grade"]];

        [arr addObject:kihon];
    }
    return arr;
}

// get a user
+(User *)getUser:(NSString *)username {
    
    NSString *sql = [NSString stringWithFormat: @"SELECT * FROM users WHERE username = '%@'", username];
    FMResultSet *result = [DatabaseManager executeQuery:sql];
  
    User *usr;
    while ([result next]) {
        usr = [[User alloc]initWithUsername:[result stringForColumn:@"username"]
                                        firstname:[result stringForColumn:@"firstname"]
                                         lastname:[result stringForColumn:@"lastname"]
                                         password:[result stringForColumn:@"password"]];
    }
    return usr;
}

// add a user
+(void)addUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO users ('username', 'firstname', 'lastname', 'password') VALUES ('%@', '%@', '%@', '%@')", user.username, user.firstname, user.lastname, user.password];
    [DatabaseManager updateQuery:sql];
}

// change password from a user
+(void)changePassword:(NSString *)password ofUser:(NSString *)username{
    NSString *sql = [NSString stringWithFormat:@"UPDATE users SET password = '%@' WHERE username = '%@'", password, username];
    [DatabaseManager updateQuery:sql];
}

@end
