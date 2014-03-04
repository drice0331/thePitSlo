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
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkMon10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wres;
//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;

@end
