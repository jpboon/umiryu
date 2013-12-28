//
//  RegisterViewController.m
//  UmiRyu
//
//  Created by johan on 12/10/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "RegisterViewController.h"
#import "GlobalData.h"
#import "QueryManager.h"
#import "User.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize txtUsername,txtPassword,txtFirstname,txtLastname,lblRegister,btnSave;

- (void)viewDidLoad
{
    [super viewDidLoad];
    txtUsername.placeholder = NSLocalizedString(@"GEBRUIKERSNAAM", nil);
    txtPassword.placeholder = NSLocalizedString(@"WACHTWOORD", nil);
    txtFirstname.placeholder = NSLocalizedString(@"VOORNAAM", nil);
    txtLastname.placeholder = NSLocalizedString(@"ACHTERNAAM", nil);
    lblRegister.text = NSLocalizedString(@"AANMELDEN", nil);
    [btnSave setTitle:NSLocalizedString(@"OPSLAAN", nil) forState:UIControlStateNormal];
}


- (IBAction)btnSave:(id)sender {
    // get user
    User *usr = [QueryManager getUser:txtUsername.text];
    
    // check fields are filled
    if ([txtUsername.text isEqualToString:@""] ||
        [txtPassword.text isEqualToString:@""] ||
        [txtLastname.text isEqualToString:@""] ||
        [txtFirstname.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"VELDLEEG", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    // check username exists
    } else if (usr.username) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"INGEBRUIK", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        // create new user
        User *newUser = [[User alloc] initWithUsername:txtUsername.text
                                             firstname:txtFirstname.text
                                              lastname:txtLastname.text
                                              password:txtPassword.text];
        // save new user
        [QueryManager addUser:newUser];
        
        // set currentUser
        GlobalData *gd = [GlobalData sharedData];
        gd.currentUser = newUser;
        
        // go to view
        [self performSegueWithIdentifier:@"registerSegue" sender:sender];
    }
}


@end
