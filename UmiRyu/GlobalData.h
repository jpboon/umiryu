//
//  GlobalData.h
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface GlobalData : NSObject {
    User *currentUser;
}

@property (nonatomic, strong) User *currentUser;

+(GlobalData *) sharedData;

@end
