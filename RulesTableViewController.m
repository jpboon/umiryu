//
//  RulesTableViewController.m
//  UmiRyu
//
//  Created by johan on 12/22/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "RulesTableViewController.h"
#import "QueryManager.h"

@interface RulesTableViewController () {
    // private properties
    NSArray *rulesArray;
    NSString *language;
}

@end

@implementation RulesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // get rules
    rulesArray = [[NSArray alloc] initWithArray:[QueryManager getRules]];

    //get language
    language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section
    return rulesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // get rule object
    Rule *currentRule = [rulesArray objectAtIndex:indexPath.row];
    
    // connect object to object in cell
    UILabel *lblRule = (UILabel *) [cell viewWithTag:1];
    
    // add text to label
    if ([language isEqualToString:@"nl"]) {
        lblRule.text = currentRule.dutch;
    } else {
        lblRule.text = currentRule.english;
    }
    
    return cell;
}

- (IBAction)btnDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
