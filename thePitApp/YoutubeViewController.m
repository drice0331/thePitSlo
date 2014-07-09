//
//  YoutubeViewController.m
//  thePitApp
//
//  Created by David Rice on 12/20/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import "YoutubeViewController.h"

#import "YoutubeDetailController.h"

@interface YoutubeViewController ()
{
    NSMutableArray *videos;
}
@end

@implementation YoutubeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://gdata.youtube.com/feeds/api/users/UCIyJyNFVRJpce6wmYUNtMNw/uploads?alt=json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSString *jsonString = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingAllowFragments error:nil];
    
    NSDictionary *feed = [[NSDictionary alloc] initWithDictionary:[jsonDict valueForKey:@"feed"]];
    videos = [NSMutableArray arrayWithArray:[feed valueForKey:@"entry"]];
    [self.tableView reloadData];

    
    //GTLService *service = [[GTLService alloc]init];
    //GDataServiceGoogleYouTube *service = [self youTubeService];
    
    //NSURL *feedURL = [NSURL URLWithString:@"http://gdata.youtube.com/feeds/api/users/UCIyJyNFVRJpce6wmYUNtMNw/uploads"];
    // make API call
    
    /*[service fetchFeedWithURL:feedURL
                     delegate:self
            didFinishSelector:@selector(playlistTicket:finishedWithFeed:error:)];*/
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkForConnection
{
    
    Reachability *internetReachability = [Reachability reachabilityWithHostName:@"www.youtube.com"];
    NetworkStatus statusInternet = [internetReachability currentReachabilityStatus];
    if(statusInternet != ReachableViaWWAN)
    {
        UIAlertView *noConnectionAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Can't connect. Please check Internet connection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil , nil];
        [noConnectionAlert show];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return videos.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *video = videos[indexPath.row];
    NSString *title = [video valueForKeyPath:@"title.$t"];
    NSArray *thumbnails = [video valueForKeyPath:@"media$group.media$thumbnail"];
    NSString *thumbnailImage = [thumbnails[0] valueForKeyPath:@"url"];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = title;
    
    NSURL *url = [[NSURL alloc] initWithString:thumbnailImage];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:imageData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    NSDictionary *video = videos[indexPath.row];
    
    NSDictionary *content = [video valueForKeyPath:@"media$group.media$content"][0];
    NSString *url = [content valueForKeyPath:@"url"];
    
    NSDictionary *content2 = [video valueForKeyPath:@"media$group.media$player"][0];
    NSString *shareurl = [content2 valueForKeyPath:@"url"];
    
    YoutubeDetailController *detailViewController = [segue destinationViewController];
    detailViewController.url = url;
    detailViewController.shareurl = shareurl;
    
}
/*
- (void)playlistTicket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedYouTubePlaylist *)feed error:(NSError *)error {
    
    if(!error)
    {
        // save the feed and reload the table
        self.feed = feed;
        [self.tableView reloadData];
    }*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
