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

-(NSUInteger)getDayOfTheWeek
{
    return _dayOfTheWeek;
}

- (void)setStartHour:(NSUInteger)startHour
{
    _startHour = startHour;
    [self setNeedsDisplay];
}
/*
-(NSUInteger)getStartHour
{
    return _startHour;
}*/

- (void)setEndHour:(NSUInteger)endHour
{
    _endHour = endHour;
    [self setNeedsDisplay];
}
/*
-(NSUInteger)getEndHour
{
    return _endHour;
}*/

- (void)setStartMinute:(NSUInteger)startMinute
{
    _startMinute = startMinute;
    [self setNeedsDisplay];
}
/*
-(NSUInteger)getStartMinute
{
    return _startMinute;
}
*/
- (void)setEndMinute:(NSUInteger)endMinute
{
    _endMinute = endMinute;
    [self setNeedsDisplay];
}

-(NSUInteger)getEndMinute
{
    return _endMinute;
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
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
    if(_fillColor == NULL)
    {
        [[UIColor whiteColor] setFill];
    }
    else
    {
        [_fillColor setFill];//[[UIColor whiteColor] setFill];
    }
    UIRectFill(self.bounds);
    
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    /*
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *dict = @{ NSFontAttributeName: [UIFont systemFontOfSize:8],
                            NSParagraphStyleAttributeName: paragraphStyle,
                            NSForegroundColorAttributeName: [UIColor blueColor],
                            };
    

    NSMutableAttributedString  *className;
        className = [[NSMutableAttributedString alloc] initWithString:@"Closed" attributes:dict];
    
    if(_classEventName != nil && ![_classEventName  isEqual: @""])
    {
        NSLog(@"classEventName is not nil");
        className = [[NSMutableAttributedString alloc] initWithString:_classEventName attributes:dict];
    }
    self.titleLabel.attributedText = className;
    //CGRect nameRect = CGRectInset(self.bounds, self.bounds.size.width, self.bounds.size.height);
    //NSString *text = @"Lorem ipsum";
    [_classEventName drawInRect:rect withAttributes:dict];
    */
[[UIColor blackColor] setStroke];
[roundedRect stroke];

}


#pragma mark - Gesture Handlers
/*
- (void)tap:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tap");
}
*/

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

