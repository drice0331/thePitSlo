//
//  ScheduledClassEvent.h
//  thePitApp
//
//  Created by David Rice on 11/14/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ScheduledClassEvent : UIView

@property (nonatomic, strong) NSString* classEventName;
@property (nonatomic) NSUInteger dayOfTheWeek;
@property (nonatomic) NSUInteger startTime;
@property (nonatomic) NSUInteger endTime;

@property (nonatomic) BOOL clicked;

@property (nonatomic) UIViewContentMode contentMode;

- (void)tap:(UITapGestureRecognizer *)gesture;

@end
