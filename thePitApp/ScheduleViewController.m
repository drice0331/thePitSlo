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
@synthesize wres;
@synthesize openMon3;
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
    
    
    
    [fkMon10 setClassEventName:@"Fitness Kickboxing"];
    [fkMon10 setStartHour:10];
    [fkMon10 setStartMinute:0];
    [fkMon10 setEndHour:11];
    [fkMon10 setEndMinute:0];
    [fkMon10 setDayOfTheWeek:2];
    [fkMon10 setFillColor:[UIColor redColor]];
    
    [pjMon11 setClassEventName:@"Pit Jitsu"];
    [pjMon11 setStartHour:11];
    [pjMon11 setStartMinute:0];
    [pjMon11 setEndHour:12];
    [pjMon11 setEndMinute:0];
    [pjMon11 setDayOfTheWeek:2];
    [pjMon11 setFillColor:[UIColor redColor]];
    
    [openMon3 setClassEventName:@"Open Training"];
    [openMon3 setStartHour:15];
    [openMon3 setStartMinute:0];
    [openMon3 setEndHour:15];
    [openMon3 setEndMinute:30];
    [openMon3 setDayOfTheWeek:2];
    [openMon3 setFillColor:[UIColor redColor]];
    
    [wres setClassEventName:@"Wrestling"];
    [wres setStartHour:11];
    [wres setStartMinute:0];
    [wres setEndHour:12];
    [wres setEndMinute:0];
    [wres setDayOfTheWeek:4];
    [wres setFillColor:[UIColor blackColor]];

    
    
    fkMon10.userInteractionEnabled = true;
    wres.userInteractionEnabled = true;
    
    NSArray *events = [[NSArray alloc] initWithObjects:fkMon10, pjMon11, nil];
    
    for(ScheduledClassEvent *e in events)
    {
         NSLog(@"inloop");
        
        
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
