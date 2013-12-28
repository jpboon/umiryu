//
//  DatabaseManager.m
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "DatabaseManager.h"

//static sqlite3 database
static FMDatabase *db;

@implementation DatabaseManager

// open DB connection
+(void) openConnection {
    
    // get doc dir path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *writablePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"umiryu.sqlite"];
    
    // get local sqlite file path
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"umiryu" ofType:@"sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *err;
    
    // copy local db to doc dir if not exists
    [fileManager copyItemAtPath:bundlePath toPath:writablePath error:&err];
    
    db = [FMDatabase databaseWithPath:writablePath];
    
    [db open];
}

// close DB connection
+(void) closeConnection {
    [db close];
}

// executes query without result
+(void) updateQuery: (NSString *) sql {
    [db executeUpdate:sql];
}

// executes query with result
+(FMResultSet *) executeQuery: (NSString *) sql {
   return [db executeQuery:sql];
}

@end
