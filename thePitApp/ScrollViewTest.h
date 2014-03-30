//
//  ScrollViewTest.h
//  thePitApp
//
//  Created by David Rice on 3/29/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewTest : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *theScroller;
@property (strong, nonatomic) IBOutlet UIView *container;

@end
