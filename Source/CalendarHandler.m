//
//  CalendarHandler.m
//  Calendar
//
//  Created by zhouchao on 12-9-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CalendarHandler.h"

@implementation CalendarHandler

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    [lunarCalendar loadWithDate:date];
    [lunarCalendar InitializeValue];
    NSLog(@"LunarDate is %@ %@ %@ %@\n", [lunarCalendar YearHeavenlyStem], [lunarCalendar YearEarthlyBranch], [lunarCalendar MonthLunar], [lunarCalendar DayLunar]);
}

- (id) init {
    self = [super init];
    if (self) {
        lunarCalendar = [[LunarCalendar alloc] init];
    }
    return self; 
}

@end
