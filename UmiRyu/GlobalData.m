//
//  GlobalData.m
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

static GlobalData *shared = NULL;

@synthesize currentUser;

-(id)init {
    if (self = [super init]) {
        self.currentUser = [[User alloc]init];
    }
    return self;
}

+(GlobalData *) sharedData {
    @synchronized(shared) {
        if (!shared || shared == NULL) {
            shared = [[GlobalData alloc]init];
        }
        return shared;
    }
}

@end
