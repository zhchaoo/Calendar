//
//  LunarDataSource.h
//  Calendar
//
//  Created by zhouchao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LunarDataSource <NSObject>

-(void)initWithDate:(NSDate*)date;
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
