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
    // private property
    NSArray *historyArray;
}

@end

@implementation HistoryTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // get global data
    GlobalData *gd = [GlobalData sharedData];

    // get history from database
    historyArray = [[NSArray alloc] initWithArray:
                    [QueryManager getHistoryFromUser:gd.currentUser.username]];
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
    return historyArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    // first cell
    if (indexPath.row == 0) {
        static NSString *TopCellIdentifier = @"TopCell";
        cell = [tableView dequeueReusableCellWithIdentifier:TopCellIdentifier forIndexPath:indexPath];
    
    // all other cells
    } else {
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        // connect objects to objects in cell
        UILabel *lblGrade = (UILabel *) [cell viewWithTag:1];
        UILabel *lblDate = (UILabel *) [cell viewWithTag:2];
        UILabel *lblScore = (UILabel *) [cell viewWithTag:3];
        UIImageView *imgSubs = (UIImageView *) [cell viewWithTag:4];
        
        // get history object
        History *history = [historyArray objectAtIndex:indexPath.row -1];
        
        // add text to labels
        lblGrade.text = [[NSString alloc]initWithFormat:@"%d Kyu", history.grade];
        lblDate.text = history.date;
        lblScore.text = [[NSString alloc]initWithFormat:@"%d", history.score];
        
        // add image to cell image
        if (history.subgrades == 0) {
            imgSubs.image = [UIImage imageNamed:@"false.jpg"];
        } else {
            imgSubs.image = [UIImage imageNamed:@"true.jpg"];
        }
    }
    
    return cell;
}

@end
