//
//  ScheduleViewController.m
//  thePitApp
//
//  Created by David Rice on 10/25/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import "ScheduleViewController.h"
//#import "ScheduledClassEvent.m"

@interface ScheduleViewController () <EKEventEditViewDelegate, UIScrollViewDelegate>

// EKEventStore instance associated with the current Calendar application
@property (nonatomic, strong) EKEventStore *eventStore;

// Default calendar associated with the above event store
@property (nonatomic, strong) EKCalendar *defaultCalendar;

// Array of all events happening within the next 24 hours
@property (nonatomic, strong) NSMutableArray *eventsList;

@end

@implementation ScheduleViewController

@synthesize fkMon10;
@synthesize pjMon11;
@synthesize mon12;
@synthesize mon1;
@synthesize mon2;
@synthesize openMon3;
@synthesize openMon330;
@synthesize kidsMon4;
@synthesize lev1Mon5;
@synthesize fkMon6;
@synthesize mon7;
@synthesize mon8;

@synthesize fkTues10;
@synthesize tues11;
@synthesize tues12;
@synthesize tues1;
@synthesize tues2;
@synthesize openTues3;
@synthesize openTues330;
@synthesize lev2Tues4;
@synthesize grapTues5;
@synthesize fkTues6;
@synthesize pjTues7;
@synthesize tues8;

@synthesize fkWed10;
@synthesize pjWed11;
@synthesize wed12;
@synthesize wed1;
@synthesize wed2;
@synthesize wed3;
@synthesize peeweeWed330;
@synthesize kidsWed4;
@synthesize lev1Wed5;
@synthesize fkWed6;
@synthesize wresWed7;
@synthesize wed8;

@synthesize fkThurs10;
@synthesize thurs11;
@synthesize thurs12;
@synthesize thurs1;
@synthesize thurs2;
@synthesize openThurs3;
@synthesize openThurs330;
@synthesize lev2Thurs4;
@synthesize grapThurs5;
@synthesize fkThurs6;
@synthesize pjThurs7;
@synthesize thurs8;

@synthesize fkFri10;
@synthesize pjFri11;
@synthesize fri12;
@synthesize fri1;
@synthesize fri2;
@synthesize fri3;
@synthesize peeweeFri330;
@synthesize kidsFri4;
@synthesize lev1Fri5;
@synthesize fkFri6;
@synthesize adSparFri7;
@synthesize fri8;

@synthesize sat10;
@synthesize fkSat11;
@synthesize pjSat12;
@synthesize sparSat1;
@synthesize sat3;
@synthesize sat330;
@synthesize sat4;
@synthesize sat5;
@synthesize sat6;
@synthesize sat7;
@synthesize sat8;

