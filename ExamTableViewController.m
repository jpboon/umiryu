//
//  ExamTableViewController.m
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "ExamTableViewController.h"
#import "ExamViewController.h"

@interface ExamTableViewController ()

@end

@implementation ExamTableViewController

@synthesize exam;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"examSegue"]) {
        // send data to next viewcontroller
        Exam *newExam = exam;
        
        ExamViewController *evc = [segue destinationViewController];
        NSString *tmpstr = [self.belts objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        newExam.grade = [tmpstr substringToIndex:1].intValue;
        evc.exam = newExam;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // create array with imagenames of belts
    self.belts = [[NSArray alloc] initWithObjects:@"8.jpg",@"7.jpg",@"6.jpg",@"5.jpg",@"4.jpg",@"3.jpg", nil];
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
    return self.belts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *currentImage = [self.belts objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:currentImage];
    
    return cell;
}

@end
