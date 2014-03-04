//
//  DocumentDetailViewController.m
//  thePitApp
//[==========
//  Created by David Rice on 1/8/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import "DocumentDetailViewController.h"

@interface DocumentDetailViewController ()
{
    NSData *pdfData;
}
@end

@implementation DocumentDetailViewController

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
	// Do any additional setup after loading the view.
    /*NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];*/

    NSString *p = self.docName;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:p ofType:@"pdf"];
    NSURL *myURL = [NSURL fileURLWithPath:path];

    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.pdfWebview loadRequest:request];
    
    _pdfWebview.scalesPageToFit = YES;
    
    pdfData = [NSData dataWithContentsOfFile:path];
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Share"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(shareDocument:)];
    self.navigationItem.rightBarButtonItem = shareButton;

    
    [super viewDidLoad];
}

-(IBAction)shareDocument: (id)sender
{
    NSArray* dataToShare = [[NSArray alloc] initWithObjects:pdfData, nil];  //data to share
    
    UIActivityViewController* activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:dataToShare
                                     applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
