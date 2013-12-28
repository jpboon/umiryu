//
//  LoginViewController.m
//  UmiRyu
//
//  Created by johan on 12/10/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "LoginViewController.h"
#import "QueryManager.h"
#import "GlobalData.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize txtUsername,txtPassword,btnLogin,btnRegister;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // textfield and button titles
	txtUsername.placeholder = NSLocalizedString(@"GEBRUIKERSNAAM", nil);
    txtPassword.placeholder = NSLocalizedString(@"WACHTWOORD", nil);
    [btnLogin setTitle:NSLocalizedString(@"INLOGGEN", nil) forState:UIControlStateNormal];
    [btnRegister setTitle:NSLocalizedString(@"AANMELDEN", nil) forState:UIControlStateNormal];
    // show keyboard
    [txtUsername becomeFirstResponder];
}

- (IBAction)btnLogin:(id)sender {
    // get user
    User *usr = [QueryManager getUser:txtUsername.text];
    
    // check if username not null
    if (usr.username) {
        // check password
        if ([txtPassword.text isEqualToString:usr.password]) {
            // set currentUser
            GlobalData *gd = [GlobalData sharedData];
            gd.currentUser = usr;
            // go to view
            [self performSegueWithIdentifier:@"loginSegue" sender:sender];
        } else {
            // wrong password alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"FOUTPW", nil)
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }      
    } else {
        // user doesn't exist alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"FOUTUSER", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        txtUsername.text = @"";
    }
    txtPassword.text = @"";
    
}


@end
