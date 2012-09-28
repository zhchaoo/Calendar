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
@property(nonatomic, retain) UILabel* yilabel;
@property(nonatomic, retain) UILabel* jilabel;

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
        [self addSubview:dateContainer];
        self.dateContainer = dateContainer;
        
    }
    return self;
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
