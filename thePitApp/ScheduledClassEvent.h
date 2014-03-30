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

@interface ScheduledClassEvent : UIButton

@property (nonatomic, strong) NSString* classEventName;
@property (nonatomic, strong) UIColor* fillColor;
@property (nonatomic) NSUInteger dayOfTheWeek;
@property (nonatomic) NSUInteger startHour;
@property (nonatomic) NSUInteger endHour;
@property (nonatomic) NSUInteger startMinute;
@property (nonatomic) NSUInteger endMinute;

@property (nonatomic) BOOL clicked;

@property (nonatomic) UIViewContentMode contentMode;

@end
