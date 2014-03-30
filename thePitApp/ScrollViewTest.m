//
//  ScrollViewTest.m
//  thePitApp
//
//  Created by David Rice on 3/29/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import "ScrollViewTest.h"

@interface ScrollViewTest ()<UIScrollViewDelegate>

@end

@implementation ScrollViewTest


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //_theScroller.contentSize = CGSizeMake(2000.0, 3000.0);
    [self.theScroller addSubview:self.container];
    self.theScroller.minimumZoomScale = 0.5;
    self.theScroller.maximumZoomScale = 3.0;
    self.theScroller.delegate = self;
    self.theScroller.contentSize = self.container.bounds.size;
    // Do any additional setup after loading the view.
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.container;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
