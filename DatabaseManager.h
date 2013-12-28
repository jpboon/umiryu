//
//  DatabaseManager.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseManager : NSObject

+(void) updateQuery: (NSString *) sql;
+(FMResultSet *) executeQuery: (NSString *) sql;
+(void) openConnection;
+(void) closeConnection;

@end
