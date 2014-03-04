//
//  ProgressViewController.m
//  thePitApp
//
//  Created by David Rice on 1/11/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import "ProgressViewController.h"

#import "BeltProgressTableController.h"

@interface ProgressViewController ()

@end

@implementation ProgressViewController

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
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BeltProgressTableController *bptc = [segue destinationViewController];
    bptc.beltType = [segue identifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
