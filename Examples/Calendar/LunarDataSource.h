//
//  LunarDataSource.h
//  Calendar
//
//  Created by zhouchao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    NORMAL                  = 0,
    WEEKEND                 = 1 << 0,
    SOLARTERM               = 1 << 1,
    FESTIVAL                = 1 << 2,
};

@protocol LunarDataSource <NSObject>

@property unsigned dayType;

-(void)loadDate:(NSDate*)date;
-(NSString *)MonthLunar;
-(NSString *)DayLunar;
-(NSString *)ZodiacLunar;
-(NSString *)YearHeavenlyStem;
-(NSString *)MonthHeavenlyStem;
-(NSString *)DayHeavenlyStem;
-(NSString *)YearEarthlyBranch;
-(NSString *)MonthEarthlyBranch;
-(NSString *)DayEarthlyBranch;
-(NSString *)SolarTermTitle;

@end
