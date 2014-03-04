//
//  BeltProgressImage.m
//  thePitApp
//
//  Created by David Rice on 2/11/14.
//  Copyright (c) 2014 David Rice. All rights reserved.
//

#import "BeltProgressImage.h"

@implementation BeltProgressImage

#pragma mark - Properties

NSArray *keys;
NSArray *colorImagePaths;
NSDictionary *colors;// = [NSDictionary dictionaryWithObjects:keys forKeys:colorImagePaths];

#pragma mark - end properties

- (NSString*)getColor
{
    return _color;
}

- (void)setColor:(NSString*)color
{
    _color = color;
    [self setNeedsDisplay];
}

- (NSUInteger) getProgressValue
{
    return _progressValue;
}

- (void)setProgressValue:(NSUInteger)progressValue
{
    _progressValue = progressValue;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#define CORNER_RADIUS 0.0

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    //NSAttributedString *text;
    //UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    //[roundedRect addClip];
    
    keys = [NSArray arrayWithObjects:@"Blue", @"Red", nil];
    colorImagePaths = [NSArray arrayWithObjects:@"blue.jpg", @"red.jpg", nil];
    colors = [NSDictionary dictionaryWithObjects:colorImagePaths forKeys:keys];
    
    UIImage *beltImage = [UIImage imageNamed:@"belt_transparent.png"];
    NSString *backgroundImagePath = [colors objectForKey:_color];
    UIImage *backgroundImage = [UIImage imageNamed:backgroundImagePath];
    
    UIImageView *view = [[UIImageView alloc] initWithImage:beltImage];
    
    //CGRect background = view.frame;
    CGFloat widthFraction = view.frame.size.width/37.50;
    
    //30,32,34 , 600 belt width, 660 width from origin, 730 total width
    
    /*
    CGFloat x = view.frame.origin.x
    CGFloat y = view.frame.origin.y
    CGFloat width = _progressValue*widthFraction;
     
    CGRect background = CGRectMake(x, y, width, view.frame.size.height)
    */
    
    //UIGraphicsBeginImageContextWithOptions - use later for better image
    
    
    
    UIGraphicsBeginImageContext(beltImage.size);
    
    
    [backgroundImage drawInRect:CGRectMake(0, 0, (widthFraction*(3.97 + _progressValue)), backgroundImage.size.height)];
    //[beltImage drawInRect:CGRectMake(backgroundImage.size.width - beltImage.size.width, backgroundImage.size.height - beltImage.size.height, beltImage.size.width, beltImage.size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [result drawInRect:rect];
    [beltImage drawInRect:rect];
    
}


@end
