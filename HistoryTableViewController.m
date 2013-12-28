//
//  HistoryTableViewController.m
//  UmiRyu
//
//  Created by johan on 12/14/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "QueryManager.h"
#import "GlobalData.h"
#import "History.h"

@interface HistoryTableViewController () {
    NSArray *historyArray;
}

@end

@implementation HistoryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // get global data
    GlobalData *gd = [GlobalData sharedData];

    // get history from database
    historyArray = [[NSArray alloc] initWithArray:
                    [QueryManager getHistoryFromUser:gd.currentUser.username]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return historyArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        static NSString *TopCellIdentifier = @"TopCell";
        cell = [tableView dequeueReusableCellWithIdentifier:TopCellIdentifier forIndexPath:indexPath];
 
    } else {
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        
        UILabel *lblGrade = (UILabel *) [cell viewWithTag:1];
        UILabel *lblDate = (UILabel *) [cell viewWithTag:2];
        UILabel *lblScore = (UILabel *) [cell viewWithTag:3];
        UIImageView *imgSubs = (UIImageView *) [cell viewWithTag:4];
        
        History *history = [historyArray objectAtIndex:indexPath.row -1];
        lblGrade.text = [[NSString alloc]initWithFormat:@"%d Kyu", history.grade];
        lblDate.text = history.date;
        lblScore.text = [[NSString alloc]initWithFormat:@"%d", history.score];
        
        if (history.subgrades == 0) {
            imgSubs.image = [UIImage imageNamed:@"false.jpg"];
        } else {
            imgSubs.image = [UIImage imageNamed:@"true.jpg"];
        }
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
