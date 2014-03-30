//
//  ScheduleViewContainer.m
//  thePitApp
//
//  Created by David Rice on 3/29/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import "ScheduleViewContainer.h"

@interface ScheduleViewContainer ()<EKEventEditViewDelegate>

// EKEventStore instance associated with the current Calendar application
@property (nonatomic, strong) EKEventStore *eventStore;

// Default calendar associated with the above event store
@property (nonatomic, strong) EKCalendar *defaultCalendar;

// Array of all events happening within the next 24 hours
@property (nonatomic, strong) NSMutableArray *eventsList;

@end

@implementation ScheduleViewContainer

@synthesize fkMon10;

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
    
    // Initialize the event store
	self.eventStore = [[EKEventStore alloc] init];
    // Initialize the events list
	self.eventsList = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    
    [fkMon10 setClassEventName:@"Fitness Kickboxing"];
    [fkMon10 setStartHour:10];
    [fkMon10 setStartMinute:0];
    [fkMon10 setEndHour:11];
    [fkMon10 setEndMinute:0];
    [fkMon10 setDayOfTheWeek:1];
    [fkMon10 setFillColor:[UIColor whiteColor]];
    
    
    
    fkMon10.userInteractionEnabled = true;
    
    NSArray *events = [[NSArray alloc] initWithObjects:fkMon10, nil];
    
    for(ScheduledClassEvent *e in events)
    {
        NSLog(@"inloop");
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
        tap.numberOfTapsRequired = 1;
        [tap setNumberOfTapsRequired:1];
        //[tap setNumberOfTouchesRequired:1];
        [e addGestureRecognizer:tap];
    }
    
    // Do any additional setup after loading the view.
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
}

- (ScheduledClassEvent*)setScheduledClassEventWithName:(NSString *)classEventName andStartHour:(NSUInteger)startHour andStartMinute:(NSUInteger)startMinute andEndHour:(NSUInteger)endHour andEndMinute:(NSUInteger)endMinute andDayOfTheWeek:(NSUInteger)dayOfTheWeek andFillColor:(UIColor*)fillColor
{
    ScheduledClassEvent *dummy;
    [dummy setClassEventName:classEventName];
    [dummy setStartHour:startHour];
    [dummy setStartMinute:startMinute];
    [dummy setEndHour:endHour];
    [dummy setEndMinute:endMinute];
    [dummy setDayOfTheWeek:dayOfTheWeek];
    [dummy setFillColor:fillColor];
    return dummy;
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
         
         
         if([nowComponents weekday]  > [eventComponents weekday])
         {
             //if([nowComponents hour] > [eventComponents hour])
             //{
             [eventComponents setWeek:([eventComponents week] + 1)];
             //}
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
    //[self performSegueWithIdentifier:@"calenderDetailSegue" sender:sce];
    
    
}


#pragma mark - Navigation

 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
if ([[segue identifier] isEqualToString:@"showEventViewController"])
{
    // Configure the destination event view controller
    EKEventViewController* eventViewController = (EKEventViewController *)[segue destinationViewController];
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
             ScheduleViewContainer * __weak weakSelf = self;
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

@end
