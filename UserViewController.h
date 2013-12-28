//
//  UserViewController.h
//  UmiRyu
//
//  Created by johan on 12/9/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnStartExam;
@property (weak, nonatomic) IBOutlet UIButton *btnHistory;
@property (weak, nonatomic) IBOutlet UIButton *btnRules;
@property (weak, nonatomic) IBOutlet UILabel *lblWords;
@property (weak, nonatomic) IBOutlet UILabel *lblFeets;
@property (weak, nonatomic) IBOutlet UILabel *lblSubGrades;
@property (weak, nonatomic) IBOutlet UISwitch *swKihon;
@property (weak, nonatomic) IBOutlet UISwitch *swWords;
@property (weak, nonatomic) IBOutlet UISwitch *swFeets;
@property (weak, nonatomic) IBOutlet UISwitch *swSubgrades;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnLogout;

- (IBAction)btnStartExam:(id)sender;
- (IBAction)btnRules:(id)sender;


@end
