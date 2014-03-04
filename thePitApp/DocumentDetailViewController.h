//
//  DocumentDetailViewController.h
//  thePitApp
//
//  Created by David Rice on 1/8/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentDetailViewController : UIViewController

@property (strong, nonatomic) NSArray *classInfo;
@property (strong, nonatomic) NSString *docName;
@property (strong, nonatomic) IBOutlet UIWebView *pdfWebview;

@end
