//
//  ContactViewController.m
//  thePitApp
//
//  Created by David Rice on 11/3/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController
{
    CLLocationManager *locationManager;
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)callThePit:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:18055498800"]];
}

- (IBAction)emailThePit:(id)sender
{
    
    if(MFMailComposeViewController.canSendMail)
    {
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc]init];
        controller.mailComposeDelegate = self;
        NSArray *recipients = [[NSArray alloc]initWithObjects:@"contact@thepitslo.com", nil];
        [controller setToRecipients:recipients];
        [self presentViewController:controller animated:YES completion:nil];
        //check later, if doesn't work, do the ghetto mailto way
    }
    else
    {
        NSLog(@"cannot send email");
        //put a pop up dialog in here
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[self becomeFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)gpsToThePit:(id)sender
{
    //pit coordinates
    double latitude = 0;
    double longitude = 0;
    
    NSString *addressString = [NSString stringWithFormat:@"1285 Laurel Lane San Luis Obispo California 93401"];
    NSString *esc_addr =  [addressString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D destination;
    destination.latitude = latitude;
    destination.longitude = longitude;
    
    //current location coordinates
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    
    MKUserLocation *currentLoc;
    CLLocation *loc = currentLoc.location;
    
    NSLog(@"Current loc - latitude %g longitude %g", loc.coordinate.latitude, loc.coordinate.longitude);
    NSLog(@"Dest loc - latitude %g longitude %g", destination.latitude, destination.longitude);
    
    /*
    if(nil == loc)
    {
        NSLog(@"cur loc is nil");
        return;
    }
     */
        Class itemClass = [MKMapItem class];
        if (itemClass && [itemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])//can open with map app
        {
            MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
            MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:destination addressDictionary:nil] ];
            toLocation.name = @"Destination";
            [MKMapItem openMapsWithItems:[NSArray arrayWithObjects:currentLocation, toLocation, nil]
                           launchOptions:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeDriving, [NSNumber numberWithBool:YES], nil]
                                                                     forKeys:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeKey, MKLaunchOptionsShowsTrafficKey, nil]]];
        }
        else //google maps online
        {
            NSMutableString *mapURL = [NSMutableString stringWithString:@"http://maps.google.com/maps?"];
            [mapURL appendFormat:@"saddr=Current Location"];
            [mapURL appendFormat:@"&daddr=%f,%f", destination.latitude, destination.longitude];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[mapURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        }
}

@end
