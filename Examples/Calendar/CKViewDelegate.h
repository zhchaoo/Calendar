//
//  CKViewDelegate.h
//  Calendar
//
//  Created by zhouchao on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CKViewDelegate <NSObject>

- (void)didSelectDate:(NSDate *)date;

@end
