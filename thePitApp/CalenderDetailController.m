//
//  CalenderDetailController.m
//  thePitApp
//
//  Created by David Rice on 12/9/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import "CalenderDetailController.h"

@interface CalenderDetailController ()

@end


@implementation CalenderDetailController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //label texts
    self.classNameLabel.text = [self.classInfo objectAtIndex:0];
    self.dayOfWeekLabel.text = [self.classInfo objectAtIndex:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
