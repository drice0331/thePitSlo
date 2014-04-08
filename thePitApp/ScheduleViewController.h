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
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *mon1;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *mon12;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *mon2;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openMon3;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openMon330;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *kidsMon4;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *lev1Mon5;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkMon6;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *mon7;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *mon8;

@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkTues10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *tues11;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *tues12;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *tues1;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *tues2;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openTues3;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openTues330;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *lev2Tues4;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *grapTues5;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkTues6;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *pjTues7;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *tues8;

@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkWed10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *pjWed11;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wed12;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wed1;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wed2;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wed3;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *peeweeWed330;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *kidsWed4;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *lev1Wed5;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkWed6;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wresWed7;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *wed8;

@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkThurs10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *thurs11;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *thurs12;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *thurs1;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *thurs2;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openThurs3;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *openThurs330;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *lev2Thurs4;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *grapThurs5;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkThurs6;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *pjThurs7;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *thurs8;

@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkFri10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *pjFri11;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fri12;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fri1;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fri2;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fri3;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *peeweeFri330;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *kidsFri4;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *lev1Fri5;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkFri6;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *adSparFri7;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fri8;

@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat10;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *fkSat11;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *pjSat12;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sparSat1;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat3;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat330;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat4;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat5;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat6;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat7;
@property (weak, nonatomic) IBOutlet ScheduledClassEvent *sat8;

//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;
@property (strong, nonatomic) IBOutlet UIView *container;
- (IBAction)eventTap:(id)sender;

@end
