//
//  ScheduleViewController.h
//  thePitApp
//
//  Created by David Rice on 10/25/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "ScheduledClassEvent.h"
#import "CalenderDetailController.h"

@interface ScheduleViewController : UIViewController 
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkMon10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *pjMon11;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wres;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openMon3;


//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;
@property (strong, nonatomic) IBOutlet UIView *container;
- (IBAction)eventTap:(id)sender;

@end
