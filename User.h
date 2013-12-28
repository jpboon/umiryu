//
//  User.h
//  project3
//
//  Created by johan on 12/4/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (copy, nonatomic, readwrite) NSString *username;
@property (copy, nonatomic, readwrite) NSString *firstname;
@property (copy, nonatomic, readwrite) NSString *lastname;
@property (copy, nonatomic, readwrite) NSString *password;

- (id) initWithUsername: (NSString *)username
              firstname: (NSString *)firstname
               lastname: (NSString *)lastname
               password: (NSString *)password;

@end