//@synthesize tap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //CGRect fullScreenRect=[[UIScreen mainScreen] applicationFrame];
    //self.scrollView = [[UIScrollView alloc] initWithFrame:fullScreenRect];
    [self.scrollView addSubview:self.container];
    self.scrollView.minimumZoomScale=1.0;
    self.scrollView.maximumZoomScale=4.0;
    //self.scrollView.contentSize=CGSizeMake(320, 758);
    self.scrollView.delegate=self;
    self.scrollView.contentSize = self.container.bounds.size;
    self.scrollView.scrollEnabled = true;
    //self.scrollView.contentInset=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
    //self.scrollView.contentSize = CGSizeMake(2480, 1960);
    
    //UIScrollView* sc = (UIScrollView*)self.scrollView;
    //sc.contentSize = sc.bounds.size;
    /*
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.view addGestureRecognizer:pinchGesture];
    */

    
    // Initialize the event store
	self.eventStore = [[EKEventStore alloc] init];
    // Initialize the events list
	self.eventsList = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    //Monday classes
    [fkMon10 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:2 andStartHour:10 andStartMinute:0 andEndHour:11 andEndMinute:0 andFillColor:[UIColor redColor]];
    [pjMon11 setWithClassName:@"Pit Jitsu" andDayOfTheWeek:2 andStartHour:11 andStartMinute:0 andEndHour:12 andEndMinute:0 andFillColor:[UIColor redColor]];
    [mon12 setWithClassName:@"Closed" andDayOfTheWeek:2 andStartHour:12 andStartMinute:0 andEndHour:13 andEndMinute:0 andFillColor:[UIColor redColor]];
    [mon1 setWithClassName:@"Closed" andDayOfTheWeek:2 andStartHour:13 andStartMinute:0 andEndHour:14 andEndMinute:0 andFillColor:[UIColor redColor]];
    [mon2 setWithClassName:@"Closed" andDayOfTheWeek:2 andStartHour:14 andStartMinute:0 andEndHour:15 andEndMinute:0 andFillColor:[UIColor redColor]];
    [openMon3 setWithClassName:@"Open Training" andDayOfTheWeek:2 andStartHour:15 andStartMinute:0 andEndHour:15 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [openMon330 setWithClassName:@"Open Training" andDayOfTheWeek:2 andStartHour:15 andStartMinute:30 andEndHour:16 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [kidsMon4 setWithClassName:@"Pit Kids" andDayOfTheWeek:2 andStartHour:16 andStartMinute:0 andEndHour:17 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [lev1Mon5 setWithClassName:@"Pit Level 1" andDayOfTheWeek:2 andStartHour:17 andStartMinute:0 andEndHour:18 andEndMinute:0 andFillColor:[UIColor redColor]];
    [fkMon6 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:2 andStartHour:18 andStartMinute:0 andEndHour:19 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [mon7 setWithClassName:@"Closed" andDayOfTheWeek:2 andStartHour:19 andStartMinute:0 andEndHour:20 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [mon8 setWithClassName:@"Closed" andDayOfTheWeek:2 andStartHour:20 andStartMinute:0 andEndHour:21 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    
    
    //Tuesday classes
    [fkTues10 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:3 andStartHour:10 andStartMinute:0 andEndHour:11 andEndMinute:0 andFillColor:[UIColor redColor]];
    [tues11 setWithClassName:@"Closed" andDayOfTheWeek:3 andStartHour:11 andStartMinute:0 andEndHour:12 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [tues12 setWithClassName:@"Closed" andDayOfTheWeek:3 andStartHour:12 andStartMinute:0 andEndHour:13 andEndMinute:0 andFillColor:[UIColor redColor]];
    [tues1 setWithClassName:@"Closed" andDayOfTheWeek:3 andStartHour:13 andStartMinute:0 andEndHour:14 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [tues2 setWithClassName:@"Closed" andDayOfTheWeek:3 andStartHour:14 andStartMinute:0 andEndHour:15 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [openTues3 setWithClassName:@"Open Training" andDayOfTheWeek:3 andStartHour:15 andStartMinute:0 andEndHour:15 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [openTues330 setWithClassName:@"Open Training" andDayOfTheWeek:3 andStartHour:15 andStartMinute:30 andEndHour:16 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [lev2Tues4 setWithClassName:@"Pit Level 2" andDayOfTheWeek:3 andStartHour:16 andStartMinute:0 andEndHour:17 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [grapTues5 setWithClassName:@"Grappling" andDayOfTheWeek:3 andStartHour:17 andStartMinute:0 andEndHour:18 andEndMinute:30 andFillColor:[UIColor redColor]];
    [fkTues6 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:3 andStartHour:18 andStartMinute:0 andEndHour:19 andEndMinute:0 andFillColor:[UIColor redColor]];
    [pjTues7 setWithClassName:@"Pit Jitsu" andDayOfTheWeek:3 andStartHour:19 andStartMinute:0 andEndHour:20 andEndMinute:0 andFillColor:[UIColor redColor]];
    [tues8 setWithClassName:@"Closed" andDayOfTheWeek:3 andStartHour:20 andStartMinute:0 andEndHour:21 andEndMinute:0 andFillColor:[UIColor redColor]];
    
    //Wednesday classes
    [fkWed10 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:4 andStartHour:10 andStartMinute:0 andEndHour:11 andEndMinute:0 andFillColor:[UIColor redColor]];
    [pjWed11 setWithClassName:@"Pit Jitsu" andDayOfTheWeek:4 andStartHour:11 andStartMinute:0 andEndHour:12 andEndMinute:0 andFillColor:[UIColor redColor]];
    [wed12 setWithClassName:@"Closed" andDayOfTheWeek:4 andStartHour:12 andStartMinute:0 andEndHour:13 andEndMinute:0 andFillColor:[UIColor redColor]];
    [wed1 setWithClassName:@"Closed" andDayOfTheWeek:4 andStartHour:13 andStartMinute:0 andEndHour:14 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [wed2 setWithClassName:@"Closed" andDayOfTheWeek:4 andStartHour:14 andStartMinute:0 andEndHour:15 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [wed3 setWithClassName:@"Closed" andDayOfTheWeek:4 andStartHour:15 andStartMinute:0 andEndHour:15 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [peeweeWed330 setWithClassName:@"Pit Peewee's" andDayOfTheWeek:4 andStartHour:15 andStartMinute:30 andEndHour:16 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [kidsWed4 setWithClassName:@"Pit Kids" andDayOfTheWeek:4 andStartHour:16 andStartMinute:0 andEndHour:17 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [lev1Wed5 setWithClassName:@"Pit Level 1" andDayOfTheWeek:4 andStartHour:17 andStartMinute:0 andEndHour:18 andEndMinute:0 andFillColor:[UIColor redColor]];
    [fkWed6 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:4 andStartHour:18 andStartMinute:0 andEndHour:19 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [wresWed7 setWithClassName:@"Wrestling" andDayOfTheWeek:4 andStartHour:19 andStartMinute:0 andEndHour:20 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [wed8 setWithClassName:@"Closed" andDayOfTheWeek:4 andStartHour:20 andStartMinute:0 andEndHour:21 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    
    //Thursday classes
    [fkThurs10 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:5 andStartHour:10 andStartMinute:0 andEndHour:11 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [thurs11 setWithClassName:@"Closed" andDayOfTheWeek:5 andStartHour:11 andStartMinute:0 andEndHour:12 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [thurs12 setWithClassName:@"Closed" andDayOfTheWeek:5 andStartHour:12 andStartMinute:0 andEndHour:13 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [thurs1 setWithClassName:@"Closed" andDayOfTheWeek:5 andStartHour:13 andStartMinute:0 andEndHour:14 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [thurs2 setWithClassName:@"Closed" andDayOfTheWeek:5 andStartHour:14 andStartMinute:0 andEndHour:15 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [openThurs3 setWithClassName:@"Open Training" andDayOfTheWeek:5 andStartHour:15 andStartMinute:0 andEndHour:15 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [openThurs330 setWithClassName:@"Open Training" andDayOfTheWeek:5 andStartHour:15 andStartMinute:30 andEndHour:16 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [lev2Thurs4 setWithClassName:@"Pit Level 2" andDayOfTheWeek:5 andStartHour:16 andStartMinute:0 andEndHour:17 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [grapThurs5 setWithClassName:@"Grappling" andDayOfTheWeek:5 andStartHour:17 andStartMinute:0 andEndHour:18 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [fkThurs6 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:5 andStartHour:18 andStartMinute:0 andEndHour:19 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [pjThurs7 setWithClassName:@"Pit Jitsu" andDayOfTheWeek:5 andStartHour:19 andStartMinute:0 andEndHour:20 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [thurs8 setWithClassName:@"Closed" andDayOfTheWeek:5 andStartHour:20 andStartMinute:0 andEndHour:21 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    
    //Friday classes
    [fkFri10 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:6 andStartHour:10 andStartMinute:0 andEndHour:11 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [pjFri11 setWithClassName:@"Pit Jitsu" andDayOfTheWeek:6 andStartHour:11 andStartMinute:0 andEndHour:12 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [fri12 setWithClassName:@"Closed" andDayOfTheWeek:6 andStartHour:12 andStartMinute:0 andEndHour:13 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [fri1 setWithClassName:@"Closed" andDayOfTheWeek:6 andStartHour:13 andStartMinute:0 andEndHour:14 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [fri2 setWithClassName:@"Closed" andDayOfTheWeek:6 andStartHour:14 andStartMinute:0 andEndHour:15 andEndMinute:0 andFillColor:[UIColor redColor]];
    [fri3 setWithClassName:@"Closed" andDayOfTheWeek:6 andStartHour:15 andStartMinute:0 andEndHour:15 andEndMinute:30 andFillColor:[UIColor redColor]];
    [peeweeFri330 setWithClassName:@"Pit Peewee's" andDayOfTheWeek:6 andStartHour:15 andStartMinute:30 andEndHour:16 andEndMinute:0 andFillColor:[UIColor redColor]];
    [kidsFri4 setWithClassName:@"Pit Kids" andDayOfTheWeek:6 andStartHour:16 andStartMinute:0 andEndHour:17 andEndMinute:0 andFillColor:[UIColor redColor]];
    [lev1Fri5 setWithClassName:@"Pit Level 1" andDayOfTheWeek:6 andStartHour:17 andStartMinute:0 andEndHour:18 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [fkFri6 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:6 andStartHour:18 andStartMinute:0 andEndHour:19 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [adSparFri7 setWithClassName:@"Adult Sparring" andDayOfTheWeek:6 andStartHour:19 andStartMinute:0 andEndHour:20 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [fri8 setWithClassName:@"Closed" andDayOfTheWeek:6 andStartHour:20 andStartMinute:0 andEndHour:21 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    
    //Saturday classes
    [sat10 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:10 andStartMinute:0 andEndHour:11 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [fkSat11 setWithClassName:@"Fitness Kickboxing" andDayOfTheWeek:7 andStartHour:11 andStartMinute:0 andEndHour:12 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [pjSat12 setWithClassName:@"Pit Jitsu" andDayOfTheWeek:7 andStartHour:12 andStartMinute:0 andEndHour:13 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sparSat1 setWithClassName:@"Beginning Sparring & Submission Wrestling" andDayOfTheWeek:7 andStartHour:13 andStartMinute:0 andEndHour:15 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sat3 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:15 andStartMinute:0 andEndHour:15 andEndMinute:30 andFillColor:[UIColor whiteColor]];
    [sat330 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:15 andStartMinute:30 andEndHour:16 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sat4 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:16 andStartMinute:0 andEndHour:17 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sat5 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:17 andStartMinute:0 andEndHour:18 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sat6 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:18 andStartMinute:0 andEndHour:19 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sat7 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:19 andStartMinute:0 andEndHour:20 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    [sat8 setWithClassName:@"Closed" andDayOfTheWeek:7 andStartHour:20 andStartMinute:0 andEndHour:21 andEndMinute:0 andFillColor:[UIColor whiteColor]];
    
    NSArray *events = [[NSArray alloc] initWithObjects:fkMon10, pjMon11, openMon3, openMon330, kidsMon4, lev1Mon5, fkMon6, fkTues10, openTues3, openTues330, lev2Tues4, grapTues5, fkTues6, pjTues7, fkWed10, pjWed11, peeweeWed330, kidsWed4, lev1Wed5, fkWed6, wresWed7, fkThurs10, openThurs3, openThurs330, lev2Thurs4,grapThurs5, fkThurs6, pjThurs7, fkFri10, pjFri11, peeweeFri330, kidsFri4, lev1Fri5, fkFri6, adSparFri7, fkSat11, pjSat12, sparSat1, nil];
    
    for(ScheduledClassEvent *e in events)
    {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
        tap.numberOfTapsRequired = 1;
        [tap setNumberOfTapsRequired:1];
        //[tap setNumberOfTouchesRequired:1];
    [e addGestureRecognizer:tap];
    }
    
    
        
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Check whether we are authorized to access Calendar
    [self checkEventStoreAccessForCalendar];
    //self.scrollView.contentSize = self.container.bounds.size;
    //self.scrollView.scrollEnabled = true;
    [self resetImageZoom];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self resetImageZoom];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self checkEventStoreAccessForCalendar];
}

//handler for tapgesturerecognizer
- (void)tapHandle:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"tap handle");
    
    ScheduledClassEvent *sce = gestureRecognizer.view;
    //if([gestureRecognizer.view isKindOfClass:[ScheduledClassEvent class]])
      //  {
            //sce = gestureRecognizer.view;
        //}
    
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
    {
    
        NSLog(@"access granted");
    EKEventEditViewController *addController = [[EKEventEditViewController alloc] init];
    
        EKEvent *e = [EKEvent eventWithEventStore:_eventStore];
        e.title = [sce classEventName];
        //e.startDate =
        //e.endDate =
        //NSDate *today = [NSDate date];
         //NSDateComponents *d =  [NSDateComponents init];
        //[d setHour:[sce startTime]];
        //[d setWeekday:[sce dayOfTheWeek]];
        // NSDateComponents to NSDate
        
        NSDate *today = [NSDate date];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        [gregorian setLocale:[NSLocale currentLocale]];
        
        NSDateComponents *nowComponents = [gregorian components:NSYearCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:today];
        NSDateComponents *eventComponents = [gregorian components:NSYearCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:today];
        
        NSLog(@"Todays weekday - %ld", (long)[nowComponents weekday]);
        
        
        [eventComponents setWeekday:[sce dayOfTheWeek]];
        [eventComponents setHour:[sce startHour]];
        [eventComponents setMinute:[sce startMinute]];
        [eventComponents setSecond:0];
        NSLog(@"Event weekday - %ld", (long)[eventComponents weekday]);

        //today later or same day in this week than event
        if([nowComponents weekday]  >= [eventComponents weekday])
        {
            //today is event day
            if([nowComponents weekday] == [eventComponents weekday])
            {
                //today's time (hour) greater than or equal to event's time (hour)
                if([nowComponents hour] >= [eventComponents hour])
                {
                    [eventComponents setWeek:([eventComponents week] + 1)];
                }
            }
            else
            {
                [eventComponents setWeek:([eventComponents week] + 1)];
            }
        }
        

        
        NSDate *beginningOfWeek = [gregorian dateFromComponents:eventComponents];
        
        NSLog(@"nowcomponents weekday - %lu", (long)[nowComponents weekday]);

        e.startDate = beginningOfWeek;
        
        [eventComponents setHour:[sce endHour]];
        [eventComponents setMinute:[sce endMinute]];
        NSDate *endOfWeek = [gregorian dateFromComponents:eventComponents];
        e.endDate = endOfWeek;
        e.location = @"The Pit SLO";
        
    addController.eventStore = self.eventStore;
        addController.event = e;
        
    addController.editViewDelegate = self;
    
    
    [self presentViewController:addController animated:YES completion:nil];
    }];
    //[self resetImageZoom];
    //[self performSegueWithIdentifier:@"calenderDetailSegue" sender:sce];
         
         
}


- (IBAction)addClassToCalender:(id)sender
{
    
    //event name
    //get day
    //get time start
    //get time end
    
    //[self createRecurringEventInLocalCalendar];
    
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
     {
         
         EKEventEditViewController *addController = [[EKEventEditViewController alloc] init];
         
         ScheduledClassEvent *sce = sender;
         addController.title = [sce classEventName];
         addController.eventStore = self.eventStore;
         EKEvent *e = [EKEvent eventWithEventStore:_eventStore];
         e.title = [sce classEventName];
         
         [self presentViewController:addController animated:YES completion:nil];
     }];
    

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 /*
    if([[segue identifier] isEqualToString:@"calenderDetailSegue"])
    {
        NSLog(@"calenderDetailSegue");
        NSLog(@"Bool value: %d",[sender isKindOfClass:[ScheduledClassEvent class]]);
        //put introspection method before this
        ScheduledClassEvent *s = sender;
        
        CalenderDetailController *cdc = [segue destinationViewController];
        
        cdc.classInfo = [[NSArray alloc] initWithObjects: [s classEventName], [[NSString alloc] initWithFormat:@"%lu",(unsigned long)[s dayOfTheWeek]], nil];
        //[[NSString alloc] initWithFormat:@"%lu",(unsigned long)[s dayOfTheWeek]],
    }
  */
    if ([[segue identifier] isEqualToString:@"showEventViewController"])
    {
        // Configure the destination event view controller
        EKEventViewController* eventViewController = (EKEventViewController *)[segue destinationViewController];
        // Fetch the index path associated with the selected event
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // Set the view controller to display the selected event
        //eventViewController.event = [self.eventsList objectAtIndex:indexPath.row];
        
        // Allow event editing
        eventViewController.allowsEditing = YES;
    }
    
}

#pragma mark -
#pragma mark Access Calendar
                
                // Check the authorization status of our application for Calendar
                -(void)checkEventStoreAccessForCalendar
                {
                    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
                    
                    switch (status)
                    {
                            // Update our UI if the user has granted access to their Calendar
                        case EKAuthorizationStatusAuthorized: [self accessGrantedForCalendar];
                            break;
                            // Prompt the user for access to Calendar if there is no definitive answer
                        case EKAuthorizationStatusNotDetermined: [self requestCalendarAccess];
                            break;
                            // Display a message if the user has denied or restricted access to Calendar
                        case EKAuthorizationStatusDenied:
                        case EKAuthorizationStatusRestricted:
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning" message:@"Permission was not granted for Calendar"
                                                                           delegate:nil
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles:nil];
                            [alert show];
                        }
                            break;
                        default:
                            break;
                    }
                }
                
                
                // Prompt the user for access to their Calendar
                -(void)requestCalendarAccess
                {
                    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
                     {
                         if (granted)
                         {
                             ScheduleViewController * __weak weakSelf = self;
                             // Let's ensure that our code will be executed from the main queue
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 // The user has granted access to their Calendar; let's populate our UI with all events occuring in the next 24 hours.
                                 [weakSelf accessGrantedForCalendar];
                             });
                         }
                     }];
                }
                
                
                // This method is called when the user has granted permission to Calendar
                -(void)accessGrantedForCalendar
                {
                    // Let's get the default calendar associated with our event store
                    self.defaultCalendar = self.eventStore.defaultCalendarForNewEvents;
                    // Enable the Add button  
                    
                }



#pragma mark -
#pragma mark EKEventEditViewDelegate

// Overriding EKEventEditViewDelegate method to update event store according to user actions.
- (void)eventEditViewController:(EKEventEditViewController *)controller
		  didCompleteWithAction:(EKEventEditViewAction)action
{
    NSLog(@"eventEditViewController - in");
    //ScheduleViewController * __weak weakSelf = self;
	// Dismiss the modal view controller
    [self dismissViewControllerAnimated:YES completion:^
     {
         if (action != EKEventEditViewActionCanceled)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 // Re-fetch all events happening in the next 24 hours
                 //weakSelf.eventsList = [self fetchEvents];
                 // Update the UI with the above events
                 //[weakSelf.tableView reloadData];
             });
         }
     }];
}


// Set the calendar edited by EKEventEditViewController to our chosen calendar - the default calendar.
- (EKCalendar *)eventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewController *)controller
{
    return self.defaultCalendar;
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    
    return self.container;
}

- (void) resetImageZoom {
    
    // animate the transition
    /*
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(resetAnimFinish:finished:context:)];
    [UIView setAnimationDuration:0.4];
    
    // reset the scrollview and the current image view
    self.scrollView.transform = CGAffineTransformIdentity;
    self.scrollView.contentOffset = CGPointZero;
    self.container.frame = self.scrollView.frame;
    self.container.center = self.scrollView.center;
    self.scrollView.contentSize = self.container.frame.size;
    */
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:2];
    self.scrollView.zoomScale = 1.0;
    [UIView commitAnimations];
    
}

-(void)resetAnimFinish:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    // make a copy of the image view
    UIView *copy = [[UIView alloc] initWithFrame:self.container.frame];
    copy.autoresizingMask = self.container.autoresizingMask;
    copy.contentMode = self.container.contentMode;
    copy.frame = self.container.frame;
    copy.center = self.container.center;
    
    // replace the current image view with our copy
    [self.container removeFromSuperview];
    self.container = copy;
    [self.scrollView addSubview:copy];
}


- (IBAction)eventTap:(id)sender
{
    ScheduledClassEvent *sce = sender;
    /*
    if([gestureRecognizer.view isKindOfClass:[ScheduledClassEvent class]])
      {
          sce = gestureRecognizer.view;
      }
    */
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
     {
         sce.layer.backgroundColor = (__bridge CGColorRef)([UIColor grayColor]);
         NSLog(@"access granted");
         EKEventEditViewController *addController = [[EKEventEditViewController alloc] init];
         
         EKEvent *e = [EKEvent eventWithEventStore:_eventStore];
         e.title = [sce classEventName];
         //e.startDate =
         //e.endDate =
         //NSDate *today = [NSDate date];
         //NSDateComponents *d =  [NSDateComponents init];
         //[d setHour:[sce startTime]];
         //[d setWeekday:[sce dayOfTheWeek]];
         // NSDateComponents to NSDate
         
         NSDate *today = [NSDate date];
         NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
         [gregorian setLocale:[NSLocale currentLocale]];
         
         NSDateComponents *nowComponents = [gregorian components:NSYearCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:today];
         NSDateComponents *eventComponents = [gregorian components:NSYearCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:today];
         
         NSLog(@"Todays weekday - %ld", (long)[nowComponents weekday]);
         
         
         [eventComponents setWeekday:[sce dayOfTheWeek]];
         [eventComponents setHour:[sce startHour]];
         [eventComponents setMinute:[sce startMinute]];
         [eventComponents setSecond:0];
         NSLog(@"Event weekday - %ld", (long)[eventComponents weekday]);
         
         
         if([nowComponents weekday]  >= [eventComponents weekday])
         {
             if([nowComponents hour] >= [eventComponents hour])
             {
                 [eventComponents setWeek:([eventComponents week] + 1)];
             }
         }
         
         
         
         NSDate *beginningOfWeek = [gregorian dateFromComponents:eventComponents];
         
         NSLog(@"nowcomponents weekday - %lu", (long)[nowComponents weekday]);
         
         e.startDate = beginningOfWeek;
         
         [eventComponents setHour:[sce endHour]];
         [eventComponents setMinute:[sce endMinute]];
         NSDate *endOfWeek = [gregorian dateFromComponents:eventComponents];
         e.endDate = endOfWeek;
         e.location = @"The Pit SLO";
         
         addController.eventStore = self.eventStore;
         addController.event = e;
         
         addController.editViewDelegate = self;
         
         
         [self presentViewController:addController animated:YES completion:nil];
     }];
    //[self resetImageZoom];
    //[self performSegueWithIdentifier:@"calenderDetailSegue" sender:sce];
    
    

}

@end
