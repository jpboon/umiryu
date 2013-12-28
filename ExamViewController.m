//
//  ExamViewController.m
//  UmiRyu
//
//  Created by johan on 12/11/13.
//  Copyright (c) 2013 Johan Boon. All rights reserved.
//

#import "ExamViewController.h"
#import "QueryManager.h"
#import "GlobalData.h"

@interface ExamViewController () {
    NSMutableArray *kihonArray;
    NSMutableArray *wordArray;
    NSMutableArray *feetArray;
    Kihon *currentKihon;
    Word *currentWord;
    Feet *currentFeet;
    int currentKihonIndex;
    int currentWordIndex;
    int currentFeetIndex;
    NSString *language;
    ExamState thisExam;
}

-(void) setNextState;
-(void) saveScore;

@end

@implementation ExamViewController

@synthesize exam,imageView,txtAnswer,btnEndExam,lblWords,lblExplain,lblTopExplain,btnCheat;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [btnEndExam setTitle:NSLocalizedString(@"EINDEXAMEN", nil)];
    [btnCheat setTitle:NSLocalizedString(@"VALSSPELEN", nil)];
    
    // set first enum state
    thisExam = start;
    
    //get language
    language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    // set swipe gestures to imageView
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognized:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    // init exam arrays
    kihonArray = [[NSMutableArray alloc]init];
    wordArray = [[NSMutableArray alloc]init];
    feetArray = [[NSMutableArray alloc]init];
    
    // get exam data
    if (exam.kihon) {
        kihonArray = [QueryManager getKihonsFromGrade:exam.grade withSubGrades:exam.subs];
        currentKihonIndex = 0;
    }
    if (exam.words) {
        wordArray = [QueryManager getWordsFromGrade:exam.grade withSubGrades:exam.subs];
        currentWordIndex = 0;
    }
    if (exam.feets) {
        feetArray = [QueryManager getFeetsFromGrade:exam.grade withSubGrades:exam.subs];
        currentFeetIndex = 0;
    }
    
    // start exam
    lblExplain.text = NSLocalizedString(@"UITLEGEXAMEN", nil);
    
    
}

-(void)swipeRecognized:(UISwipeGestureRecognizer *) swipe {
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {

        // set textcolor back to black after cheat
        self.txtAnswer.textColor = [UIColor blackColor];
        
        switch (thisExam) {
            case start:
                // hide explain label
                lblExplain.hidden = true;
        
                // show textfield
                txtAnswer.hidden = false;
        
                // assign firstresponder to textfield
                [self.txtAnswer becomeFirstResponder];
                
                // set next state
                [self setNextState];
                
                break;
            case kihon:
                if (currentKihonIndex < kihonArray.count-1) {
                    // save answer
                    currentKihon.givenanswer = self.txtAnswer.text;
                    [kihonArray replaceObjectAtIndex:currentKihonIndex withObject:currentKihon];
                    // clear textfield
                    self.txtAnswer.text = @"";
                    // next image
                    currentKihonIndex++;
                    currentKihon = [kihonArray objectAtIndex:currentKihonIndex];
                    NSString *imgName = currentKihon.imagename;
                    self.imageView.image = [UIImage imageNamed:imgName];
                } else if (currentKihon > 0) {
                    // save last answer
                    currentKihon.givenanswer = self.txtAnswer.text;
                    [kihonArray replaceObjectAtIndex:currentKihonIndex withObject:currentKihon];
                    // clear textfield
                    self.txtAnswer.text = @"";
                    //set next state
                    [self setNextState];
                }
                break;
            case words:
                if (currentWordIndex < wordArray.count-1) {
                    // save answer
                    currentWord.givenanswer = self.txtAnswer.text;
                    [wordArray replaceObjectAtIndex:currentWordIndex withObject:currentWord];
                    // clear textfield
                    self.txtAnswer.text = @"";
                    // next word
                    currentWordIndex++;
                    currentWord = [wordArray objectAtIndex:currentWordIndex];
                    if ([language isEqualToString:@"nl"]) {
                        lblWords.text = currentWord.dutch;
                    } else {
                        lblWords.text = currentWord.english;
                    }
                } else if (currentWord > 0) {
                    // save last answer
                    currentWord.givenanswer = self.txtAnswer.text;
                    [wordArray replaceObjectAtIndex:currentWordIndex withObject:currentWord];
                    // clear textfield
                    self.txtAnswer.text = @"";
                    //set next state
                    [self setNextState];
                }
                break;
            case feets:
                if (currentFeetIndex < feetArray.count-1) {
                    // save answer
                    currentFeet.givenanswer = self.txtAnswer.text;
                    [feetArray replaceObjectAtIndex:currentFeetIndex withObject:currentFeet];
                    // clear textfield
                    self.txtAnswer.text = @"";
                    // next image
                    currentFeetIndex++;
                    currentFeet = [feetArray objectAtIndex:currentFeetIndex];
                    NSString *imgName = currentFeet.imagename;
                    self.imageView.image = [UIImage imageNamed:imgName];
                } else if (currentFeet > 0) {
                    // save last answer
                    currentFeet.givenanswer = self.txtAnswer.text;
                    [feetArray replaceObjectAtIndex:currentFeetIndex withObject:currentFeet];
                    // clear textfield
                    self.txtAnswer.text = @"";
                    //set next state
                    [self setNextState];
                }
                break;
            case end: break;
                
        }
    }
 }

