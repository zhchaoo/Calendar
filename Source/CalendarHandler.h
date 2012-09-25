//
//  CalendarHandler.h
//  Calendar
//
//  Created by zhouchao on 12-9-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKCalendarView.h"
#import "LunarCalendar.h"

@interface CalendarHandler : NSObject <CKCalendarDelegate>
{
    LunarCalendar *lunarCalendar;
}

@end
