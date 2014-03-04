//
//  TwitterViewController.h
//  thePitApp
//
//  Created by David Rice on 10/29/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterViewController : UITableViewController <UITableViewDataSource>
{
    NSArray *facebookPosts;
}

-(void)fetchFacebookPosts;

@end
