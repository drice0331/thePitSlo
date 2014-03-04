//
//  ScheduleViewController.m
//  thePitApp
//
//  Created by David Rice on 10/25/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController () <EKEventEditViewDelegate>

// EKEventStore instance associated with the current Calendar application
@property (nonatomic, strong) EKEventStore *eventStore;

// Default calendar associated with the above event store
@property (nonatomic, strong) EKCalendar *defaultCalendar;

// Array of all events happening within the next 24 hours
@property (nonatomic, strong) NSMutableArray *eventsList;

@end

@implementation ScheduleViewController

@synthesize fkMon10;
@synthesize wres;
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
    
    // Initialize the event store
	self.eventStore = [[EKEventStore alloc] init];
    // Initialize the events list
	self.eventsList = [[NSMutableArray alloc] initWithCapacity:0];
    
    [fkMon10 setClassEventName:@"Fitness Kickboxing"];
    [fkMon10 setStartTime:10];
    [fkMon10 setEndTime:11];
    [fkMon10 setDayOfTheWeek:1];
    
    [wres setClassEventName:@"Wrestling"];
    [wres setStartTime:10];
    [wres setEndTime:11];
    [wres setDayOfTheWeek:1];
    
    fkMon10.userInteractionEnabled = true;
    wres.userInteractionEnabled = true;
    
    NSArray *events = [[NSArray alloc] initWithObjects:fkMon10, wres, nil];
    
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
        

    addController.eventStore = self.eventStore;
        addController.event = e;
        
    addController.editViewDelegate = self;
    
    
    [self presentViewController:addController animated:YES completion:nil];
    }];
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
    
    /*
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        // the selector is available, so we must be on iOS 6 or newer
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{// not sure if this line needed
                if (error)
                {
                    // display error message here
                }
                else if (!granted)
                {
                    // display access denied error message here
                }
                else
                {
                    //access granted
                    
                    // ***** do the important stuff here *****
                    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
                    EKRecurrenceDayOfWeek *eventDayOfWeek = [EKRecurrenceDayOfWeek dayOfWeek:1];
                    NSArray *daysOfTheWeek = [[NSArray alloc] initWithObjects:eventDayOfWeek, nil];//
                    
                    
                    //one year from now
                    NSTimeInterval NSOneMonth = 30 * 24 * 60 * 60;
                    NSDateComponents *dateComps = [[NSDateComponents alloc]init];
                    
                    NSInteger dummyhour = 12;
                    NSInteger dummyMonth = 1;
                    NSInteger dummyYear = 2014;
                    NSInteger dummyDay = 5;
                    
                    [dateComps setYear:dummyYear];
                    [dateComps setDay:dummyDay];
                    [dateComps setMonth:dummyMonth];
                    [dateComps setHour:dummyhour];
                    
                    NSDate *oneMonthFromNow = [[[NSDate alloc]init] dateByAddingTimeInterval:NSOneMonth];
                    //Create an Event Kit date from this date
                    EKRecurrenceEnd *recurringEnd = [EKRecurrenceEnd recurrenceEndWithEndDate:oneMonthFromNow];
                    
                    EKRecurrenceRule *rule = [[EKRecurrenceRule alloc] initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:1 daysOfTheWeek:daysOfTheWeek daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:recurringEnd];//
                    
                    [event setRecurrenceRules:[[NSArray alloc] initWithObjects:rule, nil]];
                    
                    NSDateComponents *comps;
                    [comps setHour:12];
                    [comps setMinute:0];
                    NSDate *eventStartDate;
                    
                    //NSDate *start = [[NSCalendar alloc] dateByAddingComponents:comps toDate:<#(NSDate *)#> options:<#(NSCalendarOptions)#>];
                    
                    event.title = @"Event Title";
                    event.startDate = [NSDate date]; //today
                    event.endDate = [event.startDate dateByAddingTimeInterval:60*60];  //set 1 hour meeting
                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                    NSError *err = nil;
                    [eventStore saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
                    //NSString *savedEventId = event.eventIdentifier;  //this is so you can access this event later
                    
                    NSError *saveError = nil;
                    //Save the event
                    if ([eventStore saveEvent:event
                                         span:EKSpanFutureEvents
                                        error:&saveError])
                    {
                        NSLog(@"Successfully created the recurring event.");
                    }
                    else
                    {
                        NSLog(@"Failed to create the recurring event %@", saveError);
                    }
                    
                }
            });
        }];
    }
    else
    {
        // this code runs in iOS 4 or iOS 5
        // ***** do the important stuff here *****
    }
    
    */
    
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
    ScheduleViewController * __weak weakSelf = self;
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

- (void) createRecurringEventInLocalCalendar{
    
    
}


@end
