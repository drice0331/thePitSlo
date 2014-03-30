//
//  ScheduleViewContainer.h
//  thePitApp
//
//  Created by David Rice on 3/29/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "ScheduledClassEvent.h"

@interface ScheduleViewContainer : UIViewController
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkMon10;

@end
