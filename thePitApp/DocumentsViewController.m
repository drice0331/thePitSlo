//
//  DocumentsViewController.m
//  thePitApp
//
//  Created by David Rice on 1/8/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import "DocumentsViewController.h"

@interface DocumentsViewController ()

@end

@implementation DocumentsViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
     if([[segue identifier] isEqualToString:@"DocumentDetailSegue"])
     {
     NSLog(@"DocumentDetailSegue");
     //put introspection method before this
     UIButton *doclink = sender;
    
     NSString *docTitle = [NSString stringWithFormat:@"%@",[[doclink titleLabel] text]];
     
     //NSLog(docTitle);
         
     DocumentDetailViewController *ddvc = [segue destinationViewController];
     ddvc.docName = docTitle;
    }
}
     
@end
