//
//  UserViewController.m
//  UmiRyu
//
//  Created by johan on 12/9/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "UserViewController.h"
#import "ExamTableViewController.h"
#import "Exam.h"

@interface UserViewController ()

@end

@implementation UserViewController

@synthesize btnHistory,btnRules,btnStartExam,lblFeets,lblSubGrades,lblWords,swFeets,swKihon,swSubgrades,swWords,btnLogout;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // button and label titles
    [btnHistory setTitle:NSLocalizedString(@"HISTORIE", nil) forState:UIControlStateNormal];
    [btnRules setTitle:NSLocalizedString(@"REGELS", nil) forState:UIControlStateNormal];
    [btnStartExam setTitle:NSLocalizedString(@"STARTEXAMEN", nil) forState:UIControlStateNormal];
    [btnLogout setTitle:NSLocalizedString(@"UITLOGGEN", nil)];
    lblWords.text = NSLocalizedString(@"WOORDEN", nil);
    lblFeets.text = NSLocalizedString(@"VOETSTANDEN", nil);
    lblSubGrades.text = NSLocalizedString(@"LAGEREGRADATIES", nil);

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"examTableSegue"]) {
        // send data to next viewcontroller
        ExamTableViewController *etvc = (ExamTableViewController *)[[segue destinationViewController]topViewController];
        
        Exam *newExam = [[Exam alloc]initWithFeets:swFeets.isOn kihon:swKihon.isOn words:swWords.isOn subs:swSubgrades.isOn];
        etvc.exam = newExam;
    }
}

- (IBAction)btnStartExam:(id)sender {
    
    if (swFeets.isOn == FALSE && swKihon.isOn == FALSE && swWords.isOn == FALSE) {
        // alert if not one selection is selected
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"MINIMUMSELECTIE", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        // go to view
        [self performSegueWithIdentifier:@"examTableSegue" sender:sender];
    }
    

}

- (IBAction)btnRules:(id)sender {
    // go to view
    [self performSegueWithIdentifier:@"rulesSegue" sender:sender];
}
@end
