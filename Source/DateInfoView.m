//
//  DateInfoView.m
//  Calendar
//
//  Created by zhouchao on 12-9-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import "DateInfoView.h"
#import "LayoutStyle.h"

@interface DateInfoView ()

@property(nonatomic, retain) UIView* highlight;
@property(nonatomic, retain) UIView* dateContainer;

@end

@implementation DateInfoView

@synthesize yilabel = _yilabel;
@synthesize jilabel = _jilabel;

@synthesize highlight = _highlight;
@synthesize dateContainer = _dateContainer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //        self.layer.cornerRadius = 6.0f;
        self.layer.shadowOffset = CGSizeMake(2, 2);
        self.layer.shadowRadius = 2.0f;
        self.layer.shadowOpacity = 0.4f;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        
        UIView *highlight = [[UIView alloc] initWithFrame:CGRectZero];
        highlight.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
        highlight.layer.cornerRadius = 6.0f;
        [self addSubview:highlight];
        self.highlight = highlight;
        
        // set container
        UIView *dateContainer = [[UIView alloc] initWithFrame:CGRectZero];
        dateContainer.layer.borderWidth = 1.0f;
        dateContainer.layer.borderColor = [UIColor blackColor].CGColor;
        dateContainer.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        dateContainer.layer.cornerRadius = 4.0f;
        dateContainer.clipsToBounds = YES;
        CGFloat containerWidth = self.bounds.size.width - (CALENDAR_MARGIN * 2);
        CGFloat containerHeight = self.bounds.size.height - (CALENDAR_MARGIN * 2);
        dateContainer.frame = CGRectMake(CALENDAR_MARGIN, CALENDAR_MARGIN, containerWidth, containerHeight);
        [self addSubview:dateContainer];
        self.dateContainer = dateContainer;
        
        // set label
        self.yilabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, containerWidth / 2, containerHeight)];
        self.jilabel = [[UILabel alloc] initWithFrame:CGRectMake(containerWidth/2, 0, containerWidth / 2, containerHeight)];
        [dateContainer addSubview:self.yilabel];
        [dateContainer addSubview:self.jilabel];
        
        self.yilabel.backgroundColor = [UIColor clearColor];
        self.yilabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.yilabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        self.jilabel.backgroundColor = [UIColor clearColor];
        self.jilabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.jilabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        self.yilabel.numberOfLines = 0;
        self.jilabel.numberOfLines = 0;
        
        [self setDefaultStyle];
        
    }
    return self;
}


- (void)setDefaultStyle {
    self.backgroundColor = UIColorFromRGB(0x393B40);
    self.dateContainer.backgroundColor = UIColorFromRGB(0xDAE1E6);
    
    self.yilabel.textColor = [UIColor redColor];
    self.jilabel.textColor = [UIColor greenColor];
    
    self.yilabel.textAlignment = UITextAlignmentLeft;
    self.jilabel.textAlignment = UITextAlignmentRight;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
