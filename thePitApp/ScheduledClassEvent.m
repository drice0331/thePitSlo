//
//  ScheduledClassEvent.m
//  thePitApp
//
//  Created by David Rice on 11/14/13.
//  Copyright (c) 2013 David Rice. All rights reserved.
//

#import "ScheduledClassEvent.h"

@interface ScheduledClassEvent()
@end

@implementation ScheduledClassEvent

#pragma mark - Properties


#pragma mark - end properties

- (void)setClassEventName:(NSString*)classEventName
{
    _classEventName = classEventName;
    [self setNeedsDisplay];
}

- (NSString*)getClassName
{
    return _classEventName;
}

- (void)setDayOfTheWeek:(NSUInteger)dayOfTheWeek
{
    _dayOfTheWeek = dayOfTheWeek;
    [self setNeedsDisplay];
}

- (void)setStartTime:(NSUInteger)startTime
{
    _startTime = startTime;
    [self setNeedsDisplay];
}

- (void)setEndTime:(NSUInteger)endTime
{
    _endTime = endTime;
    [self setNeedsDisplay];
}

- (void)setClicked:(BOOL)clicked
{
    _clicked = clicked;
    [self setNeedsDisplay];
}

#define CORNER_RADIUS 0.0

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    //NSAttributedString *text;
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    NSDictionary *dict = @{ NSFontAttributeName: [UIFont systemFontOfSize:8],
                            NSParagraphStyleAttributeName: [NSParagraphStyle defaultParagraphStyle],
                            NSForegroundColorAttributeName: [UIColor blueColor]};
    //CGRect nameRect = CGRectInset(self.bounds, self.bounds.size.width, self.bounds.size.height);
    //NSString *text = @"Lorem ipsum";
    [_classEventName drawInRect:rect withAttributes:dict];
    
[[UIColor blackColor] setStroke];
[roundedRect stroke];

}


#pragma mark - Gesture Handlers

- (void)tap:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tap");
}


#pragma mark - Initialization

- (void)setup
{
    // do initialization here
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