-(void)setNextState {
    
    switch (thisExam + 1) {
        case kihon:
            if (exam.kihon) {
                // set state
                thisExam = kihon;
                // set explanation text
                lblTopExplain.text = NSLocalizedString(@"UITLEGKIHON", nil);
                
                // show first image
                currentKihon = [kihonArray objectAtIndex:currentKihonIndex];
                NSString *imgName = currentKihon.imagename;
                self.imageView.image = [UIImage imageNamed:imgName];
                break;
            }
        case words:
            if (exam.words) {
                // set state
                thisExam = words;
                // set explanation text
                lblTopExplain.text = NSLocalizedString(@"UITLEGWOORD", nil);
                // hide image view
                self.imageView.hidden = true;
                // show first word
                currentWord = [wordArray objectAtIndex:currentWordIndex];
                if ([language isEqualToString:@"nl"]) {
                    lblWords.text = currentWord.dutch;
                } else {
                    lblWords.text = currentWord.english;
                }
                break;
            }
        case feets:
            if (exam.feets) {
                // set state
                thisExam = feets;
                // set explanation text
                lblTopExplain.text = NSLocalizedString(@"UITLEGVOET", nil);
                // unhide image view
                self.imageView.hidden = false;
                // hide word label
                self.lblWords.hidden = true;
                // show first image
                currentFeet = [feetArray objectAtIndex:currentFeetIndex];
                NSString *imgName = currentFeet.imagename;
                self.imageView.image = [UIImage imageNamed:imgName];
                break;
            }
        case end:
            // set state
            thisExam = end;
            // hide/disable objects
            self.txtAnswer.enabled = false;
            self.txtAnswer.hidden = true;
            self.lblWords.hidden = true;
            self.imageView.hidden = true;
            self.lblTopExplain.hidden = true;
            // show explain label
            self.lblExplain.hidden = false;
            self.lblExplain.text = NSLocalizedString(@"DRUKEINDEXAMEN", nil);
            break;
    }
}

-(void)saveScore {
    float points = 0;
    float maximumPoints;
    float score;
    
    // get maximum points to score
    maximumPoints = kihonArray.count + wordArray.count + feetArray.count;
    
    // score on kihon
    for (Kihon *kihon in kihonArray) {
        if ([kihon.name isEqualToString:kihon.givenanswer.lowercaseString]) {
            points++;
        }
    }
    
    // score on words
    for (Word *word in wordArray) {
        if ([word.japanese isEqualToString:word.givenanswer.lowercaseString]) {
            points++;
        }
    }
    
    //score on feets
    for (Feet *feet in feetArray) {
        if ([feet.name isEqualToString:feet.givenanswer.lowercaseString]) {
            points++;
        }
    }
    
    // calculate score
    score = points / (maximumPoints/100);
    
    // get current date
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    NSString *currentDate = [format stringFromDate:[NSDate date]];
    
    // get global data
    GlobalData *gd = [GlobalData sharedData];
    
    // create history object
    History *newHistory = [[History alloc] initWithHistoryUsername:gd.currentUser.username
                                                              date:currentDate
                                                             score:score
                                                             grade:exam.grade
                                                         subgrades:exam.subs];
    
    // save to database
    [QueryManager saveHistory:newHistory];
    
}

- (IBAction)btnEndExam:(id)sender {
    
    [self saveScore];
    
    // remove firstresponder from textfield
    [self.txtAnswer resignFirstResponder];
    
    // go to view
    [self performSegueWithIdentifier:@"2ndHistorySegue" sender:sender];
}
- (IBAction)btnCheat:(id)sender {
    self.txtAnswer.textColor = [UIColor redColor];
    switch (thisExam) {
        case start:break;
        case kihon:
            self.txtAnswer.text = currentKihon.name;
            break;
        case words:
            self.txtAnswer.text = currentWord.japanese;
            break;
        case feets:
            self.txtAnswer.text = currentFeet.name;
            break;
        case end:break;
    }
}
@end
