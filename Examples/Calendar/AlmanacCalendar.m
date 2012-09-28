//
//  AlmanacCalendar.m
//  Calendar
//
//  Created by zhouchao on 12-9-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AlmanacCalendar.h"
#import "FMDatabase.h"

#define DB_NAME @"almanac.db"
#define TABLE_NAME @"Almanac"

#define COL_YEAR @"Year"
#define COL_MONTH @"Month"
#define COL_DAY @"Day"

#define COL_YI @"Yi"
#define COL_JI @"Ji"

@implementation AlmanacCalendar

-(id) init
{
    self = [super init];
    if (self) {
        BOOL database = [self initDatabase];
        
#pragma unused(database)
        
    }
    return self;
}

- (BOOL)initDatabase
{
	BOOL success;
	NSError *error;
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	
	success = [fm fileExistsAtPath:writableDBPath];
	
	if(!success){
		NSString *defaultDBPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:DB_NAME];
		NSLog(@"%@",defaultDBPath);
		success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if(!success){
			NSLog(@"error: %@", [error localizedDescription]);
		}
		success = YES;
	}
	
	if(success){
		mdb = [FMDatabase databaseWithPath:writableDBPath];
		if ([mdb open]) {
			[mdb setShouldCacheStatements:YES];
		}else{
			NSLog(@"Failed to open database.");
			success = NO;
		}
	}
	
	return success;
}

-(void) loadDate:(NSDate *)date
{
    if (date == nil) {
        [self loadDate:[NSDate date]];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        
        [dateFormatter setDateFormat:@"yyyy"];
        year = [[dateFormatter stringFromDate:date] intValue];
        
        [dateFormatter setDateFormat:@"MM"];
        month = [[dateFormatter stringFromDate:date] intValue];
        
        [dateFormatter setDateFormat:@"dd"];
        day = [[dateFormatter stringFromDate:date] intValue];
        
        thisdate = date;
    }
   
    
    
    //Select
//    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0];
        
    FMResultSet *rs = [mdb executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ where %@ = '%d' AND %@ = '%d' AND %@ = '%d'", TABLE_NAME, COL_YEAR, year, COL_MONTH, month, COL_DAY, day]];
//    FMResultSet *rs = [mdb executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@", TABLE_NAME]];
    NSLog(@"Sql query %@\n", rs.query);
    while ([rs next]) {
        NSLog(@"Y %@ J %@ \n", [rs stringForColumn:COL_YI], [rs stringForColumn:COL_JI]);
    }
    
    [rs close];
}

-(NSString*) compatibility
{
    return nil;
}

-(NSString*) incompatibility
{
    return nil;
}
                       
-(NSString *)SQL:(NSString *)sql inTable:(NSString *)table {
   return [NSString stringWithFormat:sql, table];
} 

@end
