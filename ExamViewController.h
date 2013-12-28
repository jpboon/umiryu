//
//  ExamViewController.h
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exam.h"

@interface ExamViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnEndExam;
@property (weak, nonatomic) IBOutlet UILabel *lblWords;
@property (weak, nonatomic) IBOutlet UILabel *lblExplain;
@property (weak, nonatomic) IBOutlet UILabel *lblTopExplain;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCheat;
@property (nonatomic, strong) Exam *exam;

- (IBAction)btnCheat:(id)sender;
- (IBAction)btnEndExam:(id)sender;

typedef enum {
    start,
    kihon,
    words,
    feets,
    end
} ExamState;

@end
