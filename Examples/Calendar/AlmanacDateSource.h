//
//  AlmanacDateSource.h
//  Calendar
//
//  Created by zhouchao on 12-9-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlmanacDateSource <NSObject>

-(void)loadDate:(NSDate*)date;

-(NSString*) compatibility;
-(NSString*) incompatibility;

@end
