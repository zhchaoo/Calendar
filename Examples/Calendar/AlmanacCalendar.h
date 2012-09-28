//
//  AlmanacCalendar.h
//  Calendar
//
//  Created by zhouchao on 12-9-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlmanacDateSource.h"

@class FMDatabase;

@interface AlmanacCalendar : NSObject <AlmanacDateSource>
{
    NSDate* thisdate;
    FMDatabase* mdb;
    
    int year;
    int month;
    int day;
}

-(BOOL)initDatabase;

@end
