//
//  CalenderDetailController.h
//  thePitApp
//
//  Created by David Rice on 12/9/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalenderDetailController : UIViewController

@property (strong, nonatomic) NSArray *classInfo;
@property (strong , nonatomic) IBOutlet UILabel *classNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayOfWeekLabel;
@property (strong, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *attending;

@end
