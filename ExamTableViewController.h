//
//  ExamTableViewController.h
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exam.h"

@interface ExamTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *belts;
@property (nonatomic, strong) Exam *exam;

@end
